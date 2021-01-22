package com.timemaster.vo;

import lombok.Data;

import com.baomidou.mybatisplus.annotation.TableName;

import java.util.List;

@Data
@TableName(value = "positions")
public class Position {
    public int id;
    public String job;
    public String company;
    public String salary;
    public String Jobtype;
    public String experience;
    public String worktime;
    public String address;
    public String describes;
    public List<Jobdescribe> jobdescribes;
}