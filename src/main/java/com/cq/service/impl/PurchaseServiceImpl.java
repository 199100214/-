package com.cq.service.impl;

import com.cq.dao.PurchaseDao;
import com.cq.pojo.Purchase;
import com.cq.pojo.QueryParameter;
import com.cq.service.PurchaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Resource
    private PurchaseDao purchaseDao ;
    //采购单新增
    @Override
    public int purchaseAdd(Purchase purchase) {
        return purchaseDao.purchaseAdd(purchase);
    }
    //采购单修改
    @Override
    public int purchaseUpdate(Purchase purchase) {
        return purchaseDao.purchaseUpdate(purchase);
    }
    //删除操作
    @Override
    public int purchaseDelete(String id) {
        return purchaseDao.purchaseDelete(id);
    }
    //查看详情
    @Override
    public Purchase purchaseDetail(String id) {
        return purchaseDao.purchaseDetail(id);
    }
    //查看单子列表
    @Override
    public List<Purchase> purchaseList() {
        return purchaseDao.purchaseList();
    }

    @Override
    public List<Purchase> purchaseListSelect(Map<String, Object> map) {
        QueryParameter queryParameter  = (QueryParameter) map.get("queryParameter");
        int pageNo = queryParameter.getPageNo();
        int pageSize = queryParameter.getPageSize();
        if (pageNo<1){
            pageNo = 1;
        }
        int offSet = (pageNo-1)*pageSize;
        queryParameter.setOffSet(offSet);
        map.remove("queryParameter");//移除旧的 换上新的
        map.put("queryParameter",queryParameter);
        System.out.println(((QueryParameter) map.get("queryParameter")).getOffSet());
//        List<Purchase> purchaseListSelect = purchaseDao.purchaseListSelect(map);
//        if (purchaseListSelect.size()<10){
//            //这里有个没有处理好的问题 当 页面的 显示数 比原有的数据分页的数据多的时候就会一直更新 第一页 没有任何提示
//        }
        return purchaseDao.purchaseListSelect(map);
    }
}
