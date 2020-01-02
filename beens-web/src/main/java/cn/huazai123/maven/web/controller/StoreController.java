package cn.huazai123.maven.web.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;

import cn.huazai123.maven.web.entity.Category;
import cn.huazai123.maven.web.entity.Store;
import cn.huazai123.maven.web.service.CategoryService;
import cn.huazai123.maven.web.service.StoreService;

@Controller
@RequestMapping("store")
public class StoreController {

    @Autowired
    private StoreService storeService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private FoodService foodService;

    @RequestMapping("")
    public String store(Store store, HttpServletRequest request, Model model) {
        try {
            List<Category> categoryList = categoryService.getCategoryName(new Category());

            // 获取店铺列表
            List<Store> storeList = storeService.getStoreList(store);
            List<Store> storeCommentList = storeService.storeComment(store);
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("storeList", storeList);
            model.addAttribute("storeCommentList", storeCommentList);
            request.getSession().setAttribute("index", 1);
            model.addAttribute("page", paging(request, ((Page<Store>) storeList).getTotal()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "WEB-INF/page/store";
    }

    private String paging(HttpServletRequest request, Long total) {
        StringBuilder stringBuilder = new StringBuilder();
        Integer pageNum = 1;
        try {
            pageNum = Integer.valueOf(request.getParameter("pageNum"));
        } catch (NullPointerException | NumberFormatException e) {
        }

        stringBuilder.append("<li><a href='store' class='previous'>首页</a></li>");
        if (!Objects.isNull(total)) {
            Long size = total % 8 == 0 ? total / 8 : total / 8 + 1;
            int i = 0;
            for (; i < size; i++) {
                if (size <= 10) {
                    if (!Objects.isNull(pageNum) && pageNum.intValue() == (i + 1)) {
                        stringBuilder.append("<li><a href='store?pageNum=" + (i + 1) + "' class='current'>" + (i + 1) + "</a></li>");
                    } else {
                        stringBuilder.append("<li><a href='store?pageNum=" + (i + 1) + "'>" + (i + 1) + "</a></li>");
                    }
                }

            }
            stringBuilder.append("<li><a href='store?pageNum=" + (size) + "' class='next'>尾页</a></li>");
        }
        return stringBuilder.toString();
    }

    @RequestMapping("myStore")
    public String myStore(Store store, HttpServletRequest request, Model model) {
        try {
            Store storeDetail = storeService.get(store);
            Food food = new Food();
            food.setPageNum(store.getPageNum());
            food.setPageSize(store.getPageSize());
            food.setStore(store);
            List<Food> foodList = foodService.getFoodList(food);
            model.addAttribute("store", storeDetail);
            model.addAttribute("foodList", foodList);
            model.addAttribute("page", myStorePaging(request, ((Page<Food>) foodList).getTotal(), store.getId()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "WEB-INF/page/myStore";
    }

    private String myStorePaging(HttpServletRequest request, Long total, String id) {
        StringBuilder stringBuilder = new StringBuilder();
        Integer pageNum = 1;
        try {
            pageNum = Integer.valueOf(request.getParameter("pageNum"));
        } catch (NullPointerException | NumberFormatException e) {
        }

        stringBuilder.append("<li><a href='myStore?id=" + id + "' class='previous'>首页</a></li>");
        if (!Objects.isNull(total)) {
            Long size = total % 8 == 0 ? total / 8 : total / 8 + 1;
            int i = 0;
            for (; i < size; i++) {
                if (size <= 10) {
                    if (!Objects.isNull(pageNum) && pageNum.intValue() == (i + 1)) {
                        stringBuilder.append("<li><a href='myStore?id=" + id + "&pageNum=" + (i + 1) + "' class='current'>" + (i + 1) + "</a></li>");
                    } else {
                        stringBuilder.append("<li><a href='myStore?id=" + id + "&pageNum=" + (i + 1) + "'>" + (i + 1) + "</a></li>");
                    }
                }

            }
            stringBuilder.append("<li><a href='myStore?id=" + id + "&pageNum=" + (size) + "' class='next'>尾页</a></li>");
        }
        return stringBuilder.toString();
    }
}
