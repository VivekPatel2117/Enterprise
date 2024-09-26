<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Implicit Object of JSP</h1>
<b>out object Example:</b><br><br>
<%
    out.println("Example of out Object Of type JspWriter");
    out.println("<br>");
    out.println("<b>Request object Example:</b><br>");
    String s = request.getParameter("t1");
    out.println("Entered Name: " + s + "<br><br>");
    out.println("<b>Response object Example:</b>");
    out.println("Content Type: " + response.getContentType() + "<br>");
    out.println("Character Encoding: " + response.getCharacterEncoding()
            + "<br><br>");
    out.println("<b>application object Example:</b><br><br>");
    String contextParam = application.getInitParameter("dname");
    out.println("Context Parameter 'dname': " + contextParam + "<br><br>");
    application.setAttribute("appName", "Intrinsic Objects Demo");

    out.println("<b>Application Name:</b> " + application.getAttribute("appName")
            + "<br><br>");
    out.println(
            "<b>Config object Example:</b><br><br>");
    String servletParam = config.getInitParameter("dname");

    out.println(
            "Servlet Parameter 'dname': " + servletParam + "<br><br>");
    out.println(
            "<b>Session object Example:</b><br><br>");
    out.println(
            "<b>Session ID:</b> " + session.getId() + "<br>");
    session.setAttribute(
            "x", 369);
    out.println(
            "<b>Session Attribute 'x':</b> " + session.getAttribute("x")
            + "<br><br>");
    out.println(
            "<b>page object Example:</b><br><br>");
    out.println(
            "The current JSP page class: " + page.getClass().getName() + "<br>");
    out.println(
            "<b>PageContext object Example:</b><br><br>");
    pageContext.setAttribute(
            "y", 123, PageContext.SESSION_SCOPE);
    out.println(
            "<b>Page Context Attribute 'y':</b> " + pageContext.getAttribute("y",
                    PageContext.SESSION_SCOPE) + "<br><br>");
%>