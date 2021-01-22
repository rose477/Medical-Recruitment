package com.timemaster.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.timemaster.dao.EmployerMapper;
import com.timemaster.service.EmployerService;
import com.timemaster.vo.EmployerMessage;
import org.springframework.stereotype.Service;

@Service
public class EmployerServiceImpl extends ServiceImpl<EmployerMapper, EmployerMessage> implements EmployerService {

}