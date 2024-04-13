/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.ProductInfo;
import model.VariantInfo;

/**
 *
 * @author datla
 */
public class ProductDAOimpl implements ProductDAO {

    private Connection conn;

    public ProductDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    //    Add Book ---------------------------------------------
    public boolean addProduct(ProductInfo b) {
        boolean f = false;

        try {
            String sql = "INSERT INTO product(ProductName, price, sku, ProductPhoto, UnitsInStock, Description, Status, CategoryName, NewCategory) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getProductName());
            ps.setString(2, b.getPrice());
            ps.setString(3, b.getSku());
            ps.setString(4, b.getProductPhoto());
            ps.setInt(5, b.getUnitsInStock());
            ps.setString(6, b.getDescription());
            ps.setString(7, b.getStatus());
            ps.setString(8, b.getCategoryName());
            ps.setString(9, b.getNewCategory());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //    Add Variant ---------------------------------------------
    public boolean addVariant(VariantInfo variant) {
        boolean f = false;

        try {
            String variantSql = "INSERT INTO variant(ProductID, ProductColor, Size) VALUES (?, ?, ?)";
            PreparedStatement variantPs = conn.prepareStatement(variantSql);
            variantPs.setInt(1, variant.getProductID());
            variantPs.setString(2, variant.getProductColor());
            variantPs.setString(3, variant.getSize());

            // Thực thi câu lệnh
            int affectedRows = variantPs.executeUpdate();
            if (affectedRows == 1) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<ProductInfo> getAllProduct() {
        List<ProductInfo> list = new ArrayList<ProductInfo>();
        ProductInfo p = null;
//Where ProductName IS NOT NULL AND Status IS NOT NULL
        try {
            String sql = "Select * From product ";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setSku(rs.getString(5));
                p.setUnitsInStock(rs.getInt(6));

                p.setDescription(rs.getString(8));
                p.setCategoryName(rs.getString(9));
                p.setNewCategory(rs.getString(10));
                p.setStatus(rs.getString(11));
                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductInfo getProductById(int id) {
        ProductInfo p = null;
        try {
            String sql = "Select * From product Where ProductID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setSku(rs.getString(5));
                p.setUnitsInStock(rs.getInt(6));

                p.setDescription(rs.getString(8));
                p.setCategoryName(rs.getString(9));
                p.setNewCategory(rs.getString(10));
                p.setStatus(rs.getString(11));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public ProductInfo getNewProductId(int id) {
        ProductInfo b = null;
        try {
            String sql = "SELECT MAX(ProductID) FROM product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new ProductInfo();
                b.setProductID(rs.getInt(1));
                b.setProductName(rs.getString(2));
                b.setPrice(rs.getString(3));
                b.setStatus(rs.getString(4));
                b.setProductPhoto(rs.getString(5));
                b.setSku(rs.getString(6));
                b.setDescription(rs.getString(7));
                b.setUnitsInStock(rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

//    Get ProductID for Variant table
//    public ProductInfo getProductId(int id) {
//        ProductInfo b = null;
//        try {
//            String sql = "Select * From book Where bookID = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                b.setSku(rs.getString(9));
//                b.setDescription(rs.getString(10));
//                b.setDescriptionAuthor(rs.getString(11));
//                b.setPageNumber(rs.getString(12));
//                b.setLanguage(rs.getString(13));
//                b.setPublisher(rs.getString(14));
//                b.setQuantity(rs.getString(15));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return b;
//    }
//
////    Edit Book ---------------------------------------------
//    public boolean editBook(ProductInfo b) {
//        boolean f = false;
//
//        try {
//            String sql = "UPDATE book SET bookName=?, author=?, price=?, bookCategory=?, newCategory=?, status=?, vendor=?, sku=?, description=?, descriptionAuthor=?, pageNumber=?, language=?, publisher=?, quantity=? WHERE bookId=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, b.getBookName());
//            ps.setString(2, b.getAuthor());
//            ps.setString(3, b.getPrice());
//            ps.setString(4, b.getBookCategory());
//            ps.setString(5, b.getNewCategory());
//            ps.setString(6, b.getStatus());
//            ps.setString(7, b.getVendor());
//            ps.setString(8, b.getSku());
//            ps.setString(9, b.getDescription());
//            ps.setString(10, b.getDescriptionAuthor());
//            ps.setString(11, b.getPageNumber());
//            ps.setString(12, b.getLanguage());
//            ps.setString(13, b.getPublisher());
//            ps.setString(14, b.getQuantity());
//            ps.setInt(15, b.getBookId());
//
//            int i = ps.executeUpdate();
//            if (i == 1) {
//                f = true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return f;
//    }
//
//    //    Delete Book ---------------------------------------------
//    public boolean deleteBook(int id) {
//        boolean f = false;
//        try {
//            String sql = "Delete From book Where bookId=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            int i = ps.executeUpdate();
//            if (i == 1) {
//                f = true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return f;
//    }
//
    //    NEW Product ---------------------------------------------
    public List<ProductInfo> getNewProduct() {

        List<ProductInfo> list = new ArrayList<ProductInfo>();
        ProductInfo p = null;

        try {
            String sql = "Select * From product Order by ProductID DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 10) {

                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setPrice(rs.getString(3));
                p.setStatus(rs.getString(4));
                p.setProductPhoto(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setDescription(rs.getString(7));
                p.setUnitsInStock(rs.getInt(8));
                list.add(p);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//
//    //    RECENT Book ---------------------------------------------
//    public List<ProductInfo> getRecentBook() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where status=? Order by BookId ASC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            int i = 1;
//            while (rs.next() && i <= 4) {
//
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                list.add(b);
//                i++;
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    OLD Book ---------------------------------------------
//    public List<ProductInfo> getOldBook() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where bookCategory=? And status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Old");
//            ps.setString(2, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            int i = 1;
//            while (rs.next() && i <= 4) {
//
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                list.add(b);
//                i++;
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    ALL NEW Book ---------------------------------------------
//    public List<ProductInfo> getAllNewBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where bookCategory=? And status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "New");
//            ps.setString(2, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    RECENT Book ---------------------------------------------
//    public List<ProductInfo> getAllRecentBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    OLD Book ---------------------------------------------
//    public List<ProductInfo> getAllOldBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where bookCategory=? And status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Old");
//            ps.setString(2, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                b.setBookId(rs.getInt(1));
//                b.setBookName(rs.getString(2));
//                b.setAuthor(rs.getString(3));
//                b.setPrice(rs.getString(4));
//                b.setBookCategory(rs.getString(5));
//                b.setStatus(rs.getString(6));
//                b.setPhoto(rs.getString(7));
//                b.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}
