/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author datla
 */
public class ProductInfo {

    private int ProductID;
    private String ProductName;
    private String price;
    private String sku;
    private String ProductPhoto;
    private int UnitsInStock;
    private int UnitsOnOrder;
    private String Description;
    private String Status;

    private String CategoryName;
    private String NewCategory;

    public ProductInfo() {
        super();
    }

    public ProductInfo(String ProductName, String price, String sku, String ProductPhoto, int UnitsInStock, String Description, String Status, String CategoryName, String NewCategory) {
        this.ProductName = ProductName;
        this.price = price;
        this.sku = sku;
        this.ProductPhoto = ProductPhoto;
        this.UnitsInStock = UnitsInStock;
//        this.UnitsOnOrder = UnitsOnOrder;
        
        this.Description = Description;
        this.Status = Status;
        this.CategoryName = CategoryName;
        this.NewCategory = NewCategory;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    
    
    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getProductPhoto() {
        return ProductPhoto;
    }

    public void setProductPhoto(String ProductPhoto) {
        this.ProductPhoto = ProductPhoto;
    }

    public int getUnitsInStock() {
        return UnitsInStock;
    }

    public void setUnitsInStock(int UnitsInStock) {
        this.UnitsInStock = UnitsInStock;
    }

    public int getUnitsOnOrder() {
        return UnitsOnOrder;
    }

    public void setUnitsOnOrder(int UnitsOnOrder) {
        this.UnitsOnOrder = UnitsOnOrder;
    }

    
    
    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getNewCategory() {
        return NewCategory;
    }

    public void setNewCategory(String NewCategory) {
        this.NewCategory = NewCategory;
    }

    @Override
    public String toString() {
        return "ProductInfo{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", price=" + price + ", sku=" + sku + ", ProductPhoto=" + ProductPhoto + ", UnitsInStock=" + UnitsInStock + ", UnitsOnOrder=" + UnitsOnOrder + ", Description=" + Description + ", Status=" + Status + ", CategoryName=" + CategoryName + ", NewCategory=" + NewCategory + '}';
    }

   

  

}
