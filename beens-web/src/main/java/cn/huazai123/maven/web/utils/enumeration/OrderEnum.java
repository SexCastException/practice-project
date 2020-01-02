package cn.huazai123.maven.web.utils.enumeration;

public enum OrderEnum {

	UNFINISH(0, "未完成"), FINISH(1, "已完成");

	private int code;
	private String message;

	OrderEnum(int code, String message) {
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
