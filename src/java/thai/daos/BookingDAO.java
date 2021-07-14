/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;

import java.util.List;

import thai.dbs.MyConnection;
import thai.dtos.BookingDetailObj;
import thai.dtos.BookingObj;
import thai.dtos.DeviceObj;

/**
 *
 * @author ASUS
 */
public class BookingDAO {

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

    public boolean insertBooking(BookingObj dto) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO [dbo].[Booking]([bookingID],[userID], [requestDate],[payDate],[bookingStatus])\n"
                    + "VALUES (?,?,?,?,?)";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);

            PRE.setString(1, dto.getBookingId());
            PRE.setString(2, dto.getUserId());
            PRE.setDate(3, dto.getRequestDate());
            PRE.setDate(4, dto.getPayDate());
            PRE.setString(5, dto.getBookingStatus());

            check = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertBookingDetail(BookingDetailObj dto) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO [dbo].[BookingDetails] ([deviceID],[deviceName],[deviceColor],[bookingQuantity],[bookingID],[deviceCategory])\n"
                    + "VALUES (?,?,?,?,?,?)";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);

            PRE.setInt(1, dto.getDeviceID());
            PRE.setString(2, dto.getDeviceName());
            PRE.setString(3, dto.getDeviceColor());
            PRE.setInt(4, dto.getBookingQuantity());
            PRE.setString(5, dto.getBookingID());
            PRE.setString(6, dto.getDeviceCategory());

            check = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<BookingObj> getAllBooking() throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String sql = "SELECT [bookingID],[userID],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM [dbo].[Booking]\n"
                    + "ORDER BY requestDate DESC";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            RS = PRE.executeQuery();

            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                String userID = RS.getString("userID");
                String bookingStatus = RS.getString("bookingStatus");
                Date requestDate = RS.getDate("requestDate");

                Date payDate = RS.getDate("payDate");
                dto = new BookingObj(bookingID, userID, requestDate, payDate, bookingStatus);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingDetailObj> getBookingDetailByBookingID(String id) throws SQLException {
        List<BookingDetailObj> result = new ArrayList<>();
        BookingDetailObj dto = null;
        try {
            String sql = "SELECT [deviceID],[deviceName],[deviceColor],[bookingQuantity],[deviceCategory]\n"
                    + "FROM BookingDetails\n"
                    + "WHERE [bookingID] = ? ";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, id);
            RS = PRE.executeQuery();

            while (RS.next()) {
                String deviceName = RS.getString("deviceName");
                int deviceID = RS.getInt("deviceID");
                String deviceColor = RS.getString("deviceColor");
                String deviceCategory = RS.getString("deviceCategory");
                int bookingQuantity = RS.getInt("bookingQuantity");
                dto = new BookingDetailObj(deviceID, deviceName, deviceColor, bookingQuantity, id, deviceCategory);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public BookingObj getBookingByBookingID(String id) throws SQLException {

        BookingObj dto = null;
        try {
            String sql = "SELECT [userId],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM Booking\n"
                    + "WHERE [bookingID] = ? \n"
                    + "ORDER BY requestDate DESC";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, id);
            RS = PRE.executeQuery();

            while (RS.next()) {

                String userId = RS.getString("userId");
                String bookingStatus = RS.getString("bookingStatus");
                Date requestDate = RS.getDate("requestDate");
                Date payDate = RS.getDate("payDate");
                dto = new BookingObj(id, userId, requestDate, payDate, bookingStatus);
            }

        } finally {
            closeConnection();
        }
        return dto;
    }

    public List<BookingObj> getBookingByUserID(String id) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String sql = "SELECT [bookingID],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM Booking\n"
                    + "WHERE [userID] = ? \n"
                    + "ORDER BY requestDate DESC";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, id);
            RS = PRE.executeQuery();

            while (RS.next()) {

                String bookingId = RS.getString("bookingID");
                String bookingStatus = RS.getString("bookingStatus");
                Date requestDate = RS.getDate("requestDate");
                Date payDate = RS.getDate("payDate");
                dto = new BookingObj(bookingId, id, requestDate, payDate, bookingStatus);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateStatusBooking(String bookingID, String status) throws SQLException {
        boolean check = false;

        try {
            String sql = "UPDATE Booking set bookingStatus = ? WHERE bookingID = ?";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, status);
            PRE.setString(2, bookingID);
            check = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public List<BookingObj> searchBookingByDate(String By, String requestDate, String payDate) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String by = By;
            String sql = "SELECT [bookingID],[userID],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM [dbo].[Booking]\n"
                    + "WHERE " + by + " between ? and ?";

            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, requestDate);
            PRE.setString(2, payDate);
            RS = PRE.executeQuery();
            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                String userID = RS.getString("userID");
                String bookingStatus = RS.getString("bookingStatus");
                Date request = RS.getDate("requestDate");
                // System.out.println(request);
                Date pay = RS.getDate("payDate");
                dto = new BookingObj(bookingID, userID, request, pay, bookingStatus);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingObj> searchBookingByRequestDate(String userID, String requestDate) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {

            String sql = "SELECT [bookingID],[userID],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM [dbo].[Booking]\n"
                    + "WHERE requestDate = ? AND userID = ?";

            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, requestDate);
            PRE.setString(2, userID);
            RS = PRE.executeQuery();
            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                String bookingStatus = RS.getString("bookingStatus");
                Date request = RS.getDate("requestDate");
                Date pay = RS.getDate("payDate");
                dto = new BookingObj(bookingID, userID, request, pay, bookingStatus);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingObj> searchBookingByKey(String txtSearch, String status) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String sql = "SELECT DISTINCT [Booking].bookingID\n"
                    + "FROM [dbo].[Booking]  JOIN [dbo].[BookingDetails] ON [Booking].bookingID = [BookingDetails].bookingID\n"
                    + "WHERE  [BookingDetails].deviceName LIKE ? AND bookingStatus LIKE ? OR [Booking].userID LIKE ? AND bookingStatus LIKE ?";

            /*String textDeviceName = "";
            String textStatus = "";
            if (txtSearch != null) {
                textDeviceName = txtSearch;
            }*/
            if (status.equals("All")) {
                status = "";
                //sql = sql.concat("AND bookingStatus = ?");
            }
            //sql = sql.concat("OR [Booking].userID LIKE ?");

            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, "%" + txtSearch + "%");
            /*if (!status.equals("All")) {
                PRE.setString(2, textStatus);
            }*/
            PRE.setString(2, "%" + status + "%");
            PRE.setString(3, "%" + txtSearch + "%");
            PRE.setString(4, "%" + status + "%");
            System.out.println(sql);
            RS = PRE.executeQuery();
            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                dto = new BookingObj(bookingID);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingObj> searchHistoryBookingByKey(String txtSearch, String userID) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String sql = "SELECT DISTINCT [Booking].bookingID\n"
                    + "FROM [dbo].[Booking]  JOIN [dbo].[BookingDetails] ON [Booking].bookingID = [BookingDetails].bookingID\n"
                    + "WHERE  [BookingDetails].deviceName LIKE ?  AND [dbo].[Booking].userID = ? ";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, "%" + txtSearch + "%");
            PRE.setString(2, userID);
            RS = PRE.executeQuery();
            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                dto = new BookingObj(bookingID);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingObj> getBookingByIndexPage(int index) throws SQLException {
        List<BookingObj> result = new ArrayList<>();
        BookingObj dto = null;
        try {
            String sql = " SELECT [bookingID],[userID],[bookingStatus],[requestDate],[payDate]\n"
                    + "FROM [dbo].[Booking]\n"
                    + "ORDER BY requestDate DESC\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 20 ROWS ONLY;";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setInt(1, (index - 1) * 20);
            RS = PRE.executeQuery();
            while (RS.next()) {
                String bookingID = RS.getString("bookingID");
                String userID = RS.getString("userID");
                String bookingStatus = RS.getString("bookingStatus");
                Date requestDate = RS.getDate("requestDate");
                Date payDate = RS.getDate("payDate");
                dto = new BookingObj(bookingID, userID, requestDate, payDate, bookingStatus);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberPage() throws SQLException {
        int count = 0;
        try {

            String sql = "Select count(*)\n"
                    + "From [dbo].[Booking] \n";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            RS = PRE.executeQuery();
            while (RS.next()) {
                int total = RS.getInt(1);
                count = total / 20;
                if (total % 20 != 0) {
                    count++;
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }

   
}
