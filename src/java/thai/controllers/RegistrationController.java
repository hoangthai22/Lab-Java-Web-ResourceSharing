/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.Registration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thai.daos.RegistrationDAO;
import thai.dtos.RegistrationObj;
import thai.dtos.SendEmailObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegistrationController", urlPatterns = {"/RegistrationController"})
public class RegistrationController extends HttpServlet {

    public static final String SUCCESS = "verify.jsp";
    public static final String ERRROR = "signup.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String txtUserID = request.getParameter("txtUserID");
        String txtFullName = request.getParameter("txtFullName");
        String txtPassword = request.getParameter("txtPassword");
        String txtConfirmPassword = request.getParameter("txtConfirmPassword");
        String txtPhone = request.getParameter("txtPhone");
        String txtAddress = request.getParameter("txtAddress");
        String txtRole = request.getParameter("txtRole");
        System.out.println("Register: " + txtUserID);
        boolean check = true;
        String url = SUCCESS;
        try {
            Date time = new Date();
            Timestamp creatDate = Timestamp.valueOf(LocalDateTime.now());
            RegistrationObj regisError = new RegistrationObj(txtUserID, txtPassword, txtFullName, txtPhone, txtAddress, "", "", "", creatDate);
            RegistrationDAO dao = new RegistrationDAO();
            RegistrationObj userCheck = dao.checkLogin(txtUserID, txtPassword);
            if (txtFullName.equals("")) {
                check = false;
                request.setAttribute("errorRes", "Full name can't be blank!!");
            } else if (txtUserID.equals("")) {
                check = false;
                request.setAttribute("errorRes", "UserID can't be blank!!");
            } else if (txtPassword.equals("")) {
                check = false;
                request.setAttribute("errorRes", "Password can't be blank!!");
            } else if (txtConfirmPassword.equals("")) {
                check = false;
                request.setAttribute("errorRes", "Confirm Password can't be blank!!");
            } else if (txtPhone.equals("")) {
                check = false;
                request.setAttribute("errorRes", "Phone Number can't be blank!!");
            } else if (txtAddress.equals("")) {
                check = false;
                request.setAttribute("errorRes", "Address can't be blank!!");
            } else if (userCheck.getUserId() != null) {
                if (userCheck.getStatus().equals("Active")) {
                    check = false;
                    request.setAttribute("errorRes", "Email already exists!! ");
                } else if (userCheck.getStatus().equals("New")) {
                    check = true;
                }
            } else if (!txtUserID.equals("")) {
                String expression = "^[\\w.+\\-]+@gmail\\.com$";
                CharSequence inputStr = txtUserID;
                Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
                Matcher matcher = pattern.matcher(inputStr);
                if (!matcher.matches()) {
                    check = false;
                    request.setAttribute("errorRes", "Email is not valid!! ");
                }
            }

            if (check) {

                if (txtConfirmPassword.equals(txtPassword)) {
                    SendEmailObj sm = new SendEmailObj();
                    String code = sm.getRandom();
                    RegistrationObj user = new RegistrationObj(txtUserID, txtPassword, txtFullName, txtPhone, txtAddress, txtRole, code, "New", creatDate);
                    boolean test = sm.sendEmail(user);
                    System.out.println(test);
                    if (test) {
                        if (userCheck.getUserId() == null) {
                            dao.insertAccount(user);
                        }
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        request.setAttribute("Email", txtUserID);
                    }
                } else {
                    request.setAttribute("errorRes", "Confirm Password does not match");
                    url = ERRROR;
                    request.setAttribute("regisError", regisError);
                }
            } else {
                url = ERRROR;
                request.setAttribute("regisError", regisError);
            }
        } catch (Exception e) {
            log("ERROR at RegistrationController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
