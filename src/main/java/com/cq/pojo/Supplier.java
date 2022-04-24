package com.cq.pojo;

public class Supplier {
    private String id;
    private String name;
    private String address;
    private String contact_telphone;
    private int status;//0正常 1 禁用

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact_telphone() {
        return contact_telphone;
    }

    public void setContact_telphone(String contact_telphone) {
        this.contact_telphone = contact_telphone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", contact_telphone='" + contact_telphone + '\'' +
                ", status=" + status +
                '}';
    }
}
