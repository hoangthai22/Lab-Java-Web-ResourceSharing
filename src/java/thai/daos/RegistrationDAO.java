/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import thai.dbs.MyConnection;
import thai.dtos.BookingObj;
import thai.dtos.RegistrationObj;

/**
 *
 * @author ASUS
 */
public class RegistrationDAO {

    private Connection CONN = null;
    private PreparedStatement PRE = null;
    private ResultSet RS = null;

    private void closeConnection() {
        try {
            if (RS != null) {
                RS.close();
            }
            if (PRE != null) {
                PRE.close();
            }
            if (CONN != null) {
                CONN.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public RegistrationObj checkLogin(String username, String password) throws Exception {

        RegistrationObj dto = new RegistrationObj();
        try {
            String passwordSQL = "";
            if (!password.equals("")) {
                passwordSQL = "and [password] = ?";
            }
            String sql = "Select [fullName],password,[roleID],[status]\n"
                    + "From [dbo].[User]\n"
                    + "Where [userID] = ? " + passwordSQL;
            Connection conn = MyConnection.getMyConnection();
            PRE = conn.prepareStatement(sql);
            PRE.setString(1, username);
            if (!password.equals("")) {
                PRE.setString(2, password);
            }
            RS = PRE.executeQuery();
            if (RS.next()) {
                String fullname = RS.getString("fullname");
                String pass = RS.getString("password");
                String role = RS.getString("roleID");
                String status = RS.getString("status");
                dto = new RegistrationObj(username, pass, fullname, role, status);
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean insertAccount(RegistrationObj dto) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO [dbo].[User] ( userID, [password], fullName, phone,[address], createDate, [status], roleID )\n"
                    + "VALUES (?,?,?,?,?,?,?,?)";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, dto.getUserId());
            PRE.setString(2, dto.getPassword());
            PRE.setString(3, dto.getFullName());
            PRE.setString(4, dto.getPhoneNumber());
            PRE.setString(5, dto.getAddress());
            PRE.setTimestamp(6, dto.getCreateDate());
            PRE.setString(7, dto.getStatus());
            PRE.setString(8, dto.getRoleId());

            check = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateAccount(RegistrationObj dto) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE [dbo].[User] set [status] = ? "
                    + "Where [userID] = ?";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, dto.getStatus());
            PRE.setString(2, dto.getUserId());
            check = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
   
}
