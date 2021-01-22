package com.timemaster.controller;

import com.timemaster.service.ResumeService;
import com.timemaster.vo.Result;
import com.timemaster.vo.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600) // 解决接口跨域问题
public class ResumeController {
    @Autowired
    ResumeService resumeService;

    @RequestMapping("/getAllResume")
    public Result getAllResume() {
        return Result.ok().put("data", resumeService.getAllResume());
    }

    @RequestMapping("/addResumeMapper")
    public Result addResumeMapper(@RequestBody Resume rsm) {
        return Result.ok().put("data", resumeService.addResumeMapper(rsm));
    }

    @RequestMapping("/findresumeByUserId/{id}")
    public Result findresumeByUserId(@PathVariable int id) {
        return Result.ok().put("data", resumeService.findresumeByUserId(id));
    }

    @RequestMapping("/modifyResume")
    public Result modifyResume(@RequestBody Resume rsm) {
        return Result.ok().put("data", resumeService.modifyResume(rsm));
    }

    @RequestMapping("/deleteResumeById/{id}")
    public Result deleteResumeById(@PathVariable int id) {
        return Result.ok().put("data", resumeService.deleteResumeById(id));
    }
}