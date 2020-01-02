package cn.huazai123.maven.web.api;

import java.io.File;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.huazai123.maven.web.entity.Images;
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
import cn.huazai123.maven.web.entity.Store;
import cn.huazai123.maven.web.service.CategoryService;
import cn.huazai123.maven.web.service.FoodService;
import cn.huazai123.maven.web.service.StoreService;
import cn.huazai123.maven.web.utils.LayuiPageUtils;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.LayuiJsonResult;
import org.springframework.web.multipart.MultipartFile;

/**
 * 店铺接口
 *
 * @author pyh
 */
@Controller
@RequestMapping(value = {"api/store"})
public class ApiStoreController {
    @Autowired
    private StoreService storeService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;

    @ModelAttribute
    public Store get(String id, Model model) throws Exception {
        Store store;
        if (StringUtil.isNotBlank(id)) {
            store = storeService.get(new Store(id));
        } else {
            store = new Store();
        }
        return store;
    }

    @RequestMapping("getStoreList")
    @ResponseBody
    public LayuiJsonResult<List<Store>> getStoreList(Store store) throws Exception {
        try {
            List<Store> storeList = storeService.getStoreList(store);
            LayuiJsonResult<List<Store>> layuiJsonResult = LayuiJsonResult
                    .getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage(), storeList);
            LayuiPageUtils.parsePage(layuiJsonResult, (Page<Store>) storeList);
            return layuiJsonResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("getStoreForm")
    public String getStoreForm(Store store, HttpServletRequest request, HttpServletResponse response) {
        return "static/admin/page/storeForm";
    }

    @RequestMapping("saveStore")
    @ResponseBody
    public LayuiJsonResult<Object> saveStore(Store store, HttpServletRequest request, HttpServletResponse response) {
        try {
            storeService.save(store);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("addGoodsForm")
    public String addGoodsForm(Store store, Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Category> categoryList = categoryService.getParentList(new Category());
            model.addAttribute("categoryList", categoryList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "static/admin/page/addGoodsForm";
    }

    @RequestMapping("addGoods")
    @ResponseBody
    public LayuiJsonResult<Object> addGoods(Food food, HttpServletRequest request, HttpServletResponse response) {
        try {
            foodService.saveFoodAndImages(food);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());

    }

    @RequestMapping("deleteStore")
    @ResponseBody
    public LayuiJsonResult<Object> deleteStore(Store store, HttpServletRequest request, HttpServletResponse response) {
        try {
            storeService.delete(store);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("uploadImages")
    @ResponseBody
    public BaseJsonResult<Object> uploadImages(Store store, MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        try {
            String fileName = "\\store\\" + UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
            File outFile = new File("G:\\images", fileName);
            if (!outFile.exists()) {
                outFile.mkdirs();
            }
            multipartFile.transferTo(outFile);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "修改成功", fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "上传失败");
    }

    @RequestMapping("uploadFoodImages")
    @ResponseBody
    public BaseJsonResult<Object> uploadFoodImages(Store store, MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        try {
            String fileName = "\\goods\\" + UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
            File outFile = new File("G:\\images", fileName);
            if (!outFile.exists()) {
                outFile.mkdirs();
            }
            multipartFile.transferTo(outFile);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "修改成功", fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "上传失败");
    }

}
