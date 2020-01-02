package cn.huazai123.maven.web.mapper;

import java.util.List;
import java.util.Map;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.User;

public interface UserMapper extends IBaseMapper<User> {

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	int updateUserInfo(User user);

	List<User> getUserList(User user);

	int updatePassword(Map<String, String> map);
}
