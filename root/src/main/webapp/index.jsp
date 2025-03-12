<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> <%-- To use <t: > (.tag files in WEB-INF/tags) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- To use <c: > tags from core JSTL library  --%>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Home page</title>	
		<link rel="stylesheet" href="static/css/home.css">
    </jsp:attribute>

	<jsp:body>
		<!-- Home Page Hero Area -->
        <section id="heroArea">
            <div id="catModel">
                <img src="static/asset/catModel.png" alt="model" style="width: 37vw; height: auto;">
            </div>
            <div id="ad">
                <h3>gimme your</h3>
                <h2>MONEYYY</h2>
                <a href="/order"><button class="browse">BROWSE</button></a>
            </div>
        </section>

        <!-- best clubber -->
        <section id="bestClubber">
            <div id="word">
                <h2>meet the &nbsp;</h2>
                <span class="flip" style="--i:0" data-text="p">p</span>
                <span class="flip" style="--i:1" data-text="u">u</span>
                <span class="flip" style="--i:2" data-text="r">r</span>
                <span class="flip" style="--i:3" data-text="r">r</span>
                <span class="flip" style="--i:4" data-text="f">f</span>
                <span class="flip" style="--i:5" data-text="e">e</span>
                <span class="flip" style="--i:6" data-text="c">c</span>
                <span class="flip" style="--i:7" data-text="t">t</span>
                <h2>&nbsp; rockstar in our shop</h2>
            </div>
                
            <div id="podium">
                <img src="static/asset/happyCat.gif" alt="happyCat" style="width: 20vw; height: auto; position: absolute; left: 24.5vw; bottom: -74vh;">
                <img src="static/asset/oiauiaCat.gif" alt="uiiaCat" style="width: 18vw; height: auto; position: absolute; left: 42vw; bottom: -62vh;">
                <img src="static/asset/angryCat.png" alt="angryCat" style="width: 20vw; height: auto; position: absolute; right: 25vw; bottom: -77vh;">
            </div>
        </section>
	</jsp:body>
</t:base>