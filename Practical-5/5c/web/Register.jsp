<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql"prefix="sql"%>
<sql:setDataSource var="c" driver="org.apache.derby.jdbc.ClientDriver"
                   user="app" password="app" url="jdbc:derby://localhost:1527/practical"/>
<c:set var="name" value="${param.t1}"/>
<c:set var="id" value="${param.t2}"/>
<c:set var="add" value="${param.t3}"/>
<c:set var="email" value="${param.t4}"/>
<c:if test="${param.save != null}">
    <sql:update dataSource="${c}" var="i">
        insert into users values(?,?,?,?,?)
        <sql:param value="${id}"/>
        <sql:param value="${name}"/>
        <sql:param value="${add}"/>
        <sql:param value="${email}"/>
        <sql:param value="INDIA" />
    </sql:update>
    <c:if test="${i>0}">
        <c:out value="Data Saved Successfully"/>
    </c:if>
</c:if>
<c:if test="${param.update != null}">
    <sql:update dataSource="${c}" var="i">
        Update users set name=? , address=? , email=? Where id=?
        <sql:param value="${name}"/>
        <sql:param value="${add}"/>
        <sql:param value="${email}"/>
        <sql:param value="${id}"/>
    </sql:update>
    <c:if test="${i>0}">
        <c:out value="Data Updated Successfully"/>
    </c:if>
</c:if>
<c:if test="${param.delete != null}">
    <sql:update dataSource="${c}" var="i">
        Delete from users Where id=?
        <sql:param value="${id}"/>
    </sql:update>
    <c:if test="${i>0}">
        <c:out value="Data Deleted Successfully"/>
    </c:if>
</c:if>
