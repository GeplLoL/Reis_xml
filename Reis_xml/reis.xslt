<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/reisi">
		<html>
			<head>
				<title>Reiside kuvamine</title>
				<style>
					body {
					font-family: Arial, sans-serif;
					background-color: #f5f5f5;
					margin: 0;
					padding: 20px;
					}
					h1 {
					color: darkblue;
					text-align: center;
					}
					ul {
					list-style-type: disc;
					margin: 0;
					padding: 0 0 0 20px;
					}
					li {
					margin: 5px 0;
					}
					.yellow-background {
					background-color: yellow;
					font-weight: bold;
					padding: 5px;
					}
					.red-background {
					background-color: red;
					color: white;
					font-weight: bold;
					padding: 5px;
					}
					.container {
					max-width: 1400px;
					margin: 0 auto;
					}
					table {
					width: 100%;
					border-collapse: collapse;
					margin: 20px 0;
					font-size: 18px;
					box-shadow: 0 2px 3px rgba(0,0,0,0.1);
					}
					th {
					background-color: #4CAF50;
					color: white;
					padding: 12px 15px;
					text-align:center;
					}
					td {
					padding: 12px 15px;
					border-bottom: 1px solid #ddd;
					text-align:center;
					}
					tr:nth-child(even) {
					background-color: #f9f9f9;
					}
					tr:nth-child(odd) {
					background-color: #e0e0e0;
					}
					tr:hover {
					background-color: #f1f1f1;
					}
				</style>
			</head>
			<body>
				<div class="container">
					<h1>Koik Reiside Andmed</h1>
					<table border="1">
						<thead>
							<tr>
								<th>Koht</th>
								<th>Transport</th>
								<th>Hind</th>
								<th>Kestvus (päeva)</th>
								<th>Lennujaam</th>
								<th>Reisi kuupäev</th>
								<th>Kogukulu (+20%)</th>
							</tr>
						</thead>
						<tbody>
							<xsl:apply-templates select="reis"/>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="reis">
		<div>
			<h2>
				<xsl:value-of select="sihtkoht" />
			</h2>
			<ul>
				<li>
					<strong>Transport:</strong>
					<xsl:value-of select="transport" />
				</li>
				<li>
					<strong>Kestvus:</strong> <xsl:value-of select="kestus" /> päeva
				</li>
				<li>
					<strong>Lennujaam:</strong>
					<xsl:value-of select="lennufirma" />
				</li>
				<li>
					<strong>Reisi kuupäev:</strong>
					<xsl:value-of select="reisi_kuupäev" />
				</li>
				<li>
					<strong>Hind:</strong>
					<xsl:choose>
						<xsl:when test="number(translate(hind, '$', '')) &gt; 5.00">
							<span class="red-background">
								<xsl:value-of select="hind" />
							</span>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="hind" />
						</xsl:otherwise>
					</xsl:choose>
				</li>
				<li class="yellow-background">
					<strong>Kogukulu:</strong>
					<xsl:variable name="baseCost" select="number(translate(hind, '$', ''))"/>
					<xsl:variable name="proviCost" select="number(translate(provi, '$', ''))"/>
					<xsl:variable name="excursionCost" select="number(translate(eksursioonid, '$', ''))"/>
					<xsl:variable name="otherCost" select="number(translate(muid, '$', ''))"/>
					<xsl:variable name="totalCost" select="$baseCost + $proviCost + $excursionCost + $otherCost + ($baseCost * 0.2)"/>
					<xsl:value-of select="format-number(number(translate(hind, '$', '')) * 1.2, '$#0.00')" />				
				</li>
			</ul>
		</div>

		<tr>
			<td>
				<xsl:value-of select="sihtkoht" />
			</td>
			<td>
				<xsl:value-of select="transport" />
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="number(translate(hind, '$', '')) &gt; 5.00">
						<span class="red-background">
							<xsl:value-of select="hind" />
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="hind" />
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:value-of select="kestus" />
			</td>
			<td>
				<xsl:value-of select="lennufirma" />
			</td>
			<td>
				<xsl:value-of select="reisi_kuupäev" />
			</td>
			<td class="yellow-background">
				<xsl:variable name="baseCost" select="number(translate(hind, '$', ''))"/>
				<xsl:variable name="proviCost" select="number(translate(provi, '$', ''))"/>
				<xsl:variable name="excursionCost" select="number(translate(eksursioonid, '$', ''))"/>
				<xsl:variable name="otherCost" select="number(translate(muid, '$', ''))"/>
				<xsl:variable name="totalCost" select="$baseCost + $proviCost + $excursionCost + $otherCost + ($baseCost * 0.2)"/>
				<xsl:value-of select="format-number(number(translate(hind, '$', '')) * 1.2, '$#0.00')" />			
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>
