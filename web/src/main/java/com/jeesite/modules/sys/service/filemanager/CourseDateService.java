/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.service.filemanager;

import com.jeesite.common.codec.EncodeUtils;
import com.jeesite.common.entity.Page;
import com.jeesite.common.lang.DateUtils;
import com.jeesite.common.service.CrudService;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.sys.dao.filemanager.CourseDateDao;
import com.jeesite.modules.sys.entity.filemanager.CourseDate;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 课程资料表Service
 * @author wyn
 * @version 2020-01-16
 */
@Service
@Transactional(readOnly=true)
public class CourseDateService extends CrudService<CourseDateDao, CourseDate> {

	/**
	 * 获取单条数据
	 * @param courseDate
	 * @return
	 */
	@Override
	public CourseDate get(CourseDate courseDate) {
		return super.get(courseDate);
	}

	/**
	 * 查询分页数据
	 * @param courseDate 查询条件
	 * @param courseDate.page 分页对象
	 * @return
	 */
	@Override
	public Page<CourseDate> findPage(CourseDate courseDate) {
		return super.findPage(courseDate);
	}

	/**
	 * 查询组织机构列表
	 */
	@Override
	public List<CourseDate> findList(CourseDate courseDate) {
		return super.findList(courseDate);
	}

	/**
	 * 保存数据（插入或更新）
	 * @param courseDate
	 */
	@Override
	@Transactional(readOnly=false)
	public void save(CourseDate courseDate) {
		super.save(courseDate);
		// 保存上传附件
		FileUploadUtils.saveFileUpload(courseDate.getId(), "courseDate_file");
	}

	/**
	 * 更新状态
	 * @param courseDate
	 */
	@Override
	@Transactional(readOnly=false)
	public void updateStatus(CourseDate courseDate) {
		super.updateStatus(courseDate);
	}

	/**
	 * 删除数据
	 * @param courseDate
	 */
	@Override
	@Transactional(readOnly=false)
	public void delete(CourseDate courseDate) {
		super.delete(courseDate);
	}

}