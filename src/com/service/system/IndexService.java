package com.service.system;

import com.model.SysUser;

public interface IndexService {
    SysUser login(SysUser user);

    String getMenu();
}
