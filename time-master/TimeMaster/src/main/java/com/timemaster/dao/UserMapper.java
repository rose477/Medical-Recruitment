package com.timemaster.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.timemaster.vo.User;
import com.timemaster.vo.Position;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper extends BaseMapper<User> {
    public User userLogin(User user);

    public int upgradeEmployer(int id);

    public int upgradeAdmin(int id);

    public List<Position> findCollectionByid(int id);//该用户收藏的job
}