package cn.huazai123.maven.web.entity;

import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

/**
 * 分类实体
 * 
 * @author pyh
 *
 */
public class Category extends BaseEntity<Category> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name; // 分类名称
	private Category parentCategory; // 父分类
	private List<Category> categoryList; // 子分类

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(Category parentCategory) {
		this.parentCategory = parentCategory;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

}
