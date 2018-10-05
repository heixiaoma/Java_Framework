package com.service.system.imp;

import com.dao.system.SysRoleMapper;
import com.dao.system.SysUserManageMapper;
import com.dao.system.SysUserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.SysLog;
import com.model.SysRole;
import com.model.SysUser;
import com.service.system.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;

/**
 * 用户管理
 */
@Service
public class UserManageServiceImp implements UserManageService {

    @Autowired
    private SysUserManageMapper sysUserManageMapper;
    @Autowired
    private SysRoleMapper sysRoleMapper;

    /**
     * 查询所有用户并做分页
     * @param pages
     * @return
     */
    @Override
    public PageInfo getAllUsers(Integer pages) {
        if(pages==null||pages<=0){
            pages=1;
        }
        PageHelper.startPage(pages, 10);
        List<SysUser> sysUsers = sysUserManageMapper.getAllUsers();
        PageInfo page = new PageInfo(sysUsers);
        return page;
    }

    /**
     * 获取所有的用户组，由于用户组往往不会很多所以就没有做分页了
     * @return
     */
    @Override
    public List<SysRole> getAllSysRoles() {
        return sysRoleMapper.selectAll();
    }
}
