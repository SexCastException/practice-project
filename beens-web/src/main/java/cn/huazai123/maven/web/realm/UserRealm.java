package cn.huazai123.maven.web.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.service.UserService;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}

	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();

		User user = new User();
		user.setUsername(username);
		try {
			User u = userService.findList(user).get(0);
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(u, u.getPassword(),
					ByteSource.Util.bytes(u.getUsername()), getName());
			return info;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
