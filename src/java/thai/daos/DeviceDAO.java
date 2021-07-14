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
import java.util.ArrayList;
import java.util.List;
import thai.dbs.MyConnection;
import thai.dtos.DeviceObj;

/**
 *
 * @author ASUS
 */
public class DeviceDAO {

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

    public List<DeviceObj> getDevice() throws SQLException {
        List<DeviceObj> result = new ArrayList<>();

        try {
            String sql = "SELECT deviceID ,deviceName, deviceColor,deviceQuantity ,categoryName, deviceStatus\n"
                    + "FROM [dbo].[Device] JOIN [dbo].[Category] ON [Device].[deviceCategoryID]=[Category].[categoryID]\n"
                    + "ORDER BY deviceName";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            RS = PRE.executeQuery();
            while (RS.next()) {
                int deviceId = RS.getInt("deviceID");
                String deviceName = RS.getString("deviceName");
                String deviceColor = RS.getString("deviceColor");
                String categoryName = RS.getString("categoryName");
                String deviceStatus = RS.getString("deviceStatus");
                int deviceQuantity = RS.getInt("deviceQuantity");
                DeviceObj Dev = new DeviceObj(deviceId, deviceName, deviceColor, categoryName, deviceQuantity, deviceStatus);
                result.add(Dev);
            }
        } finally {
            closeConnection();
        }

        return result;

    }

    public List<DeviceObj> findDevice(DeviceObj deviceFind) throws SQLException {
        List<DeviceObj> result = new ArrayList<>();

        try {
            String sql = "SELECT deviceID ,deviceName, deviceColor,deviceQuantity ,categoryName, deviceStatus\n"
                    + "FROM [dbo].[Device] JOIN [dbo].[Category] ON [Device].[deviceCategoryID]=[Category].[categoryID]\n"
                    + "WHERE deviceName LIKE ?";

            String textName = "";
            String textCat = "";
            if (deviceFind.getDeviceName() != null) {
                textName = deviceFind.getDeviceName();
            }
            if (deviceFind.getCategoryName() != null) {
                sql = sql.concat(" AND categoryName LIKE ? ");
                textCat = deviceFind.getCategoryName();
            }
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);

            PRE.setString(1, "%" + textName + "%");
            if (deviceFind.getCategoryName() != null) {
                PRE.setString(2, "%" + textCat + "%");
            }
            RS = PRE.executeQuery();

            while (RS.next()) {
                int deviceId = RS.getInt("deviceID");
                String deviceName = RS.getString("deviceName");
                String deviceColor = RS.getString("deviceColor");
                String categoryName = RS.getString("categoryName");
                String deviceStatus = RS.getString("deviceStatus");
                int deviceQuantity = RS.getInt("deviceQuantity");
                DeviceObj Dev = new DeviceObj(deviceId, deviceName, deviceColor, categoryName, deviceQuantity, deviceStatus);
                result.add(Dev);
            }
        } finally {
            closeConnection();
        }
        return result;

    }

    public DeviceObj findByPrimaryKey(String id) throws Exception {
        DeviceObj dto = null;
        try {
            String sql = "SELECT deviceID ,deviceName, deviceColor,deviceQuantity ,categoryName, deviceStatus\n"
                    + "FROM [dbo].[Device] JOIN [dbo].[Category] ON [Device].[deviceCategoryID]=[Category].[categoryID]\n"
                    + "WHERE deviceID = ?";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, id);
            RS = PRE.executeQuery();
            if (RS.next()) {
                int deviceId = RS.getInt("deviceID");
                String deviceName = RS.getString("deviceName");
                String deviceColor = RS.getString("deviceColor");
                String categoryName = RS.getString("categoryName");
                String deviceStatus = RS.getString("deviceStatus");
                int deviceQuantity = RS.getInt("deviceQuantity");
                dto = new DeviceObj(deviceId, deviceName, deviceColor, categoryName, deviceQuantity, deviceStatus);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public List<DeviceObj> findByDate(String dateStart, String dateEnd) throws Exception {
        List<DeviceObj> result = new ArrayList<>();
        DeviceObj dto = null;
        try {
            String sql = "SELECT deviceID ,deviceName, deviceColor,deviceQuantity ,categoryName, deviceStatus\n"
                    + "FROM [dbo].[Device] JOIN [dbo].[Category] ON [Device].[deviceCategoryID]=[Category].[categoryID]\n"
                    + "WHERE deviceDateCreate between ? and ? ";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, dateStart);
            PRE.setString(2, dateEnd);
            RS = PRE.executeQuery();
            while (RS.next()) {
                int deviceId = RS.getInt("deviceID");
                String deviceName = RS.getString("deviceName");
                String deviceColor = RS.getString("deviceColor");
                String categoryName = RS.getString("categoryName");
                String deviceStatus = RS.getString("deviceStatus");
                int deviceQuantity = RS.getInt("deviceQuantity");
                dto = new DeviceObj(deviceId, deviceName, deviceColor, categoryName, deviceQuantity, deviceStatus);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<DeviceObj> getDeviceByIndexPage(int index, String role) throws SQLException {
        List<DeviceObj> result = new ArrayList<>();

        try {
            if (role.equals("EM")) {
                role = "Lv1";
            } else {
                role = "";
            }
            String sql = "SELECT [deviceID],[deviceName],[deviceColor],[deviceQuantity],[deviceCategoryID],[deviceStatus],[deviceLevel]\n"
                    + "From [dbo].[Device]\n"
                    + "WHERE [deviceStatus] = 'Active' AND deviceLevel LIKE ? AND deviceQuantity > 0\n"
                    + "ORDER BY deviceName\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 20 ROWS ONLY;";
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setString(1, "%" + role + "%");
            PRE.setInt(2, (index - 1) * 20);
            RS = PRE.executeQuery();
            while (RS.next()) {
                int deviceID = RS.getInt("deviceID");
                String deviceName = RS.getString("deviceName");
                String deviceColor = RS.getString("deviceColor");
                String deviceCategoryID = RS.getString("deviceCategoryID");
                int deviceQuantity = RS.getInt("deviceQuantity");
                String deviceStatus = RS.getString("deviceStatus");
                String deviceLevel = RS.getString("deviceLevel");
                DeviceObj pro = new DeviceObj(deviceID, deviceName, deviceColor, deviceCategoryID, deviceQuantity, deviceLevel);
                result.add(pro);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberPage(String role) throws SQLException {
        int count = 0;
        try {

            String sql = "Select count(*)\n"
                    + "From [dbo].[Device] \n";
            if (role.equals("EM")) {
                sql = sql.concat("WHERE deviceLevel = 'Lv1'");
            }
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

    public boolean updateQuantityDecrease(int id, int quantity) throws Exception {
        boolean result = false;
        String sql = "Update [dbo].[Device] set deviceQuantity = deviceQuantity - ?\n"
                + "where deviceID = ?";
        try {
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setInt(1, quantity);
            PRE.setInt(2, id);
            result = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateQuantityIncrease(int id, int quantity) throws Exception {
        boolean result = false;
        String sql = "Update [dbo].[Device] set deviceQuantity = deviceQuantity + ?\n"
                + "where deviceID = ?";
        try {
            CONN = MyConnection.getMyConnection();
            PRE = CONN.prepareStatement(sql);
            PRE.setInt(1, quantity);
            PRE.setInt(2, id);
            result = PRE.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

}
