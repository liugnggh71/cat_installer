<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.test.com/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:variable name="f_css" select="'code_schema.css'"/>
    <xsl:variable name="v_new_line" select="'&#xa;'"/>
    <xsl:template match="/">
        <xsl:result-document href="{$f_css}" method="text">
            <xsl:for-each select="//Helement[@name]">
                <xsl:choose>
                    <xsl:when test="position() = 1">
                        <xsl:value-of select="@name"/>
                        <xsl:text><![CDATA[ {
    width:1110px;
    margin: 0 auto;
    counter-reset:count;
    display:block;
}

]]></xsl:text>
                    </xsl:when>
                    <xsl:when test="position() = 2">
                        <xsl:value-of select="@name"/>
                        <xsl:text><![CDATA[  {
    text-align:center;
    font-size:35px;
    font-weight:bold;
    display:block;
}

]]></xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@name"/>
                        <xsl:text><![CDATA[ {
    visibility:-oxy-collapse-text;
    display:block;
}

]]></xsl:text>
                        <xsl:value-of select="@name"/>
                        <xsl:text><![CDATA[:before {
    counter-increment:count;
    visibility:visible;
}

]]></xsl:text>
                        <xsl:value-of select="@name"/>
                        <xsl:text><![CDATA[:before {
    content:
        counter(count) ". "
        oxy_label(text, "]]></xsl:text>
                        
                        <xsl:value-of select="@name"/>
                        
                        <xsl:text><![CDATA[:", width, 40%) 
        oxy_textfield(edit, '#text', columns, 60)
]]></xsl:text>
                        <xsl:for-each select=".//Hattribute">
                            <xsl:text> oxy_label(text, "</xsl:text>
                            
                            <xsl:value-of select="@name"/>
                            <xsl:text>", width, 40%)</xsl:text>
                            <xsl:value-of select="$v_new_line"/>
                            <xsl:text> oxy_textfield(edit, '@</xsl:text>
                            <xsl:value-of select="@name"/>
                            <xsl:text>',  columns, 60)</xsl:text>
                            <xsl:value-of select="$v_new_line"/>
                        </xsl:for-each>
                        <xsl:text><![CDATA[
}

]]></xsl:text>
                        
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
