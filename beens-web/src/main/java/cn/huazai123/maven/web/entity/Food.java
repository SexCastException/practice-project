package cn.huazai123.maven.web.entity;

import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

public class Food extends BaseEntity<Food> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name; // 食物名称
	private String introduce; // 食物介绍
	private Double originalPrice; // 原来价格
	private Double currentPrice; // 当前价格
	private int repertory; // 食物库存
	private int sellNum; // 销售数量
	private int browserNum; // 浏览数量

	private Category category; // 分类
	private Store store; // 商店
	private List<Images> imagesList; // 图片
	private List<CartItem> cartItemList;

	public Food() {
	}

	public Food(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Double getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(Double originalPrice) {
		this.originalPrice = originalPrice;
	}

	public Double getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(Double currentPrice) {
		this.currentPrice = currentPrice;
	}

	public int getRepertory() {
		return repertory;
	}

	public void setRepertory(int repertory) {
		this.repertory = repertory;
	}

	public int getSellNum() {
		return sellNum;
	}

	public void setSellNum(int sellNum) {
		this.sellNum = sellNum;
	}

	public int getBrowserNum() {
		return browserNum;
	}

	public void setBrowserNum(int browserNum) {
		this.browserNum = browserNum;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public List<Images> getImagesList() {
		return imagesList;
	}

	public void setImagesList(List<Images> imagesList) {
		this.imagesList = imagesList;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

}
