package cn.huazai123.maven.web.base;

import java.io.Serializable;

public abstract class AbstractEntity<T> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String id;

	public AbstractEntity() {

	}

	public AbstractEntity(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 插入前操作
	 */
	public abstract void preInsert();

	/**
	 * 更新前操作
	 */
	public abstract void preUpdate();

}
