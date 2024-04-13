/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

/**
 *
 * @author datla
 */
public class CartDAOimpl implements CartDAO {

    private Connection conn;

    public CartDAOimpl(Connection conn) {
        this.conn = conn;
    }

    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "Insert into cart(ProductID,userID,ProductName,ProductColor,Size,price,Quantity,totalPrice,Discount,DiscountCode) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getProductID());
            ps.setInt(2, c.getUserID());
            ps.setString(3, c.getProductName());
            ps.setString(4, c.getProductColor());
            ps.setString(5, c.getSize());
            ps.setFloat(6, c.getPrice());
            ps.setInt(7, c.getQuantity());
            ps.setFloat(8, c.getTotalPrice());
            ps.setInt(9, c.getDiscount());
            ps.setString(10, c.getDiscountCode());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Cart> getProductByUser(int userID) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        float totalPrice = (float) 0.0;
        try {

            String sql = "SELECT * FROM cart JOIN product ON cart.ProductID = product.ProductID Where userID=?";
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setProductID(rs.getInt(2));
                c.setUserID(rs.getInt(3));
                c.setProductName(rs.getString(4));
                c.setProductColor(rs.getString(5));
                c.setSize(rs.getString(6));
                c.setPrice(rs.getFloat(7));
                c.setQuantity(rs.getInt(8));
                totalPrice = totalPrice + rs.getFloat(9);
                c.setTotalPrice((float) totalPrice);
                c.setDiscount(rs.getInt(10));
                c.setDiscountCode(rs.getString(11));
                c.setProductPhoto(rs.getString(14));

                

                list.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean removeProduct(int ProductID, int userID) {
        boolean f = false;

        try {
            String sql = "Delete From cart Where ProductID=? And userID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ps.setInt(2, userID);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
