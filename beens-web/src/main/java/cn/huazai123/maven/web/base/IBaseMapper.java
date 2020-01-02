package cn.huazai123.maven.web.base;

import java.util.List;

public interface IBaseMapper<T> {

	/**
	 * 封装查询条件到entity查询数据
	 * 
	 * @param entity
	 * @return
	 */
	public T get(T entity) throws Exception;

	/**
	 * 封装查询条件到entity查询数据集合
	 * 
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) throws Exception;

	/**
	 * 插入操作
	 * 
	 * @param entity
	 * @return
	 */
	public void insert(T entity) throws Exception;

	/**
	 * 更新操作
	 * 
	 * @param entity
	 * @return
	 */
	public void update(T entity) throws Exception;

	/**
	 * 删除操作
	 * 
	 * @param entity
	 * @return
	 */
	public void delete(T entity) throws Exception;

}
