package com.service.system;


import com.github.pagehelper.PageInfo;
import com.model.SysRole;
import com.model.SysUser;

import java.util.List;

public interface UserManageService {
    PageInfo getAllUsers(Integer page);

    List<SysRole> getAllSysRoles();

    boolean delUser(String id);

    boolean editUser(SysUser sysUser);

    boolean saveUser(SysUser sysUser);

    boolean editRole(SysRole sysRole);

    boolean saveRole(SysRole sysRole);

    boolean delRole(String id);
}
