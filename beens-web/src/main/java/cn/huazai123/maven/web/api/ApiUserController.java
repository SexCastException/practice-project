package cn.huazai123.maven.web.api;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.huazai123.maven.web.utils.MD5Util;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;

import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.service.UserService;
import cn.huazai123.maven.web.utils.LayuiPageUtils;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.LayuiJsonResult;

/**
 * 用户接口
 *
 * @author pyh
 */
@Controller
@RequestMapping(value = {"api/user"})
public class ApiUserController {
    @Autowired
    private UserService userService;

    @ModelAttribute
    public User get(String id, Model model) throws Exception {
        User user;
        if (StringUtil.isNotBlank(id)) {
            user = userService.get(new User(id));
        } else {
            user = new User();
        }
        return user;
    }

    @RequestMapping("getUserList")
    @ResponseBody
    public LayuiJsonResult<List<User>> getUserList(User user, HttpServletRequest request) {
        try {
            List<User> userList = userService.getUserList(user);
            LayuiJsonResult<List<User>> layuiJsonResult = LayuiJsonResult
                    .getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage(), userList);
            LayuiPageUtils.parsePage(layuiJsonResult, (Page<User>) userList);
            return layuiJsonResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public LayuiJsonResult<Object> deleteUser(User user, HttpServletRequest request) {
        try {
            userService.delete(user);
            return LayuiJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(),
                    CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("getUserForm")
    public String getUserForm(User user, HttpServletRequest request, HttpServletResponse response) {
        return "static/admin/page/userForm";
    }

    @RequestMapping("login")
    @ResponseBody
    public BaseJsonResult<Object> login(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (Objects.isNull(user.getUsername()) || "".equals(user.getUsername())) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "用户名不能为空");
            }
            if (Objects.isNull(user.getPassword()) || "".equals(user.getPassword())) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "密码不能为空");
            }
            user.setPassword(MD5Util.getCiphertext(user.getPassword(), user.getUsername()));
            User u = userService.findList(user).get(0);
            if (!Objects.isNull(u)) {
                if (!user.getUsername().equals("admin")) {
                    return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "请使用管理员身份登录");
                }
                request.getSession().setAttribute("admin", u);
                return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "用户名或密码错误");
    }

    @RequestMapping("logout")
    @ResponseBody
    public BaseJsonResult<Object> logout(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getSession(false).removeAttribute("admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage());
    }
}
