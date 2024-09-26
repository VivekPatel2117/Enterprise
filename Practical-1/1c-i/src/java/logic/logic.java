/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pursh
 */
@WebServlet(name = "logic", urlPatterns = {"/logic"})
public class logic extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int num = Integer.parseInt(request.getParameter("num"));
            if (request.getParameter("factorial") != null) {
                int factorial = 1;
                for (int i = 1; i <= num; i++) {
                    factorial *= i;
                }
                out.println("Factorial = " + factorial);
            }
            if (request.getParameter("isPrime") != null) {
                boolean isPrime = true;
                if (num <= 1) {
                    isPrime = false;
                } else {
                    for (int i = 2; i <= Math.sqrt(num); i++) {
                        if (num % i == 0) {
                            isPrime = false;
                            break;
                        }
                    }
                }
                out.println("Prime Result: " + (isPrime ? "Prime" : "Not Prime"));
            }

            if (request.getParameter("armstrong") != null) {
                int originalNum = num;
                int sum = 0;
                while (originalNum != 0) {
                    int digit = originalNum % 10;
                    sum += Math.pow(digit, 3);
                    originalNum /= 10;
                }
                boolean isArmstrong = (sum == num);
                out.println("Armstrong Result: " + (isArmstrong ? "Armstrong" : "Not Armstrong"));
            }

            if (request.getParameter("reverse") != null) {
                int reversedNum = 0;
                int originalNum = num;
                while (originalNum != 0) {
                    int digit = originalNum % 10;
                    reversedNum = reversedNum * 10 + digit;
                    originalNum /= 10;
                }
                out.println("Reverse Result: " + reversedNum);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
