<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:variable name="new_line">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="f_Curl_cat_installer" select="//CODES/code_gen_name"/>

    <xsl:template match="/">
        
        <xsl:result-document href="{$f_Curl_cat_installer}" method="text">
            <xsl:text>mkdir -p </xsl:text>
            <xsl:value-of select="/CODES/codes_dir"/>
            <xsl:value-of select="$new_line"/>

            <xsl:text>cd </xsl:text>
            <xsl:value-of select="/CODES/codes_dir"/>
            <xsl:value-of select="$new_line"/>

            <xsl:value-of select="$new_line"/>

            <xsl:for-each select="/CODES/code">
                <xsl:text>echo Creating </xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
                <xsl:text><![CDATA[cat << ]]></xsl:text>

                <xsl:value-of select="@cat_quote"/>
                <xsl:value-of select="@cat_encloser"/>
                <xsl:value-of select="@cat_quote"/>

                <xsl:text><![CDATA[ > ]]></xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="code_content"/>

                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="@cat_encloser"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>

                <xsl:if test="string-length(symbolic_link_name) gt 0">
                    <xsl:text>echo Link </xsl:text>
                    <xsl:value-of select="symbolic_link_name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:value-of select="$new_line"/>
                    <xsl:text>ln -sf </xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="symbolic_link_name"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>

                <xsl:if test="string-length(chmod_mode) gt 0">
                    <xsl:text>chmod </xsl:text>
                    <xsl:value-of select="chmod_mode"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>

                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
            </xsl:for-each>

            <xsl:for-each select="/CODES/binary">
                <xsl:text>echo Downloading </xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>echo wget </xsl:text>
                <xsl:value-of select="git_url"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>echo curl -L </xsl:text>
                <xsl:value-of select="git_url"/>
                <xsl:text> -o </xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>curl -L </xsl:text>
                <xsl:value-of select="bsw_oci_bucket_url"/>
                <xsl:text> -o </xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
                

                <xsl:if test="string-length(unzip_dir) gt 0">
                    <xsl:text>unzip -o </xsl:text>
                    <xsl:value-of select="@name"/>
                    <xsl:text> -d </xsl:text>
                    <xsl:value-of select="unzip_dir"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>
                
                <xsl:if test="string-length(link_file) gt 0">
                    <xsl:text>ln -f </xsl:text>
                    <xsl:choose>
                        <xsl:when test="string-length(link_file/@link_target) gt 0">
                            <xsl:value-of select="link_file/@link_target"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="link_file"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>

                <xsl:if test="string-length(testing_command) gt 0">
                    <xsl:value-of select="testing_command"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>
                
                <xsl:value-of select="$new_line"/>
                
            </xsl:for-each>
            <xsl:value-of select="$new_line"/>
            <xsl:value-of select="$new_line"/>
            
            <xsl:text>echo Creating Uninstall_</xsl:text>
            <xsl:value-of select="$f_Curl_cat_installer"/>
            <xsl:value-of select="$new_line"/>
            <xsl:text><![CDATA[cat << 'EOC' > Uninstall_]]></xsl:text>
            <xsl:value-of select="$f_Curl_cat_installer"/>
            <xsl:value-of select="$new_line"/>

            <xsl:text>rm ${HOME}/dba_code/CURL/</xsl:text>
            <xsl:value-of select="$f_Curl_cat_installer"/>
            <xsl:value-of select="$new_line"/>


            <xsl:text>cd </xsl:text>
            <xsl:value-of select="/CODES/codes_dir"/>
            <xsl:value-of select="$new_line"/>

            <xsl:for-each select="/CODES/code">
                <xsl:if test="string-length(symbolic_link_name) gt 0">
                    <xsl:text>unlink </xsl:text>
                    <xsl:value-of select="symbolic_link_name"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:if>
                <xsl:text>rm </xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:value-of select="$new_line"/>
            </xsl:for-each>
            <xsl:text>rm Uninstall_</xsl:text>
            <xsl:value-of select="$f_Curl_cat_installer"/>
            <xsl:value-of select="$new_line"/>
            <xsl:text>EOC</xsl:text>
            <xsl:value-of select="$new_line"/>
            <xsl:text>chmod 600 Uninstall_</xsl:text>
            <xsl:value-of select="$f_Curl_cat_installer"/>
            <xsl:value-of select="$new_line"/>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
