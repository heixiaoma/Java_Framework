package com.dao.system;

import com.model.SysRole;
import com.model.SysUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysUserManageMapper {
    List<SysUser> getAllUsers();

    int updateSysUser(SysUser sysUser);

    int saveSysUser(SysUser sysUser);

    int updateSysRole(SysRole sysRole);

    int saveSysRole(SysRole sysRole);
}
