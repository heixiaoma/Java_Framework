package com.dao.system;

import com.model.SysMenu;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
@Repository
public interface SysMenuMapper extends Mapper<SysMenu> {
    void addMenu1(SysMenu menu);
    void addMenu2(SysMenu menu);
    void del(String id);
}
