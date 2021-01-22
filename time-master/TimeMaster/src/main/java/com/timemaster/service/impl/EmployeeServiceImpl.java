package com.timemaster.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.timemaster.dao.EmployeeMapper;
import com.timemaster.service.EmployeeService;
import com.timemaster.vo.EmployeeMessage;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, EmployeeMessage> implements EmployeeService {

}