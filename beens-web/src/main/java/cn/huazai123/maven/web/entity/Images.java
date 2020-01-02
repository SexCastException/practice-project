package cn.huazai123.maven.web.entity;

import cn.huazai123.maven.web.base.BaseEntity;

public class Images extends BaseEntity<Images> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String url; // 图片url
	private String name; // 图片名称
	private Food food; // 食物关联实体类

	public Images() {
	}

	public Images(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

}
