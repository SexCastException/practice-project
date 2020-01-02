package cn.huazai123.maven.web.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.huazai123.maven.web.entity.Address;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.service.AddressService;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CartResultEnum;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;

@Controller
@RequestMapping("address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	@ModelAttribute
	public Address get(String id, Model model) throws Exception {
		Address address;
		if (StringUtil.isNotBlank(id)) {
			address = addressService.get(new Address(id));
		} else {
			address = new Address();
		}
		return address;
	}

	@RequestMapping("")
	public String list(Address address, Model model) {
		try {
			List<Address> addressList = addressService.findList(address);
			model.addAttribute("addressList", addressList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping("save")
	@ResponseBody
	public BaseJsonResult<?> save(Address address, Model model) {
		try {
			address.setUser(new User(((User) SecurityUtils.getSubject().getPrincipal()).getId()));
			addressService.save(address);
		} catch (Exception e) {
			e.printStackTrace();
			return BaseJsonResult.getInstance(CartResultEnum.EXCEPTION.getCode(),
					CartResultEnum.EXCEPTION.getMessage());
		}
		return BaseJsonResult.getInstance(200, "保存成功!");
	}
}
