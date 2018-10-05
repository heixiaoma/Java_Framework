package com.service.system.imp;

import com.dao.system.SysLogMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.SysLog;
import com.service.system.SysLogService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Condition;

import java.util.List;

/**
 * 日志操作Service
 */
@Service
public class SysLogServiceImp implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    /**
     * 日志添加
     * @param sysLog
     * @return
     */
    @Override
    public boolean addLog(SysLog sysLog) {

        int insert = sysLogMapper.insert(sysLog);
        if(insert!=0){
            return true;
        }else {
            return false;
        }

    }

    @Test
    @Override
    public PageInfo getPage(Integer pages) {
        if(pages==null||pages<=0){
            pages=1;
        }
        PageHelper.startPage(pages, 10);
        Condition condition=new Condition(SysLog.class);
        condition.setOrderByClause("id desc");
        List<SysLog> sysLogs = sysLogMapper.selectByExample(condition);
        PageInfo page = new PageInfo(sysLogs);
        return page;
    }

    @Override
    public int getCount() {
        return sysLogMapper.selectAll().size();
    }

    @Override
    public void del(int id) {
        Condition condition=new Condition(SysLog.class);
        condition.createCriteria().andCondition("id="+id);
        sysLogMapper.deleteByExample(condition);

    }
}
