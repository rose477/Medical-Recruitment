package com.timemaster.controller;

import com.timemaster.service.EmployeeService;
import com.timemaster.vo.EmployeeMessage;
import com.timemaster.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600) // 解决接口跨域问题
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/findallemployee")
    public Result findAllUser() {
        return Result.ok().put("data", employeeService.list());
    }

    @RequestMapping("/addemployee")
    public Result addUser(@RequestBody EmployeeMessage employeeMessage) {
        if (employeeService.save(employeeMessage)) {
            return Result.ok("添加成功!");
        }
        return Result.error("添加失败!");
    }

    @RequestMapping("/deleteemployeebyid/{id}")
    public Result deleteUserByid(@PathVariable int id) {
        if (employeeService.removeById(id)) {
            return Result.ok("删除成功!");
        }
        return Result.error("删除失败!");
    }

    @RequestMapping("/updateemployee")
    public Result updateUser(@RequestBody EmployeeMessage employeeMessage) {
        if (employeeService.saveOrUpdate(employeeMessage)) {
            return Result.ok("更新成功!");
        }
        return Result.error("更新失败!");
    }

    @RequestMapping("/findemployeebyid/{id}")
    public Result findUserByid(@PathVariable int id) {
        return Result.ok().put("data", employeeService.getById(id));
    }
}