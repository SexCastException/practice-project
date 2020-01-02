package cn.huazai123.maven.web.utils.json;

/**
 * json实体类
 * 
 * @author pyh
 *
 * @param <T>
 */
public class LayuiJsonResult<T> {

	private int code; // json状态码
	private String msg; // json描述文本
	private long count; // 返回总记录数
	private Integer pageNum;
	private Integer pageSize;
	private T data;

	private LayuiJsonResult(int code, String msg) {
		this(code, msg, null);
	}

	private LayuiJsonResult(int code, String msg, T data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public static <T> LayuiJsonResult<T> getInstance(int code, String msg) {
		return new LayuiJsonResult<T>(code, msg);

	}

	public static <T> LayuiJsonResult<T> getInstance(int code, String msg, T data) {
		return new LayuiJsonResult<T>(code, msg, data);

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
