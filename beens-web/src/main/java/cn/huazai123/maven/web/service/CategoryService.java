package cn.huazai123.maven.web.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Category;
import cn.huazai123.maven.web.mapper.CategoryMapper;

@Service
@Transactional(readOnly = true)
public class CategoryService extends AbstractService<CategoryMapper, Category> {

	public List<Category> getCategoryName(Category category) throws Exception {
		return super.findList(category);
	}

	public List<Category> getChildList(Category category) throws Exception {
		return dao.getChildList(category);
	}

	public List<Category> getParentList(Category category) throws Exception {
		return dao.getParentList(category);
	}

}
