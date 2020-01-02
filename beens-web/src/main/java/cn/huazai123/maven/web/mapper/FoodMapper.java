package cn.huazai123.maven.web.mapper;

import java.util.List;
import java.util.Map;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.Food;

public interface FoodMapper extends IBaseMapper<Food> {

	/**
	 * 本站推荐列表
	 * 
	 * @return
	 */
	public List<Food> webRecommend();

	public List<Food> findFoodListNoJoint(Food food);

	int batchUpdateInfo(List<Food> foodList);

	/**
	 * 
	 * @return
	 */
	public List<Food> getFoodAssociationList(Food food);

	/**
	 * 更新浏览量
	 * @param map
	 * @return
	 */
	public int updateBrowserNum(Map<String, String> map);
}
