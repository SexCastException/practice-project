package cn.huazai123.maven.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.huazai123.maven.web.entity.Category;
import cn.huazai123.maven.web.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("")
	public String selectByCategory(Category category, Model model) {

		try {
			categoryService.get(category);
			System.out.println("testasfsdf");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
}
