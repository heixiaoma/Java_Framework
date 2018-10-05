package com.service.system.imp;

import com.dao.system.SysRoleMapper;
import com.dao.system.SysUserManageMapper;
import com.dao.system.SysUserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.SysRole;
import com.model.SysUser;
import com.service.system.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

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
    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 查询所有用户并做分页
     *
     * @param pages
     * @return
     */
    @Override
    public PageInfo getAllUsers(Integer pages) {
        if (pages == null || pages <= 0) {
            pages = 1;
        }
        PageHelper.startPage(pages, 10);
        List<SysUser> sysUsers = sysUserManageMapper.getAllUsers();
        PageInfo page = new PageInfo(sysUsers);
        return page;
    }

    /**
     * 获取所有的用户组，由于用户组往往不会很多所以就没有做分页了
     *
     * @return
     */
    @Override
    public List<SysRole> getAllSysRoles() {
        return sysRoleMapper.selectAll();
    }

    @Override
    public boolean delUser(String id) {
        Condition condition = new Condition(SysUser.class);
        condition.createCriteria().andCondition("id=" + id);
        int i = sysUserMapper.deleteByExample(condition);
        if (i > 0) {
            return true;
        }
        return false;
    }

    /**
     * 编辑用户
     *
     * @param sysUser
     * @return
     */
    @Override
    public boolean editUser(SysUser sysUser) {
        int i = sysUserManageMapper.updateSysUser(sysUser);
        if (i > 0) {
            return true;
        }
        return false;
    }

    /**
     * 添加用户
     * @param sysUser
     * @return
     */
    @Override
    public boolean saveUser(SysUser sysUser) {
        int i = sysUserManageMapper.saveSysUser(sysUser);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean editRole(SysRole sysRole) {
        int i = sysUserManageMapper.updateSysRole(sysRole);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean saveRole(SysRole sysRole) {
        int i = sysUserManageMapper.saveSysRole(sysRole);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean delRole(String id) {
        Condition condition = new Condition(SysRole.class);
        condition.createCriteria().andCondition("roleid=" + id);
        int i = sysRoleMapper.deleteByExample(condition);
        if (i > 0) {
            return true;
        }
        return false;
    }
}
