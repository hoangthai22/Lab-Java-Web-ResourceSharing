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
import static thai.controllers.SearchRequestByDateController.GETALLBOOKING;
import thai.daos.DeviceDAO;
import thai.dtos.DeviceObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchByDate", urlPatterns = {"/SearchByDate"})
public class SearchByDate extends HttpServlet {

    public static final String SUCCESS = "index.jsp";
    public static final String GETALL = "GetDeviceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String dateStart = request.getParameter("txtDateStart");
            String dateEnd = request.getParameter("txtDateEnd");

            long getDaysDiff = -1;
            if (dateStart.isEmpty() || dateStart.isEmpty()) {
                request.setAttribute("error", "Please enter the date you want to search!!");
                url = GETALL;
            } else {
                String[] rental = dateStart.split("-");
                String[] returnn = dateEnd.split("-");
                Date rentalDate1 = new Date(Integer.parseInt(rental[0]), Integer.parseInt(rental[1]), Integer.parseInt(rental[2]));
                Date returnDate1 = new Date(Integer.parseInt(returnn[0]), Integer.parseInt(returnn[1]), Integer.parseInt(returnn[2]));
                long getDiff = returnDate1.getTime() - rentalDate1.getTime();
                getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
                if (getDaysDiff < 1) {
                    url = GETALL;
                    request.setAttribute("error", "The start date must be greater than the end date!!");
                } else {
                    DeviceDAO dao = new DeviceDAO();
                    List<DeviceObj> listD = dao.findByDate(dateStart, dateEnd);
                    if (listD.size() > 0) {
                        request.setAttribute("listD", listD);
                    } else {
                        request.setAttribute("error", "No devices found");
                    }

                }
                request.setAttribute("txtDateStart", dateStart);
                request.setAttribute("txtDateEnd", dateEnd);
            }
        } catch (Exception e) {
            log("ERROR at SearchByDate: " + e.getMessage());
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
