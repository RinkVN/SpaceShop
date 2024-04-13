/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author datla
 */
public class VariantInfo {

    private int VariantID;
    private int ProductID;
    private String ProductColor;
    private String Size;
    private String Material;

    public VariantInfo(int ProductID,String ProductColor, String Size, String Material) {
        this.ProductID = ProductID;
        this.ProductColor = ProductColor;
        this.Size = Size;
        this.Material = Material;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getVariantID() {
        return VariantID;
    }

    public void setVariantID(int VariantID) {
        this.VariantID = VariantID;
    }

    public String getProductColor() {
        return ProductColor;
    }

    public void setProductColor(String ProductColor) {
        this.ProductColor = ProductColor;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String Material) {
        this.Material = Material;
    }

    @Override
    public String toString() {
        return "VariantInfo{" + "VariantID=" + VariantID + ", ProductID=" + ProductID + ", ProductColor=" + ProductColor + ", Size=" + Size + ", Material=" + Material + '}';
    }

    

}
