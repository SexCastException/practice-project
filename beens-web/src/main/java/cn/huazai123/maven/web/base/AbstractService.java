package cn.huazai123.maven.web.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.huazai123.maven.web.utils.StringUtil;

public abstract class AbstractService<D extends IBaseMapper<E>, E extends BaseEntity<E>> implements IBaseService<E> {

	@Autowired
	protected D dao;

	@Override
	public E get(E entity) throws Exception {
		return dao.get(entity);
	}

	@Override
	public List<E> findList(E entity) throws Exception {
		return dao.findList(entity);
	}

	@Override
	public void insert(E entity) throws Exception {
		dao.insert(entity);
	}

	@Override
	public void update(E entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public void save(E entity) throws Exception {
		if (StringUtil.isNotBlank(entity.getId())) {
			entity.preUpdate();
			update(entity);
		} else {
			entity.preInsert();
			insert(entity);
		}
	}

	@Override
	public void delete(E entity) throws Exception {
		dao.delete(entity);
	}

}
