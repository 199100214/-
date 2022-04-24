package com.cq.dao;

import com.cq.pojo.QueryParameter;
import com.cq.pojo.Supplier;

import java.util.List;
import java.util.Map;

public interface SupplierDao {
    //增加
    int supplierAdd(Supplier supplier);
    //删除
    int supplierDelete(String id);
    //修改
    int supplierUpdate(Supplier supplier);
    //查 list 传页数
    List<Supplier> supplierList(QueryParameter queryParameter);
    //查一个
    Supplier supplierOne(String id);
    //条件查询
    List<Supplier> supplierSelectList(Map<String,Object> map);

}
