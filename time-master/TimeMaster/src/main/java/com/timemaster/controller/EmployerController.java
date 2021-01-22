package com.timemaster.controller;

import com.timemaster.service.EmployerService;
import com.timemaster.vo.EmployerMessage;
import com.timemaster.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600) // 解决接口跨域问题
public class EmployerController {
    @Autowired
    private EmployerService employerService;

    @RequestMapping("/findallemployer")
    public Result findAllUser() {
        return Result.ok().put("data", employerService.list());
    }

    @RequestMapping("/addemployer")
    public Result addUser(@RequestBody EmployerMessage employerMessage) {
        if (employerService.save(employerMessage)) {
            return Result.ok("添加成功!");
        }
        return Result.error("添加失败!");
    }

    @RequestMapping("/deleteemployerbyid/{id}")
    public Result deleteUserByid(@PathVariable int id) {
        if (employerService.removeById(id)) {
            return Result.ok("删除成功!");
        }
        return Result.error("删除失败!");
    }

    @RequestMapping("/updateemployer")
    public Result updateUser(@RequestBody EmployerMessage employerMessage) {
        if (employerService.saveOrUpdate(employerMessage)) {
            return Result.ok("更新成功!");
        }
        return Result.error("更新失败!");
    }

    @RequestMapping("/findemployerbyid/{id}")
    public Result findUserByid(@PathVariable int id) {
        return Result.ok().put("data", employerService.getById(id));
    }
}