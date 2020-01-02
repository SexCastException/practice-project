package cn.huazai123.maven.web.api;

import java.io.File;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.huazai123.maven.web.entity.Images;
import cn.huazai123.maven.web.service.ImagesService;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;

import cn.huazai123.maven.web.entity.Category;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.service.CategoryService;
import cn.huazai123.maven.web.service.FoodService;
import cn.huazai123.maven.web.utils.LayuiPageUtils;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.LayuiJsonResult;
import org.springframework.web.multipart.MultipartFile;

/**
 * 商品接口
 *
 * @author pyh
 */
@Controller
@RequestMapping(value = {"api/food"})
public class ApiFoodController {
    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ImagesService imagesService;

    @ModelAttribute
    public Food get(String id, Model model) throws Exception {
        Food food;
        if (StringUtil.isNotBlank(id)) {
            food = foodService.get(new Food(id));
        } else {
            food = new Food();
        }
        return food;
    }

    @RequestMapping("getFoodList")
    @ResponseBody
    public LayuiJsonResult<List<Food>> getFoodList(Food food, HttpServletRequest request) {
        try {
            // 食物列表
            List<Food> foodList = foodService.getFoodAssociationList(food);
            LayuiJsonResult<List<Food>> layuiJsonResult = LayuiJsonResult
                    .getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage(), foodList);
            LayuiPageUtils.parsePage(layuiJsonResult, (Page<Food>) foodList);
            return layuiJsonResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("getFoodForm")
    public String getFoodForm(Food food, HttpServletRequest request, Model model) {
        try {
            List<Category> categoryList = categoryService.getParentList(new Category());
            model.addAttribute("categoryList", categoryList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "static/admin/page/goodForm";
    }

    @RequestMapping("saveFood")
    @ResponseBody
    public LayuiJsonResult<Object> saveFood(Food food, HttpServletRequest request, HttpServletResponse response) {
        try {
            foodService.save(food);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("deleteFood")
    @ResponseBody
    public LayuiJsonResult<Object> deleteFood(Food food, HttpServletRequest request, HttpServletResponse response) {
        try {
            foodService.delete(food);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("uploadImages")
    @ResponseBody
    public BaseJsonResult<Object> uploadImages(Food food, MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Images> imagesList = food.getImagesList();
            if (!Objects.isNull(imagesList) && imagesList.size() >= 3) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "最多只能上传3张图片");
            }
            String fileName = "\\goods\\" + UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
            File outFile = new File("G:\\images", fileName);
            if (!outFile.exists()) {
                outFile.mkdirs();
            }
            multipartFile.transferTo(outFile);
            Images images = new Images();
            images.setUrl(fileName);
            images.setName(multipartFile.getOriginalFilename());
            images.setFood(food);
            imagesService.save(images);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "上传成功", fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "上传失败");
    }

    @RequestMapping("deleteImages")
    @ResponseBody
    public BaseJsonResult<Object> deleteImages(Images images, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (imagesService.deleteByUrl(images)) {
                return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "删除失败");
    }

}
