/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package controller;

import java.util.List;
import model.ProductInfo;
import model.VariantInfo;

/**
 *
 * @author datla
 */
public interface ProductDAO {

    public boolean addProduct(ProductInfo b);

    public boolean addVariant(VariantInfo variant);
    
    public ProductInfo getNewProductId(int id);

    public List<ProductInfo> getAllProduct();

    public ProductInfo getProductById(int id);
//
//    public boolean editBook(ProductInfo b);
//
//    public boolean deleteBook(int id);
//
    public List<ProductInfo> getNewProduct();
//
//    public List<ProductInfo> getRecentBook();
//
//    public List<ProductInfo> getOldBook();
//
//    public List<ProductInfo> getAllNewBooks();
//
//    public List<ProductInfo> getAllRecentBooks();
//
//    public List<ProductInfo> getAllOldBooks();

}
