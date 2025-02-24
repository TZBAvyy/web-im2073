<%@tag description="Login Form" pageEncoding="UTF-8"%>

<% String error = (String)request.getAttribute("error"); %>

<form action="/signup" method="post" class="form-container">
    <% if (error!=null) out.println("<h2 class='error'>" + error + "</h2>"); %>
    
    <label for="name">Name:</label>
    <input type="text" name="name" value="" required>

    <label for="address">Address:</label>
    <input type="text" name="address" value="" required>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" name="phoneNumber" value="" required>

    <label for="email">Email:</label>
    <input type="email" name="email" value="" required>

    <label for="password">Password:</label>
    <input type="password" name="password" value="" required minlength=4>

    <input type="submit" value="Submit">
    <a href="/">Cancel</a>
</form>