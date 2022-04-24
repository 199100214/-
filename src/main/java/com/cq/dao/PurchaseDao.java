package com.cq.dao;

import com.cq.pojo.Purchase;

import java.util.List;
import java.util.Map;

public interface PurchaseDao {
    //采购单新增
    int purchaseAdd(Purchase purchase);
    //采购单修改
    int purchaseUpdate(Purchase purchase);
    //删除操作
    int purchaseDelete(String id);
    //查看详情
    Purchase purchaseDetail(String id);
    //查看列表
    List<Purchase> purchaseList();
    //条件查询(一个条件，一个页数)
    List<Purchase> purchaseListSelect(Map<String,Object> map);
}
