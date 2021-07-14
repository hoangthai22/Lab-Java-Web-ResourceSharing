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
import thai.dtos.CategoryObj;

/**
 *
 * @author ASUS
 */
public class CategoryDAO {

    private Connection CONN = null;
    private PreparedStatement PRE_STM = null;
    private ResultSet RS = null;

    private void closeConnection() {
        try {
            if (RS != null) {
                RS.close();
            }
            if (PRE_STM != null) {
                PRE_STM.close();
            }
            if (CONN != null) {
                CONN.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CategoryObj> getAllCategory() throws Exception {
        List<CategoryObj> result = new ArrayList<>();
        CategoryObj dto = new CategoryObj();
        try {
            String sql = "Select categoryID , categoryName\n"
                    + "From Category";
            CONN = MyConnection.getMyConnection();
            PRE_STM = CONN.prepareStatement(sql);
            RS = PRE_STM.executeQuery();
            while (RS.next()) {
                String id = RS.getString("categoryID");
                String name = RS.getString("categoryName");
                dto = new CategoryObj(id, name);
                result.add(dto);
            }
        } catch(SQLException e)  {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return result;
    }

}
