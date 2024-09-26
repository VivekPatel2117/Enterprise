<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Expression Language (EL)</h1>
<b>PageScope Example</b><br>
<%
    pageContext.setAttribute("Name", "Ram");
%>
<b>Page Attribute Value: </b>${pageScope.Name}<br><br>
<b>requestScope Example</b><br>
<%
    request.setAttribute("Address", "Ambivali");
%>

<b>Request Attribute Value:</b> ${requestScope.Address}<br><br>
<b>sessionScope Example</b><br>
<%
    session.setAttribute("class", "Tyit-A");
%>
<b>Session Attribute Value:</b> ${sessionScope.class}<br><br>
<b>applicationScope Example</b><br>
<%
    application.setAttribute("gender", "Male");
%>
<b>Application Attribute Value:</b> ${applicationScope.gender}<br><br>
<b>Param Example<br>
    Name:</b>${param.t1}<br>
<b>Age:</b>:${param.t2}<br><br>
<b>ParamValues Example<br>
    <b>Request Parameter Values :</b> ${paramValues.t3}<br><br>
    <b>header Example</b><br>
    <b>Header 'User-Agent':</b> ${header["User-Agent"]}<br><br>
    <b>headerVlaues Example</b><br>
    <b>Header 'Accept':</b> ${headerValues["Accept"]}<br><br>
    <b>Cookie Example:</b><br>
    <%
        Cookie c = new Cookie("RollNo", "369");
        response.addCookie(c);
    %>
    <b>Cookie 'RollNo':</b>${cookie["RollNo"].value}<br><br>
    <b>InitParam Example:</b><br>
    <b>Init Parameter 'configParam':</b> ${initParam["configParam"]}<br><br>
    <b>pageContext Example</b><br>
    <b>Page Context:</b> ${pageContext}