package cn.huazai123.maven.web.base;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.huazai123.maven.web.utils.IdGen;

public class BaseEntity<T> extends AbstractEntity<T> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String remarks; // 备注
	protected Date createDate; // 创建日期
	protected Date updateDate; // 修改日期
	protected String orderBy; // 排序
	protected Integer pageNum; // 分页数
	protected Integer pageSize; // 分页大小

	public BaseEntity() {
		init();
	}

	/**
	 * 初始化默认参数
	 */
	private void init() {
		pageNum = 1;
		pageSize = 8;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
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

	/**
	 * 插入之前操作
	 */
	@Override
	public void preInsert() {
		setId(IdGen.uuid());
		setCreateDate(new Date());
		setUpdateDate(new Date());
	}

	/**
	 * 更新之前操作
	 */
	@Override
	public void preUpdate() {
		setUpdateDate(new Date());
	}
}
