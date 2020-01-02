package cn.huazai123.maven.web.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Address;
import cn.huazai123.maven.web.mapper.AddressMapper;

@Service
@Transactional(readOnly = true)
public class AddressService extends AbstractService<AddressMapper, Address> {

}
