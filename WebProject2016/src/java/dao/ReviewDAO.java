/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import beans.RestaurantBean;
import beans.ReviewBean;
import database.ManagerDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author RiccardoUni
 */
public class ReviewDAO {
    private ManagerDB db = null;
    private Connection con = null;

    public ReviewDAO() {
        db = new ManagerDB();
        con = db.getConnection();
    }
    
    public int insertReview(ReviewBean revBean) throws SQLException {
        
        int affectedRows;
        int result = 0;
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) " +
                            "VALUES (?,?,?,?,?,?,?,?,?,?)");
        ps.setInt(1, revBean.getGlobal_value());
        ps.setInt(2, revBean.getFood());
        ps.setInt(3, revBean.getService());
        ps.setInt(4, revBean.getValue_for_money());
        ps.setInt(5, revBean.getAtmosphere());
        ps.setString(6, revBean.getName());
        ps.setString(7, revBean.getDescription());
        ps.setString(8, revBean.getData_creation());
        ps.setInt(9,revBean.getId_restaurant());
        ps.setInt(10, revBean.getId_creator());
        ResultSet rs = ps.executeQuery();
        
        
        affectedRows = ps.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Errore inserimento recensione, no rows affected.");
        }
        //Andiamo a vedere se c'è la nuova recensione
        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Errore creazione recensione, no ID obtained.");
            }
        }
        return result;
    }

    public void addPhoto(int reviewID, int photoID) throws SQLException {
        
        PreparedStatement ps = con.prepareStatement("UPDATE reviews SET id_photo = ? WHERE id = ?");
        ps.setInt(1, photoID);
        ps.setInt(2, reviewID);
        
        ResultSet res = ps.executeQuery();
        
        int affectedRows = ps.executeUpdate();
         if (affectedRows == 0) {
            throw new SQLException("Errore inserimento foto, no rows affected.");
        }
        
    }
}