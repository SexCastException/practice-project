package cn.huazai123.maven.web.entity;

import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 用户实体类
 * 
 * @author pyh
 *
 */
public class User extends BaseEntity<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String username; // 用户名
	private String password; // 密码
	private String name; // 姓名
	private short sex; // 性别
	private String headImg; // 头像

	private List<Address> addressList;
	private List<Discount> discountsList;
	private ShoppingCart shoppingCart;

	public User() {
	}

	public User(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public short getSex() {
		return sex;
	}

	public void setSex(short sex) {
		this.sex = sex;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public List<Discount> getDiscountsList() {
		return discountsList;
	}

	public void setDiscountsList(List<Discount> discountsList) {
		this.discountsList = discountsList;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

}
