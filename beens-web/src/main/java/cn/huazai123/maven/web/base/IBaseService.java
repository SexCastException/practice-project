package cn.huazai123.maven.web.base;

import java.util.List;

public interface IBaseService<E extends BaseEntity<E>> {
	/**
	 * 封装查询条件到entity查询数据
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public E get(E entity) throws Exception;

	/**
	 * 封装查询条件到entity查询数据集合
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public List<E> findList(E entity) throws Exception;

	/**
	 * 插入操作
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public void insert(E entity) throws Exception;

	/**
	 * 更新操作
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public void update(E entity) throws Exception;

	/**
	 * 保存操作
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public void save(E entity) throws Exception;

	/**
	 * 删除操作
	 * 
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public void delete(E entity) throws Exception;

}
