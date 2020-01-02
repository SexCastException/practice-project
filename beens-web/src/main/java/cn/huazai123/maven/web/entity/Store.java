package cn.huazai123.maven.web.entity;

import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 店铺实体类
 * 
 * @author pyh
 *
 */
public class Store extends BaseEntity<Store> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name; // 店铺名称
	private String introduce; // 店铺介绍
	private String logoUrl; // 店铺logo
	private String province; // 省
	private String city; // 市
	private String county; // 县
	private String town; // 镇
	private String detailedAddress; // 详细地址
	private String longitude; // 经度
	private String latitude; // 纬度

	private List<Food> foodList;

	public Store() {
	}

	public Store(String id) {
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

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public List<Food> getFoodList() {
		return foodList;
	}

	public void setFoodList(List<Food> foodList) {
		this.foodList = foodList;
	}

}
