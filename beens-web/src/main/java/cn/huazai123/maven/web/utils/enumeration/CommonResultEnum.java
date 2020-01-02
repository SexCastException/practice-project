package cn.huazai123.maven.web.utils.enumeration;

public enum CommonResultEnum {

	SUCCESS(0, "成功"), DEFEATE(1, "失败"), EXCEPTION(2, "异常");

	private int code;
	private String message;

	private CommonResultEnum(int code, String message) {
		this.code = code;
		this.message = message;
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

}
