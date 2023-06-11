<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:variable name="new_line">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="f_Curl_cat_installer">
        <xsl:text>Curl_cat_install.sh</xsl:text>
    </xsl:variable>
    
    

    <xsl:template match="/">
        <xsl:result-document href="{$f_Curl_cat_installer}" method="text">
            <xsl:text># Create and Go to dba CURL directory</xsl:text>
            <xsl:value-of select="$new_line"/>
            <xsl:text>echo Create and Go to dba CURL directory</xsl:text>
            <xsl:value-of select="$new_line"/>
            <xsl:value-of select="$new_line"/>
            
            <xsl:text>mkdir -p </xsl:text>
            <xsl:value-of select="/CURLS/CURL_DIR"/>
            <xsl:value-of select="$new_line"/>
            
            <xsl:text>cd </xsl:text>
            <xsl:value-of select="/CURLS/CURL_DIR"/>
            <xsl:value-of select="$new_line"/>
            <xsl:value-of select="$new_line"/>
            
            <xsl:for-each select="/CURLS/curl">
                <xsl:text># C</xsl:text>
                <xsl:value-of select="installer_seq"/>
                <xsl:text> CURL_</xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
                <xsl:text>echo C</xsl:text>
                <xsl:value-of select="installer_seq"/>
                <xsl:text> CURL_</xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text><![CDATA[cat << 'EOC' > CURL_]]></xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>echo Download </xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>curl -L </xsl:text>
                <xsl:value-of select="object_store_URL1"/>
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text> -o </xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>chmod u+x </xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>ln -sf </xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:text> I</xsl:text>
                <xsl:value-of select="installer_seq"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>EOC</xsl:text>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
                
                <xsl:text>chmod u+x CURL_</xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:value-of select="$new_line"/>

                <xsl:text>ln -sf CURL_</xsl:text>
                <xsl:value-of select="installer_local_name"/>
                <xsl:text> C</xsl:text>
                <xsl:value-of select="installer_seq"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>
                
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
