/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.web.filemanager;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeesite.common.io.FileUtils;
import com.jeesite.modules.sys.entity.Config;
import com.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.sys.entity.filemanager.HwFile;
import com.jeesite.modules.sys.service.filemanager.HwFileService;

import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static com.jeesite.common.web.http.ServletUtils.renderResult;

/**
 * 华为证书表Controller
 *
 * @author xuqx
 * @version 2020-02-02
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
    public HwFile get(String certificateId, boolean isNewRecord) {
        return hwFileService.get(certificateId, isNewRecord);
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
    public String form(HwFile hwFile, @RequestParam("loginCode") String loginCode, Model model) {
        model.addAttribute("hwFile", hwFile);
        model.addAttribute("loginCode",loginCode);
        System.out.println("证书持有者："+loginCode);
        return "modules/sys/filemanager/hwFileForm";
    }

    /**
     * 保存华为证书
     */
    @RequiresPermissions("sys:filemanager:hwFile:edit")
    @PostMapping(value = "save")
    @ResponseBody
    public String save(@Validated HwFile hwFile) {
//		System.out.println("文件名称："+hwFile.getFileName());
//		System.out.println("文件路径："+hwFile.getFilePath());
////		String[] fileNameArray = new String[]{};
////		if (hwFile.getFileName().contains("\\|")) {
//		String[] fileNameArray = hwFile.getFileName().split("\\|");
//		System.out.println("数组长度："+fileNameArray.length);
////		}
//		for (int i =0;i<fileNameArray.length;i++){
//			System.out.println(fileNameArray[i]);
//			hwFile.setFileName(fileNameArray[i]);
//			hwFile.setCreatBy(UserUtils.getUser().getUserName());
//			hwFile.setCreatDate(new Date());
//			hwFile.setUpdateBy(UserUtils.getUser().getUserName());
//			hwFile.setUpdateDate(new Date());
//			System.out.println("华为证书："+hwFile);
//			hwFileService.save(hwFile);
//		}
        if (hwFile.getCreatBy() == null) {
            hwFile.setCreatBy(UserUtils.getUser().getUserName());
            hwFile.setCreatDate(new Date());
        }
        hwFile.setUpdateBy(UserUtils.getUser().getUserName());
        hwFile.setUpdateDate(new Date());
        hwFileService.save(hwFile);
        return renderResult(Global.TRUE, text("保存华为证书成功！"));
    }

    /**
     * 停用华为证书
     */
    @RequiresPermissions("sys:filemanager:hwFile:edit")
    @RequestMapping(value = "disable")
    @ResponseBody
    public String disable(HwFile hwFile) {
        hwFile.setStatus(HwFile.STATUS_DISABLE);
        hwFileService.updateStatus(hwFile);
        return renderResult(Global.TRUE, text("停用华为证书成功"));
    }

    /**
     * 启用华为证书
     */
    @RequiresPermissions("sys:filemanager:hwFile:edit")
    @RequestMapping(value = "enable")
    @ResponseBody
    public String enable(HwFile hwFile) {
        hwFile.setStatus(HwFile.STATUS_NORMAL);
        hwFileService.updateStatus(hwFile);
        return renderResult(Global.TRUE, text("启用华为证书成功"));
    }

    /**
     * 删除华为证书
     */
    @RequiresPermissions("sys:filemanager:hwFile:edit")
    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(HwFile hwFile) {
        hwFileService.delete(hwFile);
        return renderResult(Global.TRUE, text("删除华为证书成功！"));
    }

    /**
     * 文件下载
     * @param response
     * @param names
     * @param paths
     */
    @RequestMapping(value = "download")
    public void download(HttpServletRequest request, HttpServletResponse response, String [] names, String [] paths) throws UnsupportedEncodingException {
        if (paths.length==1) {
            hwFileService.downloadOne(response,names,paths);
        }else{
            hwFileService.downloadMore(request, response, names, paths);
        }
    }
}

