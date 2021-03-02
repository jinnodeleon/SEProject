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
import javax.servlet.http.HttpSession;

/**
 *
 * @author lawrence
 */
public class JdbcControllerLogin extends HttpServlet {

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

            if (rs.next()) {
                return "true";
                /*String password = rs.getString("PASSWORD");
                 if(pass.equals(Security.decrypt(password))){
                 return "true";
                 }
                 else{
                 return "incorrect Password";
                 }*/
            } else if ((uname.equals("")) || (pass.equals(""))) {
                return "no entry";
            } else {
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
            String action = request.getServletPath();
            if (conn != null) {
                if (action.contentEquals("/processLogin")) {
                    processLogin(request, response);
                } else if (action.contentEquals("/showEventPage")) {
                    showEventPage(request, response);
                }else if (action.contentEquals("/showYearSelect")) {
                    showYearSelect(request, response);
                }

            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException sqle) {
            response.sendRedirect("error.jsp");
        }
    }

    public void processLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        MyChecker checker = new MyChecker();

        String check = checker.login(username, password);

        if (check.contentEquals("true")) {
            PreparedStatement ps = conn.prepareStatement("SELECT YEAR1 FROM BUDGETYEAR");
            ResultSet rs = ps.executeQuery();
            PreparedStatement ps1 = conn.prepareStatement("SELECT ROLET FROM Login WHERE USERNAME=?");
            ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            String role = rs1.getString("ROLET");
            HttpSession session = request.getSession();
            session.setAttribute("role", role);
            request.setAttribute("results", rs);

            request.getRequestDispatcher("chooseyear.jsp").include(request, response);
        } else {
            request.setAttribute("results", check);
            request.getRequestDispatcher("error.jsp").include(request, response);
        }
    }
    public void showEventPage(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        PreparedStatement ps = conn.prepareStatement("SELECT EVENT_NAME FROM EVENTS");
            ResultSet rs = ps.executeQuery();
            
            PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM BUDGETYEAR");
            ResultSet rs1 = ps1.executeQuery();
            request.setAttribute("results", rs);
            request.setAttribute("results1", rs1);
            request.getRequestDispatcher("newindex.jsp").include(request, response);
    }
    public void showYearSelect(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        PreparedStatement ps = conn.prepareStatement("SELECT YEAR1 FROM BUDGETYEAR");
            ResultSet rs = ps.executeQuery();
            request.setAttribute("results", rs);
            request.getRequestDispatcher("chooseyear.jsp").include(request, response);
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
