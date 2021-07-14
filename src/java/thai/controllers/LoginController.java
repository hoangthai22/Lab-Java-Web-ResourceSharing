/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static thai.controllers.MainController.GETALL;
import thai.daos.RegistrationDAO;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    public static final String ERROR = "login.jsp";
    public static final String SUCCESS = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String verify = request.getParameter("g-recaptcha-response");
            String userId = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            if (!userId.equals("") && !password.equals("")) {
                if (verify.equals("")) {
                    request.setAttribute("id", userId);
                    request.setAttribute("pass", password);
                    request.setAttribute("error", "Please check the captcha!!");
                } else {
                    RegistrationDAO dao = new RegistrationDAO();
                    RegistrationObj user = dao.checkLogin(userId, password);
                    if (user.getUserId() == null) {
                        request.setAttribute("id", userId);
                        request.setAttribute("error", "Username or password is invalid!!");
                    } else if (user.getUserId().equals(userId) && user.getPassword().equals(password) && user.getStatus().equals("Active")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setMaxInactiveInterval(60000);
                        url = GETALL;
                    } else if (user.getStatus().equals("New")) {
                        request.setAttribute("id", userId);
                        request.setAttribute("error", "Users please complete the steps to complete registration!!");
                    }
                }
            } else {
                request.setAttribute("error", "Username and password can't be blank!!");
            }
        } catch (Exception e) {
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
