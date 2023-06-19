<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:variable name="new_line">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="f_read_only_user_code" select="'Read_only_user_creation.sql'"/>

    <xsl:template match="/">
        <xsl:for-each select="//hosts/host">
            <xsl:variable name="f_host_code">
                <xsl:value-of select="@host_name"/>
                <xsl:text>.sh</xsl:text>
            </xsl:variable>
            <xsl:result-document href="{$f_host_code}" method="text">
                <xsl:text># </xsl:text>
                <xsl:value-of select="$f_host_code"/>
                <xsl:value-of select="$new_line"/>
                <xsl:value-of select="$new_line"/>

                <xsl:for-each select="cdb">
                    <xsl:text>. ${HOME}/</xsl:text>
                    <xsl:value-of select="@cdb_name"/>
                    <xsl:text>.env</xsl:text>
                    <xsl:value-of select="$new_line"/>
                    <xsl:value-of select="$new_line"/>
                </xsl:for-each>


            </xsl:result-document>
        </xsl:for-each>
        <xsl:result-document href="{$f_read_only_user_code}" method="text">
            <xsl:for-each select="//user_list/user/@user_id">
                <xsl:text>@PS_read_only_user.sql </xsl:text>
                <xsl:value-of select="."/>
                <xsl:value-of select="$new_line"/>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
