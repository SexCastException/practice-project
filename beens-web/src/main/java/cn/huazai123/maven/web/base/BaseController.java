package cn.huazai123.maven.web.base;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseController<T extends IBaseService<E>, E extends BaseEntity<E>> {

	@Autowired
	protected T service;

}
