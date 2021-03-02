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
public class AccountController extends HttpServlet {

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
                if (action.contentEquals("/viewAccounts")) {

                    viewAccounts(request, response);
                } else if (action.contentEquals("/addAccount")) {

                    addAccount(request, response);
                } 

            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException sqle) {
            response.sendRedirect("error.jsp");
        }
    }

    public void viewAccounts(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String role1 = "finance%";
        String role2 = "auditlog%";
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Login where ROLET LIKE ?");
        ps.setString(1, role1);
        ResultSet rs = ps.executeQuery();
        PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM Login where ROLET LIKE ?");
        ps1.setString(1, role2);
        ResultSet rs1 = ps1.executeQuery();
        request.setAttribute("results", rs);
        request.setAttribute("results1", rs1);
        request.getRequestDispatcher("viewaccounts.jsp").include(request, response);
    }

    public void addAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("ROLET");
        
        String position = "";
        if(role.contentEquals("financeadmin")){
            position ="Finance VP";
        } else{
            position ="Audit & Log VP";
        }

        String qry = "INSERT INTO Login VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(qry);

        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, role);
        ps.setString(4, name);
        ps.setString(5, position);
        ps.executeUpdate();

      viewAccounts(request, response);

    }

    public String checkduplicate(String transactiontitle) throws SQLException {
        String namedupe = transactiontitle + "(%)";
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM TRANSACTIONS where TITLE LIKE ? or TITLE LIKE ?");
        ps.setString(1, transactiontitle);
        ps.setString(2, namedupe);
        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            return transactiontitle;
        } else {
            String rename = transactiontitle + "(1)";
            for (int i = 2; rs.next(); i++) {
                rename = transactiontitle + "(" + i + ")";
            }
            return rename;
        }
    }

    public void Viewtransaction(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("transactiontitle");
        PreparedStatement pxs = conn.prepareStatement("SELECT * FROM Transactions where Title=?");
        pxs.setString(1, title);
        ResultSet rs = pxs.executeQuery();
        request.setAttribute("results", rs);
        request.getRequestDispatcher("receipt.jsp").include(request, response);
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
