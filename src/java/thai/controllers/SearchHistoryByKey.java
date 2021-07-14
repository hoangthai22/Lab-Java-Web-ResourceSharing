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
import javax.servlet.http.HttpSession;
import thai.daos.BookingDAO;
import thai.dtos.BookingDetailObj;
import thai.dtos.BookingObj;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchHistoryByKey", urlPatterns = {"/SearchHistoryByKey"})
public class SearchHistoryByKey extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtSearchByKey = request.getParameter("txtSearchByKey");
            HttpSession session = request.getSession();
            RegistrationObj user = (RegistrationObj) session.getAttribute("user");
            BookingDAO bookingDao = new BookingDAO();
            List<BookingObj> listBooking = bookingDao.searchHistoryBookingByKey(txtSearchByKey, user.getUserId());
            if (listBooking.size() > 0) {
                for (BookingObj list : listBooking) {
                    BookingObj dto = bookingDao.getBookingByBookingID(list.getBookingId());
                    list.setBookingStatus(dto.getBookingStatus());
                    list.setRequestDate(dto.getRequestDate());
                    list.setPayDate(dto.getPayDate());
                    List<BookingDetailObj> bookingDetailList = bookingDao.getBookingDetailByBookingID(list.getBookingId());
                    for (BookingDetailObj listDetail : bookingDetailList) {
                        if (list.getDescription() == null) {
                            list.setDescription(listDetail.getDeviceName() + "-" + listDetail.getBookingQuantity());
                        } else {
                            list.setDescription(list.getDescription() + ",   " + listDetail.getDeviceName() + "-" + listDetail.getBookingQuantity());
                        }
                    }
                }
            }

            request.setAttribute("listBooking", listBooking);
            request.setAttribute("txtSearchByKey", txtSearchByKey);
        } catch (Exception e) {
            log("ERROR at HistoryRequestController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("history.jsp").forward(request, response);
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
