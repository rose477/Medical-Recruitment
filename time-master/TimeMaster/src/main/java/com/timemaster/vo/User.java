package com.timemaster.vo;

import lombok.Data;

@Data
public class User {
    private int id;
    private String username;
    private String password;
    private int status; //0->管理员    1->应聘者  2->招聘者
}