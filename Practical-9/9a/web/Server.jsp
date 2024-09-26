<%@page import="p1.student" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="org.hibernate.*,org.hibernate.cfg.*"%>
<%
    int ie = Integer.parseInt(request.getParameter("t1"));
    String en = request.getParameter("t2");
    String ms = request.getParameter("t3");
    SessionFactory sf = new Configuration().configure().buildSessionFactory();
    Session s = sf.openSession();
    Transaction t = s.beginTransaction();
    student fb = new student();
    fb.setId(ie);
    fb.setName(en);
    s.persist(fb);
    t.commit();
    out.println("Thank you for giving feedback");
    s.close();
    sf.close();
%>
74