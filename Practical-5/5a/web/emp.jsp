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
            try {
                if (request.getParameter("submit") != null) {
                    // Load the driver
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/practical", "app", "app");
                    PreparedStatement ps = null;
                    
                    // Input validation
                    String empnoStr = request.getParameter("empno");
                    String name = request.getParameter("name");
                    String desg = request.getParameter("desg");
                    String salStr = request.getParameter("sal");
                    out.println(empnoStr);
                    if (empnoStr != null && !empnoStr.isEmpty() && salStr != null && !salStr.isEmpty()) {
                        int empno = Integer.parseInt(empnoStr);
                        int sal = Integer.parseInt(salStr);
                        
                        // Select query
                        String selectQuery = "SELECT * FROM employee WHERE id = ?";
                        ps = conn.prepareStatement(selectQuery);
                        ps.setInt(1, empno);
                        
                        ResultSet rs = ps.executeQuery();
                        
                        int emp_id = 0;
                        if (rs.next()) {
                            emp_id = rs.getInt(1); // id column
                            out.println("Data already exists. Proceeding to update...");
                        }
                        rs.close();
                        ps.close();
                        
                        // If employee doesn't exist, insert new record
                        if (empno != emp_id) {
                            String insertQuery = "INSERT INTO EMPLOYEE (id, emp_name, emp_sal, desg) VALUES (?, ?, ?, ?)";
                            ps = conn.prepareStatement(insertQuery);
                            ps.setInt(1, empno);
                            ps.setString(2, name);
                            ps.setInt(3, sal);
                            ps.setString(4, desg);
                            int i = ps.executeUpdate();
                            if (i > 0) {
                                out.println("New row inserted successfully.");
                            } else {
                                out.println("Error while inserting data.");
                            }
                            ps.close();
                        } else { 
                            // Update existing record
                            String updateQuery = "UPDATE EMPLOYEE SET emp_name = ?, emp_sal = ?, desg = ? WHERE id = ?";
                            ps = conn.prepareStatement(updateQuery);
                            ps.setString(1, name);
                            ps.setInt(2, sal);
                            ps.setString(3, desg);
                            ps.setInt(4, empno);
                            int i = ps.executeUpdate();
                            if (i > 0) {
                                out.println("Existing row updated successfully.");
                            } else {
                                out.println("Error while updating data.");
                            }
                            ps.close();
                        }
                    } else {
                        out.println("Please enter valid employee number and salary.");
                    }
                    conn.close();
                }
            } catch (NumberFormatException e) {
                out.println("Invalid input. Employee number and salary must be numeric.");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
