/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lawrence
 */
public class JdbcControllerBack extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection conn;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            conn
                    = DriverManager.getConnection(url.toString(), username, password);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    public class MyChecker {
        
        public String login(String uname, String pass) throws SQLException {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Login where USERNAME=?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            
     
            if (rs.next()){
                return "true";
                /*String password = rs.getString("PASSWORD");
                 if(pass.equals(Security.decrypt(password))){
                 return "true";
                 }
                 else{
                 return "incorrect Password";
                 }*/
            }
            else if ((uname.equals("")) || (pass.equals(""))) {
                return "no entry";
            } 

            else {
                return "Incorrect Username";
            }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet JdbcController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet JdbcController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        } finally {
//            out.close();
//        }
        ServletConfig config = getServletConfig();
         try {

            if (conn != null) {
                
                
                String username = request.getParameter("uname");
                String password = request.getParameter("pass");
                
                
                
                MyChecker checker = new MyChecker();
                
                String check = checker.login(username, password);
                
                if(check.contentEquals("true")){
                    PreparedStatement ps = conn.prepareStatement("SELECT EVENT_NAME FROM EVENTS");
                    ResultSet rs = ps.executeQuery();
                    request.setAttribute("results", rs);
                    request.getRequestDispatcher("newindex.jsp").include(request, response);
                }
                else{
                    request.setAttribute("results", check);
                    request.getRequestDispatcher("error.jsp").include(request, response);
                }
                    
               
            }
            else {

                response.sendRedirect("error.jsp");
            }
        } catch (SQLException sqle) {
            response.sendRedirect("error.jsp");
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

