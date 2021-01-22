package com.timemaster.controller;

import com.timemaster.service.JobService;
import com.timemaster.vo.Result;
import com.timemaster.vo.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600) // 解决接口跨域问题
public class JobController {
    @Autowired
    private JobService jobService;

    @RequestMapping("/getPositions")
    public Result getPositions() {
        return Result.ok().put("data", jobService.getPosition());
    }

    @RequestMapping("/deleteJob/{id}")
    public Result deleteJobByid(@PathVariable int id) {
        return Result.ok().put("data", jobService.deleteJob(id));
    }

    @RequestMapping("/modifyJob")
    public Result modifyJob(@RequestBody Position posi) {
        return Result.ok().put("data", jobService.modifyJob(posi));
    }

    @RequestMapping("/addJobs")
    public Result addJobs(@RequestBody Position posi) {
        return Result.ok().put("data", jobService.addJob(posi));
    }

    @RequestMapping(value = {"/getPositionBynameOrCompany/{nameOrCompany}", "/getPositionBynameOrCompany/"})
    public Result getPositionBynameOrCompany(@PathVariable(value = "nameOrCompany", required = false) String nameOrCompany) {
        if (nameOrCompany == null) {
            return Result.ok().put("data", jobService.getPosition());
        }
        return Result.ok().put("data", jobService.getPositionBynameOrCompany(nameOrCompany));
    }

    @RequestMapping("/findAllPositionsByPage")
    public Result findAllPositionsByPage() {
        return Result.ok().put("data", jobService.findAllPositionsByPage());
    }

    @RequestMapping("/returnShoucang")
    public Result returnShoucang() {
        return Result.ok().put("data", jobService.returntuijian());
    }

    @RequestMapping("/tianjiashoucang/{id}")
    public Result tianjiashoucang(@PathVariable String id) {
        return Result.ok().put("data", jobService.tianjiashoucang(id));
    }
}