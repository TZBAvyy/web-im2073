<%@tag description="Cat Objects from DB" pageEncoding="UTF-8"%>

<%-- <img src="static/asset/politeCat.png" alt="happyCat" style="width: 200px; height: auto;"> --%>
<% String[][] result = (String[][])request.getAttribute("result"); %>

<%
for (String[] item : result) {
    out.println("<div class='catObject'>");
    out.println("<img src='" + item[3] + "' alt='" + item[0] + "' style='width: 200px; height: auto;'>");
    out.println("<p>" + item[0] + " ($" + item[2] + ")</p>");
    out.println("</div>");
}
%>