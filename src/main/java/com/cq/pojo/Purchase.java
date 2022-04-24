package com.cq.pojo;

import java.util.Date;
//进货单子
public class Purchase {
    private String id;//主键 uuid生成
    private String goods_id;//商品的编号也是uuid
    private int amount;//数量
    private double price;//价格
    private String purchase_time;//进货时间
    private String purchase_time_end;//进货时间
    private String supplier_id;//供应商的编号 首字母缩写
    private String purchase_user_id;//采购员的编号 首字母加编号

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPurchase_time() {
        return purchase_time;
    }

    public void setPurchase_time(String purchase_time) {
        this.purchase_time = purchase_time;
    }

    public String getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(String supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getPurchase_user_id() {
        return purchase_user_id;
    }

    public void setPurchase_user_id(String purchase_user_id) {
        this.purchase_user_id = purchase_user_id;
    }

    public String getPurchase_time_end() {
        return purchase_time_end;
    }

    public void setPurchase_time_end(String purchase_time_end) {
        this.purchase_time_end = purchase_time_end;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id='" + id + '\'' +
                ", goods_id='" + goods_id + '\'' +
                ", amount=" + amount +
                ", price=" + price +
                ", purchase_time='" + purchase_time + '\'' +
                ", purchase_time_end='" + purchase_time_end + '\'' +
                ", supplier_id='" + supplier_id + '\'' +
                ", purchase_user_id='" + purchase_user_id + '\'' +
                '}';
    }
}
