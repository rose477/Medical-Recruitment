package com.timemaster.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.timemaster.vo.EmployeeMessage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface EmployeeMapper extends BaseMapper<EmployeeMessage> {
}