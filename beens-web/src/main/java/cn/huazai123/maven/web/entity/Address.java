package cn.huazai123.maven.web.entity;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 收货地址实体类
 *
 * @author pyh
 */
public class Address extends BaseEntity<Address> {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private Integer adcode; // 区号
    private String province; // 省
    private String city; // 市
    private Integer citycode;
    private String district; // 区、县
    private String street; // 路
    private String streetNumber; // 街牌号码
    private String township; // 镇
    private String detailedAddress; // 详细地址
    private String longitude; // 经度
    private String latitude; // 纬度
    private String phone;    //联系电话号码
    private User user; //

    public Address() {
    }

    public Address(String id) {
        this.id = id;
    }

    public Integer getAdcode() {
        return adcode;
    }

    public void setAdcode(Integer adcode) {
        this.adcode = adcode;
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

    public Integer getCitycode() {
        return citycode;
    }

    public void setCitycode(Integer citycode) {
        this.citycode = citycode;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getTownship() {
        return township;
    }

    public void setTownship(String township) {
        this.township = township;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
