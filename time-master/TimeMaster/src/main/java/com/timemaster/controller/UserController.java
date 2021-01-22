package com.timemaster.controller;

import com.timemaster.service.UserService;
import com.timemaster.vo.Result;
import com.timemaster.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600) // 解决接口跨域问题
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/userlogin")
    public Result userLogin(@RequestBody User user) {
        User result = userService.userLogin(user);
        if (result != null) {
            return Result.ok().put("data", userService.userLogin(user));
        }
        return Result.error("账号或密码错误!");
    }

    @RequestMapping("/findalluser")
    public Result findAllUser() {
        return Result.ok().put("data", userService.list());
    }

    @RequestMapping("/adduser")
    public Result addUser(@RequestBody User user) {
        if (userService.save(user)) {
            return Result.ok("添加成功!");
        }
        return Result.error("添加失败!");
    }

    @RequestMapping("/deleteuserbyid/{id}")
    public Result deleteUserByid(@PathVariable int id) {
        if (userService.removeById(id)) {
            return Result.ok("删除成功!");
        }
        return Result.error("删除失败!");
    }

    @RequestMapping("/updateuser")
    public Result updateUser(@RequestBody User user) {
        if (userService.saveOrUpdate(user)) {
            return Result.ok("更新成功!");
        }
        return Result.error("更新失败!");
    }

    @RequestMapping("/finduserbyid/{id}")
    public Result findUserByid(@PathVariable int id) {
        return Result.ok().put("data", userService.getById(id));
    }

    @RequestMapping("/upgradeemployer/{id}")
    public Result upgradeEmployer(@PathVariable int id) {
        int result = userService.upgradeEmployer(id);
        if (result > 0) {
            return Result.ok("认证成功!");
        }
        return Result.ok("认证失败!");
    }

    @RequestMapping("/upgradeadmin/{id}")
    public Result upgradeAdmin(@PathVariable int id) {
        int result = userService.upgradeAdmin(id);
        if (result > 0) {
            return Result.ok("认证成功!");
        }
        return Result.ok("认证失败!");
    }

    @RequestMapping("/findCollectionByid/{id}")
    public Result findCollectionByid(@PathVariable int id) {
        return Result.ok().put("data", userService.findCollectionByid(id));
    }
}