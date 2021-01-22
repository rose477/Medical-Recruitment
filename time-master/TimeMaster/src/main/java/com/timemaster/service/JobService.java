package com.timemaster.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.timemaster.vo.Position;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface JobService extends IService<Position> {
    public List<Position> getPosition();

    public int deleteJob(int id);

    public int modifyJob(Position posi);

    public int addJob(Position posi);

    public List<Position> getPositionBynameOrCompany(String nameOrcompany);

    public List<Position> findAllPositionsByPage();

    public List<Position> returntuijian();

    public int tianjiashoucang(String id);
}