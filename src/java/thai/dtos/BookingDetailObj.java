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
public class BookingDetailObj {

    int deviceID;
    String deviceName;
    String deviceColor;
    int bookingQuantity;
    String bookingID;
    String deviceCategory;

    public BookingDetailObj(int deviceID, String deviceName, String deviceColor, int bookingQuantity, String bookingID, String deviceCategory) {
        this.deviceID = deviceID;
        this.deviceName = deviceName;
        this.deviceColor = deviceColor;
        this.bookingQuantity = bookingQuantity;
        this.bookingID = bookingID;
        this.deviceCategory = deviceCategory;
    }

   

    public BookingDetailObj() {
    }

    public void setDeviceCategory(String deviceCategory) {
        this.deviceCategory = deviceCategory;
    }

    public String getDeviceCategory() {
        return deviceCategory;
    }

    public int getDeviceID() {
        return deviceID;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public String getDeviceColor() {
        return deviceColor;
    }

    public int getBookingQuantity() {
        return bookingQuantity;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setDeviceID(int deviceID) {
        this.deviceID = deviceID;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public void setDeviceColor(String deviceColor) {
        this.deviceColor = deviceColor;
    }

    public void setBookingQuantity(int bookingQuantity) {
        this.bookingQuantity = bookingQuantity;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

}
