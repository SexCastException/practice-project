package cn.huazai123.maven.web.exception;

import org.springframework.dao.DuplicateKeyException;

/**
 * 注册存在相同用户则抛出此异常
 * 
 * @author pyh
 *
 */
public class UserDuplicateException extends DuplicateKeyException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserDuplicateException(String message) {
		super(message);
	}

}
