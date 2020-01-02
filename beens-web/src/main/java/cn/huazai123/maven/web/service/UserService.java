package cn.huazai123.maven.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.exception.UserDuplicateException;
import cn.huazai123.maven.web.mapper.UserMapper;
import cn.huazai123.maven.web.utils.MD5Util;

@Service
@Transactional(readOnly = true)
public class UserService extends AbstractService<UserMapper, User> {

	public User login(User user) throws Exception {
		return super.get(user);
	}

	@Transactional(readOnly = false)
	public void register(User user) throws Exception {
		try {
			user.setPassword(MD5Util.getCiphertext(user.getPassword(), user.getUsername()));
			super.save(user);
		} catch (DuplicateKeyException e) {
			throw new UserDuplicateException("账号已被注册！");
		}
	}

	@Transactional(readOnly = false)
	public void updateUserInfo(User user) {
		dao.updateUserInfo(user);
	}

	public List<User> getUserList(User user) throws Exception {
		try {
			PageHelper.startPage(user.getPageNum(), user.getPageSize());
		} catch (NullPointerException e) {
			user.setPageNum(1);
			user.setPageSize(8);
			PageHelper.startPage(1, 8);
		}
		return dao.getUserList(user);
	}

	@Transactional(readOnly = false)
	public boolean changPassword(Map<String, String> map) throws Exception {
		int rows = dao.updatePassword(map);
		if (rows > 0) {
			return true;
		}
		return false;
	}
}
