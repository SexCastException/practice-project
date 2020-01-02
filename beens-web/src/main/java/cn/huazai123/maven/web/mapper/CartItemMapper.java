package cn.huazai123.maven.web.mapper;

import java.util.List;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.CartItem;

public interface CartItemMapper extends IBaseMapper<CartItem> {

	int updateNumber(CartItem cartItem);

	/**
	 * 
	 * @param ids
	 * @return
	 */
	List<CartItem> goodsComfirm(List<String> ids);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	int batchDelete(List<String> ids);
}
