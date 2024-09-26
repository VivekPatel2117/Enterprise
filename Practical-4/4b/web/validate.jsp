<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("t1");
    String age = request.getParameter("t2");
    String[] hobbies = request.getParameterValues("hobbies");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    boolean error = false;
    if (name == null || name.isEmpty()) {
        error = true;
        out.println("Error: Name is required.<br><br>");
    }
    if (age == null || age.isEmpty()) {
        error = true;
        out.println("Error: Valid age is required.<br><br>");
    }
    if (hobbies == null && hobbies.length <= 0) {
        error = true;
        out.println("Error: Atleast 1 Selection of Hobbie is required.<br><br>");
    }
    if (email == null || email.isEmpty()) {
        error = true;
        out.println("Error: Email is required.<br><br>");
    }
    if (gender == null) {
        error = true;
        out.println("Error: Gender is required.<br><br>");
    }
    if (!error) {
        out.println("<h1>User Validate Data</h1><br><br>");
        out.println("<b>Name :</b> " + name + "<br><br>");
        out.println("<b>Age :</b>" + age + "<br><br>");
        out.println("<b>Hobbies :</b><br>");
        for (String hobby : hobbies) {
            out.println(hobby + "<br>");
        }
        out.println(
                "<b><br>Email :</b>" + email + "<br><br>");
        out.println(
                "<b>Gender :</b>" + gender);
    } else {
        out.println("Please correct the errors and <a href='index.html'>try again</a>.");
    }
%>