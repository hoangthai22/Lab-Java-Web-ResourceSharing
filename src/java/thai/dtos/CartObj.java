/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.dtos;

import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author ASUS
 */
public class CartObj implements Serializable {
    
    private String customerName;
    private HashMap<Integer, DeviceObj> cart;
    
    public CartObj(String customerName, HashMap<Integer, DeviceObj> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }
    
    public CartObj(String customerName) {
        this.customerName = customerName;
        this.cart = new HashMap<>();
    }
    
    public CartObj() {
        this.customerName = customerName;
        this.cart = new HashMap<>();
    }
    
    public String getCustomerName() {
        return customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public HashMap<Integer, DeviceObj> getCart() {
        return cart;
    }
    
    public void setCart(HashMap<Integer, DeviceObj> cart) {
        this.cart = cart;
    }
    
    public void addToCart(DeviceObj dto) {
        
        this.cart.put(dto.getDeviceId(), dto);
    }
    
    public boolean removeDeviceInCart(int id) {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
            return true;
        }
        return false;
    }
    
    public boolean updateCart(int id, int quantity) {
        boolean result = false;
        if (this.cart.containsKey(id)) {
            this.cart.get(id).setDeviceQuantity(quantity);
            result = true;
        }
        return result;
    }
}
