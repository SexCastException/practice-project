package cn.huazai123.maven.web.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;

import cn.huazai123.maven.web.entity.Category;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.service.CategoryService;
import cn.huazai123.maven.web.service.FoodService;

@Controller
@RequestMapping(value = { "index", "" })
public class FoodController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FoodService foodService;

	@RequestMapping("")
	public String index(Food food, HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			// 分类列表
			List<Category> categoryList = categoryService.getCategoryName(new Category());
			// 食物列表
			List<Food> foodList = foodService.getFoodList(food);
			// 最新推荐
			List<Food> webRecommendList = foodService.webRecommend();

			request.getSession().setAttribute("index", 0);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("foodList", foodList);
			model.addAttribute("webRecommendList", webRecommendList);
			model.addAttribute("flag", true);
			model.addAttribute("page", paging(request, ((Page<Food>) foodList).getTotal()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}

	private String paging(HttpServletRequest request, Long total) {
		StringBuilder stringBuilder = new StringBuilder();
		Integer pageNum = 1;
		try {
			pageNum = Integer.valueOf(request.getParameter("pageNum"));
		} catch (NullPointerException | NumberFormatException e) {
		}

		stringBuilder.append("<li><a href='#' onclick='createPageForm(1)' class='previous'>首页</a></li>");
		if (!Objects.isNull(total)) {
			Long size = total % 8 == 0 ? total / 8 : total / 8 + 1;
			int i = 0;
			for (; i < size; i++) {
				if (size <= 10) {
					if (!Objects.isNull(pageNum) && pageNum.intValue() == (i + 1)) {
						stringBuilder.append("<li><a href='#' onclick='createPageForm(" + (i + 1)
								+ ")' class='current'>" + (i + 1) + "</a></li>");
					} else {
						stringBuilder.append("<li><a href='#' onclick='createPageForm(" + (i + 1) + ")' class=''>"
								+ (i + 1) + "</a></li>");
					}
				}

			}
			stringBuilder.append("<li><a href='#' onclick='createPageForm(" + size + ")' class='next'>尾页</a></li>");
		}
		return stringBuilder.toString();
	}

	@RequestMapping("foodDetail")
	public String foodDetail(Food food, HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			// 分类列表
			List<Category> categoryList = categoryService.getCategoryName(new Category());
			Food foodDetail = foodService.browseFood(food);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("food", foodDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "WEB-INF/page/food_detail";
	}

}
