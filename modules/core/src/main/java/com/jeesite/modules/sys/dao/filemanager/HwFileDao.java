/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.dao.filemanager;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.sys.entity.filemanager.HwFile;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 华为证书表DAO接口
 * @author xuqx
 * @version 2020-02-02
 */
@MyBatisDao
public interface HwFileDao extends CrudDao<HwFile> {
    /**
     * 根据登录账号查询证书
     * */
    public List<HwFile> findHwFileByLoginCode(@RequestParam String loginCode);
	
}
