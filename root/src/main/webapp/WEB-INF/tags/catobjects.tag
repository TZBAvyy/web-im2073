<%@tag description="Cat Objects from DB" pageEncoding="UTF-8"%>

<%-- <img src="static/asset/politeCat.png" alt="happyCat" style="width: 200px; height: auto;"> --%>
<% String[][] result = (String[][])request.getAttribute("result"); %>
<img src=<%=result[0][3]%> alt=<%=result[0][0]%> style="width: 200px; height: auto;">
<img src=<%=result[1][3]%> alt=<%=result[0][0]%> style="width: 200px; height: auto;">
<img src=<%=result[2][3]%> alt=<%=result[0][0]%> style="width: 200px; height: auto;">