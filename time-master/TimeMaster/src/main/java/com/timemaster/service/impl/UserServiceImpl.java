package com.timemaster.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.timemaster.dao.UserMapper;
import com.timemaster.service.UserService;
import com.timemaster.vo.User;
import com.timemaster.vo.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User userLogin(User user) {
        return userMapper.userLogin(user);
    }

    @Override
    public int upgradeEmployer(int id) {
        return userMapper.upgradeEmployer(id);
    }

    @Override
    public int upgradeAdmin(int id) {
        return userMapper.upgradeAdmin(id);
    }

    @Override
    public List<Position> findCollectionByid(int id) {
        return userMapper.findCollectionByid(id);
    }
}