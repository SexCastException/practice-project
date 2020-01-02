package cn.huazai123.maven.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Browse;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.entity.Images;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.mapper.BrowseMapper;
import cn.huazai123.maven.web.mapper.FoodMapper;
import cn.huazai123.maven.web.mapper.ImagesMapper;

@Service
@Transactional(readOnly = true)
public class FoodService extends AbstractService<FoodMapper, Food> {

    @Autowired
    private ImagesMapper imagesMapper;
    @Autowired
    private BrowseMapper browseMapper;

    /**
     * 获取食物列表
     *
     * @param food
     * @return
     * @throws Exception
     */
    public List<Food> getFoodList(Food food) throws Exception {
        try {
            PageHelper.startPage(food.getPageNum(), food.getPageSize());
        } catch (NullPointerException e) {
            food.setPageNum(1);
            food.setPageSize(8);
            PageHelper.startPage(1, 8);
        }

        PageHelper.orderBy(food.getOrderBy());
        List<Food> foodList = dao.findFoodListNoJoint(food);
        for (Food f : foodList) {
            Images images = new Images();
            images.setFood(f);
            List<Images> imagesList = imagesMapper.findList(images);
            f.setImagesList(imagesList);
        }
        return foodList;
    }

    public List<Food> getFoodAssociationList(Food food) throws Exception {
        try {
            PageHelper.startPage(food.getPageNum(), food.getPageSize());
        } catch (NullPointerException e) {
            food.setPageNum(1);
            food.setPageSize(8);
            PageHelper.startPage(1, 8);
        }

        PageHelper.orderBy(food.getOrderBy());
        List<Food> foodList = dao.getFoodAssociationList(food);

        return foodList;
    }

    /**
     * 最新推荐列表
     *
     * @return
     * @throws Exception
     */
    public List<Food> webRecommend() throws Exception {
        List<Food> foodList = dao.webRecommend();
        return foodList;
    }

    /**
     * 浏览商品
     *
     * @param food
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = false)
    public Food browseFood(Food food) throws Exception {
        // 如果用户登录了
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if (!Objects.isNull(user)) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("foodId", food.getId());
            map.put("userId", user.getId());
            dao.updateBrowserNum(map);

            // 添加阅读记录
            Browse browse = new Browse(food.getId(), user.getId());
            browse.preInsert();
            browseMapper.insert(browse);
        }
        return super.get(food);
    }

    @Transactional(readOnly = false)
    public void saveFoodAndImages(Food food) throws Exception {
        super.save(food);
        List<Images> imagesList = food.getImagesList();
        for (Images images : imagesList) {
            images.preInsert();
            images.setFood(food);
            images.setName(images.getUrl());
            imagesMapper.insert(images);
        }
    }
}
