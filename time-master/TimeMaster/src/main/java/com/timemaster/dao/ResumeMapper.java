package com.timemaster.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.timemaster.vo.Resume;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ResumeMapper extends BaseMapper<Resume> {
    public Resume getAllResume();

    public int addResumeMapper(Resume rsm);

    public Resume findresumeByUserId(int id);

    public int modifyResume(Resume rsm);

    public int deleteResumeById(int id);
}