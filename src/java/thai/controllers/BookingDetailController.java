/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thai.dtos.CartObj;

import thai.dtos.DeviceObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "BookingDetailController", urlPatterns = {"/BookingDetailController"})
public class BookingDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            List<DeviceObj> listError = (List<DeviceObj>) request.getAttribute("listError");
            System.out.println("listError:  " + listError);
            Date time = new Date();
            HttpSession session = request.getSession();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String dateNow = df.format(time);
            // cộng thêm 5 ngày:
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DAY_OF_YEAR, 5);
            String payDate = df.format(c.getTime());
            if (listError != null) {
               
                request.setAttribute("listDetail", listError);
                request.setAttribute("errorQuantity", "Greater than the number of remaining devices");
            } else {
                CartObj cartSession = (CartObj) session.getAttribute("Cart");
                HashMap<Integer, DeviceObj> listSession = cartSession.getCart();
                List<DeviceObj> result = new ArrayList<>();
                for (Map.Entry<Integer, DeviceObj> entry : listSession.entrySet()) {
                    entry.getValue().setError(true);
                    result.add(entry.getValue());
                    
                }
                System.out.println("ListResult:"+ result.get(0).isError());
                request.setAttribute("listDetail", result);
            }
            request.setAttribute("txtRequestDate", dateNow);
            request.setAttribute("txtPayDate", payDate);
        } catch (Exception e) {
            log("ERROR at BookingDetailController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("booking.jsp").forward(request, response);
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
