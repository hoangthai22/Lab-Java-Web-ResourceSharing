/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thai.daos.BookingDAO;
import thai.dtos.BookingDetailObj;
import thai.dtos.BookingObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchRequestByDateController", urlPatterns = {"/SearchRequestByDateController"})
public class SearchRequestByDateController extends HttpServlet {

    public static final String GETALLBOOKING = "GetAllBookingController";
    public static final String REQUEST = "request.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REQUEST;
        try {
            String txtSearchByDate = request.getParameter("txtSearchByDate");
            String txtRequestDate = request.getParameter("txtRequestDate");
            String txtPayDate = request.getParameter("txtPayDate");
            long getDaysDiff = -1;
            if (txtPayDate.isEmpty() || txtRequestDate.isEmpty()) {
                url = GETALLBOOKING;
                request.setAttribute("error", "Please select the date you want to search!!");
            } else if (!txtPayDate.isEmpty() && !txtRequestDate.isEmpty()) {
                String[] rental = txtRequestDate.split("-");
                String[] returnn = txtPayDate.split("-");
                Date rentalDate1 = new Date(Integer.parseInt(rental[0]), Integer.parseInt(rental[1]), Integer.parseInt(rental[2]));
                Date returnDate1 = new Date(Integer.parseInt(returnn[0]), Integer.parseInt(returnn[1]), Integer.parseInt(returnn[2]));
                long getDiff = returnDate1.getTime() - rentalDate1.getTime();
                getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
                if (getDaysDiff < 1) {
                    url = GETALLBOOKING;
                    request.setAttribute("error", "The start date must be greater than the end date!!");
                }
            }
            if (getDaysDiff > 0) {
                BookingDAO dao = new BookingDAO();
                List<BookingObj> listBooking = dao.searchBookingByDate(txtSearchByDate, txtRequestDate, txtPayDate);
                if (listBooking.size() > 0) {
                    for (BookingObj list : listBooking) {

                        List<BookingDetailObj> bookingDetailList = dao.getBookingDetailByBookingID(list.getBookingId());
                        for (BookingDetailObj listDetail : bookingDetailList) {
                            if (list.getDescription() == null) {
                                list.setDescription(listDetail.getDeviceName() + "-" + listDetail.getBookingQuantity());
                            } else {
                                list.setDescription(list.getDescription() + ",   " + listDetail.getDeviceName() + "-" + listDetail.getBookingQuantity());
                            }
                        }
                    }
                }

                
                request.setAttribute("requestDate", txtRequestDate);
                request.setAttribute("payDate", txtPayDate);
                request.setAttribute("listBooking", listBooking);
            }
        } catch (Exception e) {
            log("ERROR at SearchByDateController: " + e.getMessage());

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
