/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thai.daos.CategoryDAO;
import thai.daos.DeviceDAO;
import thai.dtos.CartObj;
import thai.dtos.CategoryObj;
import thai.dtos.DeviceObj;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "GetDeviceController", urlPatterns = {"/GetDeviceController"})
public class GetDeviceController extends HttpServlet {
    
    public static final String AUTHO = "login.jsp";
    public static final String SUCCESS = "index.jsp";
    public static final String GETALLBOOKING = "GetAllBookingController";
    public static final String BOOKINGDETAIL = "BookingDetailController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        String code = (String) request.getAttribute("id");
        String email = (String) request.getAttribute("email");
        String name = (String) request.getAttribute("name");
        
        try {
            
            HttpSession session = request.getSession();
            RegistrationObj user = (RegistrationObj) session.getAttribute("user");
            DeviceDAO itemDao = new DeviceDAO();
            if (user != null) {
                if (user.getRoleId().equals("MA")) {
                    url = GETALLBOOKING;
                } else {
                    int indexCount = itemDao.getNumberPage(user.getRoleId());
                    String index = (String) request.getAttribute("index");
                    CartObj cartSession = (CartObj) session.getAttribute("Cart");
                    String[] names = request.getParameterValues("txtCheck");
                    HashMap<Integer, DeviceObj> result = new HashMap<>();
                    if (cartSession == null) {
                        cartSession = new CartObj(user.getUserId(), result);
                    }
                    String action = request.getParameter("action");
                    if (names != null) {
                        if (action.equals("Previous") || action.equals("Next")) {
                            action = index;
                        }
                        List list = Arrays.asList(names);
                        for (int j = 1; j <= indexCount; j++) {
                            if (action.equals(j + "") || action.equals("Next Step")) {
                                for (int i = 0; i < list.size(); i++) {
                                    DeviceObj dto = itemDao.findByPrimaryKey((String) list.get(i));
                                    cartSession.addToCart(dto);
                                }
                                if (action.equals("Next Step")) {
                                    url = BOOKINGDETAIL;
                                }
                            } else if (action.equals("Clear")) {
                                String indexClear = request.getParameter("indexClear");
                                index = indexClear;
                                for (int i = 0; i < list.size(); i++) {
                                    cartSession.removeDeviceInCart(Integer.parseInt((String) list.get(i)));
                                }
                            }
                        }
                        session.setAttribute("Cart", cartSession);
                    } else if (names == null && action != null) {
                        if (action.equals("Next Step")) {
                            url = BOOKINGDETAIL;
                        }
                    }
                    if (index == null) {
                        index = "1";
                    }
                    CategoryDAO catDAO = new CategoryDAO();
                    List<CategoryObj> listC = catDAO.getAllCategory();
                    List<DeviceObj> listD = itemDao.getDeviceByIndexPage(Integer.parseInt(index), user.getRoleId());
                    HashMap<Integer, DeviceObj> listSession = cartSession.getCart();
                    if (cartSession.getCart() != null) {
                        for (DeviceObj list : listD) {
                            if (list.getCategoryName().equals("EL")) {
                                list.setCategoryName("Electronic");
                            } else if (list.getCategoryName().equals("RO")) {
                                list.setCategoryName("Room");
                                
                            } else if (list.getCategoryName().equals("WO")) {
                                list.setCategoryName("Wooden");
                            }
                            for (Map.Entry<Integer, DeviceObj> entry : listSession.entrySet()) {
                                if (list.getDeviceId() == entry.getKey()) {
                                    list.setChecked(true);
                                }
                            }
                        }
                    }
                    request.setAttribute("listD", listD);
                    request.setAttribute("listC", listC);
                    request.setAttribute("index", index);
                    request.setAttribute("indexCount", indexCount);
                }
            } else {
                url = AUTHO;
            }
        } catch (Exception e) {
            log("ERROR at GetDeviceController: " + e.getMessage());
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
