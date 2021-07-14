/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.dtos;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class RegistrationObj {

    private String userId;
    private String password;
    private String fullName;
    private String phoneNumber;
    private String address;
    private String roleId;
    private String verificationCode;
    private String status;
    private Timestamp createDate;
    
    public RegistrationObj(String userId, String password, String fullName, String phoneNumber, String address, String roleId, String verificationCode, String status, Timestamp createDate) {
        this.userId = userId;
        this.password = password;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.roleId = roleId;
        this.verificationCode = verificationCode;
        this.status = status;
        this.createDate = createDate;
    }
    
    public RegistrationObj(String userId, String password, String fullName, String roleId, String status) {
        this.userId = userId;
        this.password = password;
        this.fullName = fullName;
        this.roleId = roleId;
        this.status = status;
    }
    
    

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public RegistrationObj() {
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public String getRoleId() {
        return roleId;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

}
