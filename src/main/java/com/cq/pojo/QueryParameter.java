package com.cq.pojo;

public class QueryParameter {
    //页码
    private int pageNo;
    //每页显示的条数
    private int pageSize;
    //数据库的偏移量
    private int offSet;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getOffSet() {
        return offSet;
    }

    public void setOffSet(int offSet) {
        this.offSet = offSet;
    }

    @Override
    public String toString() {
        return "QueryParameter{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", offSet=" + offSet +
                '}';
    }
}
