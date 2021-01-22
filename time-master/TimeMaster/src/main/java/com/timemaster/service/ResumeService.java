package com.timemaster.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.timemaster.vo.Resume;
import org.springframework.stereotype.Service;

@Service
public interface ResumeService extends IService<Resume> {
    public Resume getAllResume();

    public int addResumeMapper(Resume rsm);

    public Resume findresumeByUserId(int id);

    public int modifyResume(Resume rsm);

    public int deleteResumeById(int id);
}