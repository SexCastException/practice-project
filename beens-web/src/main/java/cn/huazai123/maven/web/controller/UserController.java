package cn.huazai123.maven.web.controller;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.huazai123.maven.web.base.BaseController;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.exception.UserDuplicateException;
import cn.huazai123.maven.web.service.UserService;
import cn.huazai123.maven.web.utils.MD5Util;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;

@Controller
@RequestMapping("user")
public class UserController extends BaseController<UserService, User> {

    @ModelAttribute
    public User get(String id, Model model) throws Exception {
        User user;
        if (StringUtil.isNotBlank(id)) {
            user = service.get(new User(id));
        } else {
            user = new User();
        }
        return user;
    }

    @RequestMapping(value = {"login"}, method = RequestMethod.POST)
    public String login(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        if (StringUtil.isNotBlank(exceptionClassName)) {
            if (UnknownAccountException.class.getName().equals(exceptionClassName)
                    || IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
                model.addAttribute("loginError", "用户名或者密码错误！");
            }
        } else {
            return "redirect:/index.jsp";
        }
        return "login";
    }

    @RequestMapping(value = {"login"}, method = RequestMethod.GET)
    public String login(HttpServletRequest request) throws Exception {
        return "login";
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.POST)
    public String register(User user, HttpServletRequest request, HttpServletResponse response, Model model,
                           String repassword) {
        try {
            if (StringUtil.isNotBlank(user.getPassword()) && StringUtil.isNotBlank(repassword)) {
                if (Arrays.equals(user.getPassword().getBytes(), repassword.getBytes())) {
                    service.register(user);
                    model.addAttribute("success", "注册成功");
                } else {
                    model.addAttribute("registerErrorMsg", "确认密码和密码不一致！");
                }
            }
        } catch (UserDuplicateException e) {
            e.printStackTrace();
            model.addAttribute("registerErrorMsg", "该账号已被注册！");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "register";
    }

    @RequestMapping("mine")
    public String mine(HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            request.getSession().setAttribute("index", 4);
            model.addAttribute("user", service.get(user));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WEB-INF/page/mine";
    }

    @RequestMapping("updateUserInfo")
    @ResponseBody
    public BaseJsonResult<User> updateUserInfo(@RequestBody User user, Model model) {
        try {
            user.preUpdate();
            service.updateUserInfo(user);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "修改失败");
    }

    @RequestMapping("uploadImg")
    @ResponseBody
    public BaseJsonResult<Object> uploadImg(MultipartFile multipartFile, Model model) {
        try {
            String fileName = "\\user\\"+UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
            File outFile = new File("G:\\images", fileName);
            if (!outFile.exists()) {
                outFile.mkdirs();
            }
            multipartFile.transferTo(outFile);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "修改成功",fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "修改失败");
    }

    @RequestMapping("changePassword")
    @ResponseBody
    public BaseJsonResult<Object> changePassword(String oldPassword, String newPassword, String rePassword) {
        try {
            // 验证新密码和确认密码
            if (!Arrays.equals(newPassword.getBytes(), rePassword.getBytes())) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "确认密码和新密码不一致");
            }
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            if (Objects.isNull(user)) {
                return BaseJsonResult.getInstance(CommonResultEnum.EXCEPTION.getCode(), "用户未登陆");
            }
            // 验证旧密码
            if (!Arrays.equals(user.getPassword().getBytes(),
                    MD5Util.getCiphertext(oldPassword, user.getUsername()).getBytes())) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "旧密码错误");
            }
            Map<String, String> map = new HashMap<String, String>();
            map.put("userId", user.getId());
            map.put("oldPassword", MD5Util.getCiphertext(oldPassword, user.getUsername()));
            map.put("newPassword", MD5Util.getCiphertext(newPassword, user.getUsername()));
            if (service.changPassword(map)) {
                return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "修改成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "修改失败");
    }

}
