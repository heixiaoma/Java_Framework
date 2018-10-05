package com.dao.system;

import com.model.SysUser;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface SysUserMapper extends Mapper<SysUser> {
    SysUser login(SysUser sysUser);
}
