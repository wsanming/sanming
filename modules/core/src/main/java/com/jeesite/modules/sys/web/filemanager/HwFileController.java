/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.web.filemanager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.sys.entity.filemanager.HwFile;
import com.jeesite.modules.sys.service.filemanager.HwFileService;

import java.io.File;
import java.io.FileInputStream;

/**
 * 华为证书表Controller
 * @author xuqx
 * @version 2020-01-14
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/filemanager/hwFile")
public class HwFileController extends BaseController {

	@Autowired
	private HwFileService hwFileService;
	
	/**
	 * 获取数据
	 */
	@ModelAttribute
	public HwFile get(String fileId, boolean isNewRecord) {
		return hwFileService.get(fileId, isNewRecord);
	}
	
	/**
	 * 查询列表
	 */
	@RequiresPermissions("sys:filemanager:hwFile:view")
	@RequestMapping(value = {"list", ""})
	public String list(HwFile hwFile, Model model) {
		model.addAttribute("hwFile", hwFile);
		return "modules/sys/filemanager/hwFileList";
	}
	
	/**
	 * 查询列表数据
	 */
	@RequiresPermissions("sys:filemanager:hwFile:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<HwFile> listData(HwFile hwFile, HttpServletRequest request, HttpServletResponse response) {
		hwFile.setPage(new Page<>(request, response));
		Page<HwFile> page = hwFileService.findPage(hwFile);
		return page;
	}

	/**
	 * 查看编辑表单
	 */
	@RequiresPermissions("sys:filemanager:hwFile:view")
	@RequestMapping(value = "form")
	public String form(HwFile hwFile, Model model) {
		model.addAttribute("hwFile", hwFile);
		return "modules/sys/filemanager/hwFileForm";
	}

	/**
	 * 保存华为证书上传
	 */
	@RequiresPermissions("sys:filemanager:hwFile:edit")
	@PostMapping(value = "save")
	@ResponseBody
	public String save(@Validated HwFile hwFile) {
		hwFileService.save(hwFile);
		return renderResult(Global.TRUE, text("保存华为证书上传成功！"));
	}
	
	/**
	 * 停用华为证书上传
	 */
	@RequiresPermissions("sys:filemanager:hwFile:edit")
	@RequestMapping(value = "disable")
	@ResponseBody
	public String disable(HwFile hwFile) {
		hwFile.setStatus(HwFile.STATUS_DISABLE);
		hwFileService.updateStatus(hwFile);
		return renderResult(Global.TRUE, text("停用华为证书上传成功"));
	}
	
	/**
	 * 启用华为证书上传
	 */
	@RequiresPermissions("sys:filemanager:hwFile:edit")
	@RequestMapping(value = "enable")
	@ResponseBody
	public String enable(HwFile hwFile) {
		hwFile.setStatus(HwFile.STATUS_NORMAL);
		hwFileService.updateStatus(hwFile);
		return renderResult(Global.TRUE, text("启用华为证书上传成功"));
	}
	
	/**
	 * 删除华为证书上传
	 */
	@RequiresPermissions("sys:filemanager:hwFile:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(HwFile hwFile) {
		hwFileService.delete(hwFile);
		return renderResult(Global.TRUE, text("删除华为证书上传成功！"));
	}
	/**
	 * 下载华为证书上传
	 */
	@RequiresPermissions("sys:filemanager:hwFile:edit")
	@RequestMapping(value = "download")
	@ResponseBody
	public String download(HwFile hwFile, @RequestParam("fileId")long fileId) {
		hwFile = hwFileService.findHwFileById(fileId);
		System.out.println("华为证书："+hwFile);

		return renderResult(Global.TRUE, text("下载华为证书成功！"));
	}

}