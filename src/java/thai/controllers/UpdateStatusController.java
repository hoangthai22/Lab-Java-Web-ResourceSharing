/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thai.daos.BookingDAO;
import thai.daos.DeviceDAO;
import thai.dtos.BookingDetailObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateStatusController", urlPatterns = {"/UpdateStatusController"})
public class UpdateStatusController extends HttpServlet {

    public static final String GETALLBOOKING = "GetAllBookingController";
    public static final String CANCELHISTORY = "HistoryRequestController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = GETALLBOOKING;
        try {
            String txtBookingID = request.getParameter("txtBookingID");
            String status = request.getParameter("action");
            System.out.println(status);
            if (status.equals("CancelHistory")) {
                status = "Delete";
                url = CANCELHISTORY;
            }
            BookingDAO bookingDao = new BookingDAO();
            DeviceDAO itemDao = new DeviceDAO();
            List<BookingDetailObj> listDetail = bookingDao.getBookingDetailByBookingID(txtBookingID);
            if (status.equals("Delete") || status.equals("Done")) {
                for (BookingDetailObj list : listDetail) {
                    itemDao.updateQuantityIncrease(list.getDeviceID(), list.getBookingQuantity());
                }
            }
            bookingDao.updateStatusBooking(txtBookingID, status);
        } catch (Exception e) {
            log("ERROR at UpdateStatusController: " + e.getMessage());
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
