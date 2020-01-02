package cn.huazai123.maven.web.entity;

import java.util.Date;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 优惠券实体类
 * 
 * @author pyh
 *
 */
public class Discount extends BaseEntity<Discount> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name; // 优惠券名称
	private Double minimumPrice; // 满减价格
	private Double discountPrice; // 优惠价格
	private Date validDate; // 有效期

	private User user;
	private Store store;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMinimumPrice() {
		return minimumPrice;
	}

	public void setMinimumPrice(Double minimumPrice) {
		this.minimumPrice = minimumPrice;
	}

	public Double getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

}
