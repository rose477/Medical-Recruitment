package com.timemaster.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.timemaster.dao.JobMapper;
import com.timemaster.service.JobService;
import com.timemaster.vo.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JobServiceimpl extends ServiceImpl<JobMapper, Position> implements JobService {
    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Position> getPosition() {
        return jobMapper.getPosition();
    }

    @Override
    public int deleteJob(int id) {
        return jobMapper.deleteJobById(id);
    }

    @Override
    public int modifyJob(Position posi) {
        return jobMapper.modifyJob(posi);
    }

    @Override
    public int addJob(Position posi) {
        return jobMapper.addJob(posi);
    }

    @Override
    public List<Position> getPositionBynameOrCompany(String nameOrcompany) {
        return jobMapper.getPositionBynameOrCompany(nameOrcompany);
    }

    @Override
    public List<Position> findAllPositionsByPage() {
        Page<Position> page = new Page<Position>(1, 1);
        QueryWrapper<Position> queryWrapper = new QueryWrapper<>();
        IPage<Position> iPage = this.getBaseMapper().selectPage(page, queryWrapper);
        return iPage.getRecords();
    }

    @Override
    public List<Position> returntuijian() {
        List<Integer> list = new ArrayList<>();
        list = jobMapper.getMaxType();
        int max = list.get(0);
        for (int i = 1; i < list.size(); i++) {
            if (list.get(i) > max) {
                max = list.get(i);
            }
        }
        System.out.println(max);
        return jobMapper.returnList(max);
    }

    @Override
    public int tianjiashoucang(String id) {
        return jobMapper.tianjiashoucang(id);
    }
}