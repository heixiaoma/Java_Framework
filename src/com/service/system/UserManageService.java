package com.service.system;


import com.github.pagehelper.PageInfo;
import com.model.SysRole;

import java.util.List;

public interface UserManageService {
    PageInfo getAllUsers(Integer page);

    List<SysRole> getAllSysRoles();
}
