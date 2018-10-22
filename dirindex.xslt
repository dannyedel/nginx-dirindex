<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />
<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/dirindex.css" />
		<meta name="viewport" content="width=device-width,initial-scale=1" />
	</head>
	<body>
		<h1>
			Index of <xsl:value-of select="$location" />
		</h1>
		<p id="fixmemessage">
			If you don't like how this looks, patches to
			<a href="https://github.com/dannyedel/nginx-dirindex">
				this script
			</a>
			are very welcome!
		</p>
		<div id="dotdot">
			<a href=".." class="dotdot">[parent directory] ..</a>
		</div>
		<div id="subdirectories">
			<xsl:for-each select="list/directory">
				<xsl:if test="not(. = 'lost+found')">
				<div class="subdir">
					<div class="dirtag">[dir]</div>
					<xsl:variable name="name">
						<xsl:value-of select="." />
					</xsl:variable>
					<div class="name">
						<a href="{$name}">
							<xsl:value-of select="." />/
						</a>
					</div>
					<div class="mtime">
						<xsl:value-of select="@mtime" />
					</div>
				</div>
			</xsl:if>
			</xsl:for-each>
		</div>
		<div id="files">
			<xsl:for-each select="list/file">
				<xsl:variable name="size">
					<xsl:if test="string-length(@size) &gt; 0">
						<xsl:if test="number(@size) &gt; 0">
							<xsl:choose>
								<xsl:when test="round(@size div 1024) &lt; 1">
									<xsl:value-of select="@size" />
								</xsl:when>
								<xsl:when test="round(@size div 1048576) &lt; 1">
									<xsl:value-of select="format-number((@size div 1024), '0.0')" />K
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="format-number((@size div 1048576), '0.00')" />M
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="name"><xsl:value-of select="." /></xsl:variable>
				<div class="file">
					<div class="name">
						<a href="{$name}">
							<xsl:value-of select="." />
						</a>
					</div>
					<div class="size">
						<xsl:value-of select="$size" />
					</div>
					<div class="downloadlink">
						<a href="{$name}?download">
							[download]
						</a>
					</div>
					<div class="mtime">
						<xsl:value-of select="@mtime" />
					</div>
				</div>
			</xsl:for-each>
		</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>
