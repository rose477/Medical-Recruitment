package com.timemaster.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.timemaster.vo.User;
import com.timemaster.vo.Position;

import java.util.List;

public interface UserService extends IService<User> {
    public User userLogin(User user);

    public int upgradeEmployer(int id);

    public int upgradeAdmin(int id);

    public List<Position> findCollectionByid(int id);
}