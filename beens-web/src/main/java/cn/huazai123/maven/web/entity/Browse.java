package cn.huazai123.maven.web.entity;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 商品浏览量实体类
 * 
 * @author pyh
 *
 */
public class Browse extends BaseEntity<Browse> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String foodId;
	private String userId;

	public Browse() {
	}

	public Browse(String foodId, String userId) {
		super();
		this.foodId = foodId;
		this.userId = userId;
	}

	public String getFoodId() {
		return foodId;
	}

	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
