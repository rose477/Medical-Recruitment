package com.timemaster.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.timemaster.vo.EmployerMessage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface EmployerMapper extends BaseMapper<EmployerMessage> {
}