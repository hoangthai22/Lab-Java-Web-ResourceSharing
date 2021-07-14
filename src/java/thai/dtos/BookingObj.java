/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.dtos;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class BookingObj {

    String bookingId;
    String userId;
    Date requestDate;
    Date payDate;
    String bookingStatus;
    String description;

    public BookingObj(String bookingId, String userId, Date requestDate, Date payDate, String bookingStatus) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.requestDate = requestDate;
        this.payDate = payDate;
        this.bookingStatus = bookingStatus;
    }

    public BookingObj(String bookingId) {
        this.bookingId = bookingId;
    }

    public BookingObj(String bookingId, String userId, Date requestDate, Date payDate, String bookingStatus, String description) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.requestDate = requestDate;
        this.payDate = payDate;
        this.bookingStatus = bookingStatus;
        this.description = description;
    }

    public String getBookingId() {
        return bookingId;
    }

    public String getUserId() {
        return userId;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
