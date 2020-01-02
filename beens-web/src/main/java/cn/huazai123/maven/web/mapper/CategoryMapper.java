package cn.huazai123.maven.web.mapper;

import java.util.List;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.Category;

public interface CategoryMapper extends IBaseMapper<Category> {

	/**
	 * 查询子分类列表并关联父分类
	 * 
	 * @param category
	 * @return
	 */
	List<Category> getChildList(Category category);

	/**
	 * 查询父分类列表并关联子分类
	 * 
	 * @param category
	 * @return
	 */
	List<Category> getParentList(Category category);
}
