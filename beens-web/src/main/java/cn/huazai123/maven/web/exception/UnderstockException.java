package cn.huazai123.maven.web.exception;

/**
 * 库存不足抛出此异常
 * 
 * @author pyh
 *
 */
public class UnderstockException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UnderstockException() {
		super();
	}

	public UnderstockException(String message) {
		super(message);
	}
}
