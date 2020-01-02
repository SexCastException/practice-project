package cn.huazai123.maven.web.utils.json;

/**
 * json实体类
 * 
 * @author pyh
 *
 * @param <T>
 */
public class BaseJsonResult<T> {

	private int code; // json状态码
	private String message; // json描述文本
	private T entity;

	private BaseJsonResult(int code, String message) {
		this(code, message, null);
	}

	private BaseJsonResult(int code, String message, T entity) {
		this.code = code;
		this.message = message;
		this.entity = entity;
	}

	public static <T> BaseJsonResult<T> getInstance(int code, String message) {
		return new BaseJsonResult<T>(code, message);

	}

	public static <T> BaseJsonResult<T> getInstance(int code, String message, T entity) {
		return new BaseJsonResult<T>(code, message, entity);

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}

}
