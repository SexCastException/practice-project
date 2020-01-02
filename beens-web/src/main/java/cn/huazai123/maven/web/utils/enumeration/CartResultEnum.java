package cn.huazai123.maven.web.utils.enumeration;

public enum CartResultEnum {

	SUCCESS(200, "加入购物车成功"), DEFEATE(201, "加入购物车失败"), UNDERSTOCK(202, "库存不足"), EXCEPTION(500, "未知错误");

	private int code;
	private String message;

	CartResultEnum(int code, String message) {
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
