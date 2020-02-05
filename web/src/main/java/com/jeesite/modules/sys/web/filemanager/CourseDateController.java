/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.web.filemanager;

import com.jeesite.common.codec.EncodeUtils;
import com.jeesite.common.collect.ListUtils;
import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.sys.entity.filemanager.CourseDate;
import com.jeesite.modules.sys.service.filemanager.CourseDateService;
import com.sun.media.jfxmedia.locator.Locator;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 课程资料表Controller
 * @author wyn
 * @version 2020-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/filemanager/courseDate")
public class CourseDateController extends BaseController {

	@Autowired
	private CourseDateService courseDateService;

	/**
	 * 获取数据
	 */
	@ModelAttribute
	public CourseDate get(String id, boolean isNewRecord) {
		return courseDateService.get(id, isNewRecord);
	}

	/**
	 * 查询列表
	 */
	@RequiresPermissions("sys:filemanager:courseDate:view")
	@RequestMapping(value = {"list"})
	public String list(CourseDate courseDate, Model model ) {
		System.out.println("******list()*******");
		model.addAttribute("courseDate", courseDate);
		return "modules/sys/filemanager/courseDateList";
	}

	/**
	 * 根据courseType查询列表
	 */
	@RequiresPermissions("sys:filemanager:courseDate:view")
	@RequestMapping(value = "list", params = {"courseType"})
	public String listByType(CourseDate courseDate, Model model, @RequestParam("courseType") String courseType) {
		System.out.println("******listByType()*******");
		courseDate.setCourseType(courseType);
		model.addAttribute("courseDate", courseDate);
		return "modules/sys/filemanager/courseDateList";
	}


	/**
	 * 查询列表数据
	 */
	@RequiresPermissions("sys:filemanager:courseDate:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<CourseDate> listData(CourseDate courseDate, HttpServletRequest request, HttpServletResponse response) {
		Page<CourseDate> page = new Page<CourseDate>();
		courseDate.setPage(new Page<>(request, response));// 给实体设置 page 参数即可自动分页
		List<CourseDate> list = courseDateService.findList(courseDate);
		page.setList(list);
//		page.getList();	 // 获取当前页数据
//		page = courseDateService.findPage(courseDate);
		return page;
	}

	/**
	 * 查看编辑表单
	 */
	@RequiresPermissions("sys:filemanager:courseDate:view")
	@RequestMapping(value = "form")
	public String form(CourseDate courseDate, Model model) {
		model.addAttribute("courseDate", courseDate);
		return "modules/sys/filemanager/courseDateForm";
	}

	/**
    * 保存课程资料表
    */
	@RequiresPermissions("sys:filemanager:courseDate:edit")
	@PostMapping(value = "save")
	@ResponseBody
	public String save(@Validated CourseDate courseDate) {
		courseDateService.save(courseDate);
		return renderResult(Global.TRUE, text("保存课程资料表成功！"));
	}

	/**
	 * 停用课程资料表
	 */
	@RequiresPermissions("sys:filemanager:courseDate:edit")
	@RequestMapping(value = "disable")
	@ResponseBody
	public String disable(CourseDate courseDate) {
		courseDate.setStatus(CourseDate.STATUS_DISABLE);
		courseDateService.updateStatus(courseDate);
		return renderResult(Global.TRUE, text("停用课程资料表成功"));
	}

	/**
	 * 启用课程资料表
	 */
	@RequiresPermissions("sys:filemanager:courseDate:edit")
	@RequestMapping(value = "enable")
	@ResponseBody
	public String enable(CourseDate courseDate) {
		courseDate.setStatus(CourseDate.STATUS_NORMAL);
		courseDateService.updateStatus(courseDate);
		return renderResult(Global.TRUE, text("启用课程资料表成功"));
	}

	/**
	 * 删除课程资料表
	 */
	@RequiresPermissions("sys:filemanager:courseDate:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(CourseDate courseDate) {
		courseDateService.delete(courseDate);
		return renderResult(Global.TRUE, text("删除课程资料表成功！"));
	}

}