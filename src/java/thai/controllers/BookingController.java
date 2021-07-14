/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thai.daos.BookingDAO;
import thai.daos.DeviceDAO;
import thai.dtos.BookingDetailObj;
import thai.dtos.BookingObj;
import thai.dtos.CartObj;

import thai.dtos.DeviceObj;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

    public static final String HISTORY = "HistoryRequestController";
    public static final String ERROR = "BookingDetailController";
    public static final String ERRORDATE = "booking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] quantity = request.getParameterValues("txtQuantity");
        String now = request.getParameter("txtDateNow");
        String pay = request.getParameter("txtPayDate");
        boolean checkQuantity = true;
        String url = ERROR;
        long getDaysDiff = -1;
        try {

            java.util.Date time = new java.util.Date();
            HttpSession session = request.getSession();
            RegistrationObj user = (RegistrationObj) session.getAttribute("user");
            int userID = user.getUserId().hashCode() < 0 ? user.getUserId().hashCode() * -1 : user.getUserId().hashCode();
            String bookingId = "" + time.getTime() + userID;    //

            java.sql.Date dateNow = java.sql.Date.valueOf(now);
            java.sql.Date datePay = java.sql.Date.valueOf(pay);
            BookingObj booking = new BookingObj(bookingId, user.getUserId(), dateNow, datePay, "New");
            BookingDAO dao = new BookingDAO();
            DeviceDAO itemDao = new DeviceDAO();

            CartObj cartSession = (CartObj) session.getAttribute("Cart");
            HashMap<Integer, DeviceObj> listSession = cartSession.getCart();
            List<DeviceObj> result = new ArrayList<>();
            for (Map.Entry<Integer, DeviceObj> entry : listSession.entrySet()) {
                result.add(entry.getValue());
            }
            for (int i = 0; i < result.size(); i++) {
                if (result.get(i).getDeviceQuantity() < Integer.parseInt(quantity[i])) {
                    checkQuantity = false;
                    result.get(i).setError(false);
                } else {
                    result.get(i).setError(true);
                }
            }
            System.out.println("checkQuantity: " + checkQuantity);
            if (checkQuantity) {
                for (int i = 0; i < result.size(); i++) {
                    result.get(i).setDeviceQuantity(Integer.parseInt(quantity[i]));
                }
                dao.insertBooking(booking);
                for (DeviceObj list : result) {
                    BookingDetailObj bookingDetail = new BookingDetailObj(list.getDeviceId(), list.getDeviceName(), list.getDeviceColor(),
                            list.getDeviceQuantity(), bookingId, list.getCategoryName());
                    dao.insertBookingDetail(bookingDetail);
                    itemDao.updateQuantityDecrease(list.getDeviceId(), list.getDeviceQuantity());
                }
                session.removeAttribute("Cart");
                url = HISTORY;
            } else {
                request.setAttribute("listError", result);

            }

        } catch (Exception e) {
            log("ERROR at BookingController: " + e.getMessage());
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
