package com.cq.service.impl;

import com.cq.dao.SupplierDao;
import com.cq.exception.LoginException;
import com.cq.pojo.QueryParameter;
import com.cq.pojo.Supplier;
import com.cq.service.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    private SupplierDao supplierDao ;
//    添加
    @Override
    public int supplierAdd(Supplier supplier) {
        return supplierDao.supplierAdd(supplier);
    }
// 删除
    @Override
    public int supplierDelete(String id) {
        return supplierDao.supplierDelete(id);
    }
//更新 先查 在更新
    @Override
    public int supplierUpdate(Supplier supplier)throws LoginException  {
        Supplier supplier1 =  supplierDao.supplierOne(supplier.getId());
        if (supplier.equals(supplier1.getId())){
            throw new LoginException("更新的账户编号重复,更新失败");
        }
        return supplierDao.supplierUpdate(supplier);
    }
//查全部 包含页码
    @Override
    public List<Supplier> supplierList(QueryParameter queryParameter) {
//        页数 前端传的页数
        int pageNo = queryParameter.getPageNo();
        //一页多少条
        int pageSize =  queryParameter.getPageSize();
        int pageOffset = (pageNo-1)*pageSize;//写到这里了 我还是在说下 ,以后写的时候 最好在实体类里面,再加一个总的条数,也可以加在 翻页的这里面
        // 我的建议 加载这个翻页的类里面 知道总数 count(*)
        //偏移量
        queryParameter.setOffSet(pageOffset);
        return supplierDao.supplierList(queryParameter);
    }
//查单个的
    @Override
    public Supplier supplierOne(String id) {
        return supplierDao.supplierOne(id);
    }
//查列表的 条件查询
    @Override
    public List<Supplier> supplierSelectList(Map<String, Object> map) {
        //以后再这里 把翻页的类 修改下 加一个实体类 接口方法单单独查一下总条数,通过 页数*每页显示的值,来判断当前的页码是否正确
        //如果不正确 改变页码 改成最后一页
//        QueryParameter queryParameter = (QueryParameter) map.get("queryParameter");
//
//        if(queryParameter.getPageNo()<){
//            queryParameter.
//                    queryParameter.setPageNo(1);
//        }else if (queryParameter.getPageNo() ==1000){
//
//        }
        return supplierDao.supplierSelectList(map);
    }
}
