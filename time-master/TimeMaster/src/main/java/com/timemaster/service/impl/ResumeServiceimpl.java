package com.timemaster.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.timemaster.dao.ResumeMapper;
import com.timemaster.service.ResumeService;
import com.timemaster.vo.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeServiceimpl extends ServiceImpl<ResumeMapper, Resume> implements ResumeService {
    @Autowired
    ResumeMapper resumeMapper;

    @Override
    public Resume getAllResume() {
        return resumeMapper.getAllResume();
    }

    @Override
    public int addResumeMapper(Resume rsm) {
        return resumeMapper.addResumeMapper(rsm);
    }

    @Override
    public Resume findresumeByUserId(int id) {
        return resumeMapper.findresumeByUserId(id);
    }

    @Override
    public int modifyResume(Resume rsm) {
        return resumeMapper.modifyResume(rsm);
    }

    @Override
    public int deleteResumeById(int id) {
        return resumeMapper.deleteResumeById(id);
    }
}