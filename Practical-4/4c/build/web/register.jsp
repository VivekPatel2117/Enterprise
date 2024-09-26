<%-- 
    Document   : register
    Created on : 26 Sep, 2024, 6:32:27 AM
    Author     : pursh
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("submit") != null) {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/practical", "app", "app");
                Statement stmt = conn.createStatement();
                int user_id = (int) (Math.random() * 100);
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                String query = "INSERT INTO users (id, username, password, email, country) VALUES (" + user_id + ",'" + username + "','" + password + "','" + email + "','" + country + "')";
                int i = stmt.executeUpdate(query);
                if (i > 0) {
                    out.println("Data saved Successfully");
                } else {
                    out.println("Error occured");
                }
            }
        %>
    </body>
</html>
