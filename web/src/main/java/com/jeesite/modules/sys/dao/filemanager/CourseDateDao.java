/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.dao.filemanager;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.sys.entity.filemanager.CourseDate;

import java.util.List;

/**
 * 课程资料表DAO接口
 * @author wyn
 * @version 2020-01-16
 */
@MyBatisDao
public interface CourseDateDao extends CrudDao<CourseDate> {

}