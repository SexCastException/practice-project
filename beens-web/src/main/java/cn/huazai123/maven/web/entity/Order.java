package cn.huazai123.maven.web.entity;

import java.util.Date;
import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

public class Order extends BaseEntity<Order> {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String tradeNo; // 订单编号(支付宝返回)
    private Date orderTime; // 下单时间
    private double totalAmount;
    private Integer state; // 订单状态
    private User user; // 用户
    private Address address; // 地址
    private short userDelFlag; // 用户订单删除标志
    private short storeDelFlag; // 店铺订单删除标志
    private short riderDelFlag; // 骑手订单删除标志

    private List<OrderItem> orderItemList;

    public Order() {

    }

    public Order(String id) {
        this.id = id;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public short getUserDelFlag() {
        return userDelFlag;
    }

    public void setUserDelFlag(short userDelFlag) {
        this.userDelFlag = userDelFlag;
    }

    public short getStoreDelFlag() {
        return storeDelFlag;
    }

    public void setStoreDelFlag(short storeDelFlag) {
        this.storeDelFlag = storeDelFlag;
    }

    public short getRiderDelFlag() {
        return riderDelFlag;
    }

    public void setRiderDelFlag(short riderDelFlag) {
        this.riderDelFlag = riderDelFlag;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

}
