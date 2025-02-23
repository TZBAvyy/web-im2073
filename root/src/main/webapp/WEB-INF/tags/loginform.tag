<%@tag description="Login Form" pageEncoding="UTF-8"%>

<% String error = (String)request.getAttribute("error"); %>

<form action="/login" method="post" class="form-container">
    <% if (error!=null) out.println("<h2 class='error'>" + error + "</h2>"); %>

    <label for="email">Email:</label>
    <input type="email" name="email" value="" required>

    <label for="password">Password:</label>
    <input type="password" name="password" value="" required minlength=4>

    <input type="submit" value="Submit">
</form>