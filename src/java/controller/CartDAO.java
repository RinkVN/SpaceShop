/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package controller;

import java.util.List;
import model.ProductInfo;
import model.Cart;

/**
 *
 * @author datla
 */
public interface CartDAO {
    
    public boolean addCart (Cart c);
 
    public List<Cart> getProductByUser(int userID);
    
    public boolean removeProduct(int ProductID, int userID);
}
