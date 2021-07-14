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
import thai.daos.CategoryDAO;
import thai.daos.DeviceDAO;
import thai.dtos.CategoryObj;
import thai.dtos.DeviceObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String searchByName = request.getParameter("txtSearchByName");
        String searchByCategory = request.getParameter("txtSearchByCategory");
        try {
           
            DeviceDAO dao = new DeviceDAO();
            DeviceObj dev = new DeviceObj();
            if (searchByName != null) {
                dev.setDeviceName(searchByName);
            }
            if (!searchByCategory.equals("0")) {
                dev.setCategoryName(searchByCategory);
            }
            List<DeviceObj> listD = dao.findDevice(dev);
            CategoryDAO catDAO = new CategoryDAO();
            List<CategoryObj> listC = catDAO.getAllCategory();
            request.setAttribute("listD", listD);
            request.setAttribute("listC", listC);
            request.setAttribute("searchByName", searchByName);
            request.setAttribute("searchByCategory", searchByCategory);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
