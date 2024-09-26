<%@page contentType="text/html" pageEncoding="UTF-8" import="p1.Student ,javax.persistence.*"%>
<%
    int pid = Integer.parseInt(request.getParameter("t1"));
    String pname = request.getParameter("t2");
    int pprice = Integer.parseInt(request.getParameter("t3"));
    int pquantity = Integer.parseInt(request.getParameter("t4"));
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("8aPU");
    EntityManager em = emf.createEntityManager();
    em.getTransaction().begin();
    Student i1 = new Student();
    i1.setBid(pid);
    i1.setBname(pname);
    em.persist(i1);
    em.getTransaction().commit();
    em.close();
    out.println("Inventory item added successfully!");
%>