package com.lzx.entity;

import java.util.Date;

import lombok.Data;
/**
 * 会员实体类
 * @author 51019
 *
 */
@Data
public class Member {
	//会员id
    private Integer id;
    //会员手机号
    private String mobile;
    //会员密码
    private String pwd;
    //真实姓名
    private String real_name;
    //昵称
    private String nick_name;
    //邮件
    private String email;
    //性别
    private Boolean gender;
    //注册时间
    private Date register_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }
}