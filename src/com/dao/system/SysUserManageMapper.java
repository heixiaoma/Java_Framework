package com.dao.system;

import com.model.SysUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysUserManageMapper {
    List<SysUser> getAllUsers();
    SysUser login(SysUser sysUser);
}
