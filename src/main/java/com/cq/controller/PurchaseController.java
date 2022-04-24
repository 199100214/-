package com.cq.controller;


import com.cq.pojo.Purchase;
import com.cq.pojo.QueryParameter;
import com.cq.service.PurchaseService;
import com.cq.utils.DateTimeUtil;
import com.cq.utils.UUIDUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PurchaseController {
    private Logger logger = Logger.getLogger(PurchaseController.class);
    @Resource
    private PurchaseService purchaseService;
//    查看列表的
    @RequestMapping("/pur/list")
    public ModelAndView purchaseList(){
        ModelAndView modelAndView = new ModelAndView();
        List<Purchase> purchaseList = purchaseService.purchaseList();
        logger.debug(purchaseList);
        modelAndView.addObject("purchaseList",purchaseList);
        modelAndView.setViewName("/purchase/list");
        return modelAndView;
    }
    //增加进货的信息
    @RequestMapping(value = "pur/add",method = RequestMethod.POST)
    @ResponseBody
    public String purchaseAdd(HttpServletRequest request){
//
//        //private int amount;//数量
//        private double price;//价格
//        private Date purchase_time;//进货时间
//        private String supplier_id;//供应商的编号 首字母缩写
//        private String purchase_user_id;//采购员的编号 首字母加编号
        Purchase purchase = new Purchase();
        purchase.setGoods_id(request.getParameter("goods_id"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        purchase.setAmount(amount);
        double price = Double.valueOf(request.getParameter("price"));
        purchase.setPrice(price);
        purchase.setPurchase_time(request.getParameter("purchase_time"));
        purchase.setSupplier_id(request.getParameter("supplier_id"));
        purchase.setPurchase_user_id(request.getParameter("purchase_user_id"));
        logger.debug(purchase.toString());
        String id = UUIDUtil.getUUID();
        purchase.setId(id);
        logger.debug(purchase.toString());
        int num =purchaseService.purchaseAdd(purchase);
        if (num == 1){
            return "ok";
        }else{
            return "false";
        }
    }
    //根据id查看
    @RequestMapping({"/pur/edit","/pur/detail"})
    public String purchase(HttpServletRequest request){
        Purchase purchase = purchaseService.purchaseDetail(request.getParameter("id"));
        String path = request.getServletPath();
        logger.debug(path);
        logger.debug(purchase.toString());
        request.setAttribute("purchase",purchase);
        if ("/pur/edit".equals(path)){
            return "forward:/view/purchase/edit.jsp";
        }else if ("/pur/detail".equals(path)){
            return "forward:/view/purchase/see.jsp";
        }
        return "wrong";

    }

    ///pur/edit/update 上传数据保存
    @RequestMapping(value = "/pur/edit/update",method = RequestMethod.POST)
    @ResponseBody
    public String purchaseUpdate(HttpServletRequest request){
        Purchase purchase = new Purchase();
        purchase.setId(request.getParameter("id"));
        purchase.setGoods_id(request.getParameter("goods_id"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        purchase.setAmount(amount);
        double price = Double.parseDouble(request.getParameter("price"));
        purchase.setPrice(price);
        purchase.setPurchase_time(request.getParameter("purchase_time"));
        purchase.setSupplier_id(request.getParameter("supplier_id"));
        purchase.setPurchase_user_id(request.getParameter("purchase_user_id"));
        logger.debug(purchase.toString());
        int count = purchaseService.purchaseUpdate(purchase);
        if (count == 1){
            return "ok";
        }else{
            return "false";
        }

    }

    //删除/pur/delete
    @RequestMapping("/pur/delete")
    @ResponseBody
    public String purchaseDelete(String id){
        int count = purchaseService.purchaseDelete(id);
        if (count == 1){
            return "ok";

        }else{
            return "false";
        }
    }
    //条件查询
    @RequestMapping(value = "/pur/list/select",method = RequestMethod.POST)
    @ResponseBody
    public List<Purchase> ListSelect(Purchase purchase,HttpServletRequest request){
        int pageNo= Integer.parseInt(request.getParameter("pageNo"));
        logger.debug(purchase.toString());
        logger.debug(pageNo);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("purchase",purchase);
        QueryParameter queryParameter = new QueryParameter();
        //第一次条件查找存的页码
        queryParameter.setPageNo(pageNo);
        queryParameter.setPageSize(10);//每页放十条
        map.put("queryParameter",queryParameter);
        request.getSession().setAttribute("map",map);
        List<Purchase> purchaseList = purchaseService.purchaseListSelect(map);
        logger.debug(purchaseList);
        return purchaseList;
    }
    //下标的条件查询
    @RequestMapping(value = "/pur/list/selectShow",method = RequestMethod.POST)
    @ResponseBody
    public List<Purchase> ListSelectShow(Purchase purchase,HttpServletRequest request){
        int pageNo = Integer.parseInt(request.getParameter("pageNo"));
        logger.debug(purchase.toString());
        logger.debug(pageNo);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("purchase",purchase);
        QueryParameter queryParameter = new QueryParameter();
        int RePageNo = pageNo;//重新定义的页码
        if (pageNo == -1000){
            Map<String,Object> map1 = (Map<String,Object>) request.getSession().getAttribute("map");
            QueryParameter queryParameter1 = (QueryParameter) map1.get("queryParameter");
            RePageNo = queryParameter.getPageNo()-1;
        }else if(pageNo == 1000){
            Map<String,Object> map1 = (Map<String,Object>) request.getSession().getAttribute("map");
            QueryParameter queryParameter1 = (QueryParameter) map1.get("queryParameter");
            RePageNo = queryParameter.getPageNo()+1;
        }
        queryParameter.setPageNo(RePageNo);
        queryParameter.setPageSize(10);//每页放十条
        map.put("queryParameter",queryParameter);
        //存入map
        request.getSession().setAttribute("map",map);
        List<Purchase> purchaseList = purchaseService.purchaseListSelect(map);
        logger.debug(purchaseList);
        return purchaseList;
    }
}
