package com.service.system;

import com.github.pagehelper.PageInfo;
import com.model.SysLog;

public interface SysLogService {
    boolean addLog(SysLog sysLog);
    PageInfo getPage(Integer page);
    int getCount();
    void del(int id);
}
