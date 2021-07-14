/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thai.daos.DeviceDAO;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
public class MainController extends HttpServlet {

    public static final String AUTHO = "login.jsp";
    public static final String SEARCH = "SearchController";
    public static final String SEARCHDATE = "SearchByDate";
    public static final String GETALL = "GetDeviceController";
    public static final String BOOKINGDETAIL = "BookingDetailController";
    public static final String BOOKING = "BookingController";
    public static final String ERROR = "error.jsp";
    public static final String REGISTER = "RegistrationController";
    public static final String LOGIN = "LoginController";
    public static final String VERIFY = "VerifyController";
    public static final String UPDATESTATUS = "UpdateStatusController";
    public static final String GETALLBOOKING = "GetAllBookingController";
    public static final String SEARCHBYDATE = "SearchRequestByDateController";
    public static final String SEARCHBOOKING = "SearchByKeyController";
    public static final String CLEAR = "RemoveDeviceController";
    public static final String HISTORY = "HistoryRequestController";
    public static final String SEARCHREQUESTDATE = "SearchHistoryByDate";
    public static final String SEARCHHISTORYBYKEY = "SearchHistoryByKey";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("Register")) {
                url = REGISTER;
                System.out.println(action);
            } else if (action.equals("Verify")) {
                url = VERIFY;
            } else {
                System.out.println(action);
                HttpSession session = request.getSession();
                RegistrationObj user = (RegistrationObj) session.getAttribute("user");
                if (user.getStatus().equals("Active")) {
                    if (action.equals("Search")) {
                        url = SEARCH;
                    }
                    if (action.equals("Search By Date")) {
                        url = SEARCHDATE;
                    }
                    if (action.equals("Search By Key")) {
                        url = SEARCHBOOKING;
                    }
                    if (action.equals("Search By Request Date")) {
                        url = SEARCHREQUESTDATE;
                    }
                    if (action.equals("Search By Name")) {
                        url = SEARCHHISTORYBYKEY;
                    }
                    if (action.equals("Get All") || action.equals("Cancel")) {
                        url = GETALL;
                    }
                    if (action.equals("GetAllHistory")) {
                        url = HISTORY;
                    }
                    if (action.equals("CancelHistory")) {
                        url = UPDATESTATUS;
                        request.setAttribute("action", action);
                    }
                    if (action.equals("Get  All")) {
                        url = GETALLBOOKING;
                    }
                    if (action.equals("pagingBooking")) {
                        String index = request.getParameter("index");
                        url = GETALLBOOKING;
                    }

                    if (action.equals("Book")) {
                        url = BOOKING;
                    }
                    if (action.equals("Accept") || action.equals("Delete") || action.equals("Done")) {
                        url = UPDATESTATUS;
                        request.setAttribute("action", action);
                    }
                    if (action.equals("Search By")) {
                        url = SEARCHBYDATE;
                    }
                    if (action.equals("Clear") || action.equals("Next Step")) {
                        String indexClear = request.getParameter("indexClear");
                        url = GETALL;
                        request.setAttribute("indexClear", indexClear);
                        request.setAttribute("action", action);
                    }
                    if (action.equals("Previous")) {
                        String indexPage = request.getParameter("indexPagePrevious");
                        url = GETALL;
                        request.setAttribute("index", indexPage);
                    }
                    if (action.equals("Next")) {
                        String indexPage = request.getParameter("indexPageNext");
                        url = GETALL;
                        request.setAttribute("index", indexPage);
                    } else {
                        DeviceDAO dao = new DeviceDAO();
                        int index = dao.getNumberPage("");
                        for (int i = 1; i < index + 1; i++) {
                            String indexPage = i + "";
                            if (action.equals(indexPage)) {
                                url = GETALL;
                                request.setAttribute("index", indexPage);

                            }
                        }
                    }
                } else {
                    url = AUTHO;
                }
            }
        } catch (SQLException e) {
            log("ERROR at MainController: " + e.getMessage());
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
