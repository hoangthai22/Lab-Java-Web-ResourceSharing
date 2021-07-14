/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thai.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class DeviceObj implements Serializable {

    private int deviceId;
    private String deviceName;
    private String deviceColor;
    private String categoryName;
    private int deviceQuantity;
    private String deviceStatus;
    private boolean checked;
    private boolean error;
    private Date date ;

    public DeviceObj(int deviceId, String deviceName, String deviceColor, String categoryName, int deviceQuantity, String deviceStatus) {
        this.deviceId = deviceId;
        this.deviceName = deviceName;
        this.deviceColor = deviceColor;
        this.categoryName = categoryName;
        this.deviceQuantity = deviceQuantity;
        this.deviceStatus = deviceStatus;
    }

    public DeviceObj(int deviceId, String deviceName, String deviceColor, String categoryName, int deviceQuantity, String deviceStatus, boolean checked, boolean error, Date date) {
        this.deviceId = deviceId;
        this.deviceName = deviceName;
        this.deviceColor = deviceColor;
        this.categoryName = categoryName;
        this.deviceQuantity = deviceQuantity;
        this.deviceStatus = deviceStatus;
        this.checked = checked;
        this.error = error;
        this.date = date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }
    

    public DeviceObj(int deviceId, boolean checked) {
        this.deviceId = deviceId;
        this.checked = checked;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public boolean isError() {
        return error;
    }
    

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isChecked() {
        return checked;
    }

    public DeviceObj() {
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public void setDeviceColor(String deviceColor) {
        this.deviceColor = deviceColor;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setDeviceQuantity(int deviceQuantity) {
        this.deviceQuantity = deviceQuantity;
    }

    public void setDeviceStatus(String deviceStatus) {
        this.deviceStatus = deviceStatus;
    }

    public int getDeviceId() {
        return deviceId;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public String getDeviceColor() {
        return deviceColor;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getDeviceQuantity() {
        return deviceQuantity;
    }

    public String getDeviceStatus() {
        return deviceStatus;
    }

}
