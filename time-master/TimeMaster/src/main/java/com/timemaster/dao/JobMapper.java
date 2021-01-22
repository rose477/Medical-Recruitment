package com.timemaster.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.timemaster.vo.Position;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface JobMapper extends BaseMapper<Position> {
    public List<Position> getPosition();

    public int deleteJobById(int id);

    public int modifyJob(Position posi);

    public int addJob(Position posi);

    public List<Position> getPositionBynameOrCompany(String nameOrcompany);

    public List<Integer> getMaxType();

    public List<Position> returnList(int id);

    public int tianjiashoucang(String id);
}