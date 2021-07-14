/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.dtos;

/**
 *
 * @author ASUS
 */
public class CategoryObj {
    private String categoryId;
    private String categoryName;
    private String categoryStatus;

    public CategoryObj() {
    }

    public CategoryObj(String categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        
    }

    public String getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getCategoryStatus() {
        return categoryStatus;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setCategoryStatus(String categoryStatus) {
        this.categoryStatus = categoryStatus;
    }
    
    
    
    
}
