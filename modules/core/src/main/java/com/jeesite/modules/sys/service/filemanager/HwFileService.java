/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.service.filemanager;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.io.FileUtils;
import com.jeesite.common.service.CrudService;

import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.sys.dao.filemanager.HwFileDao;
import com.jeesite.modules.sys.entity.filemanager.HwFile;

import com.jeesite.modules.sys.utils.FileDownloadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 华为证书表Service
 * @author xuqx
 * @version 2020-02-02
 */
@Service
@Transactional(readOnly=true)
public class HwFileService extends CrudService<HwFileDao, HwFile> {
	@Autowired
	private HwFileDao hwFileDao;
	/**
	 * 获取单条数据
	 * @param hwFile
	 * @return
	 */
	@Override
	public HwFile get(HwFile hwFile) {
		return super.get(hwFile);
	}
	
	/**
	 * 查询分页数据
	 * @param hwFile 查询条件
	 * @param hwFile.page 分页对象
	 * @return
	 */
	@Override
	public Page<HwFile> findPage(HwFile hwFile) {
		return super.findPage(hwFile);
	}
	
	/**
	 * 保存数据（插入或更新）
	 * @param hwFile
	 */
	@Override
	@Transactional(readOnly=false)
	public void save(HwFile hwFile) {
		super.save(hwFile);
		// 保存上传图片
		FileUploadUtils.saveFileUpload(hwFile.getId(), "hwFile_image");
	}
	
	/**
	 * 更新状态
	 * @param hwFile
	 */
	@Override
	@Transactional(readOnly=false)
	public void updateStatus(HwFile hwFile) {
		super.updateStatus(hwFile);
	}
	
	/**
	 * 删除数据
	 * @param hwFile
	 */
	@Override
	@Transactional(readOnly=false)
	public void delete(HwFile hwFile) {
		super.delete(hwFile);
	}


	/**
	 * @param loginCode
	 * @return
	 * 根据登录账号查询证书
	 */
	@Transactional(readOnly = true)
	public List<HwFile> findHwFileByLoginCode(@RequestParam String loginCode){
		List<HwFile> hwFileList = new ArrayList<HwFile>();
		hwFileList = hwFileDao.findHwFileByLoginCode(loginCode);
		return hwFileList;
	}

	/**
	 * 文件批量下载
	 * @param response
	 * @param names
	 * @param paths
	 */
	@Transactional(readOnly=false)
	public void downloadMore(HttpServletRequest request, HttpServletResponse response, String [] names, String [] paths) {
//		String baseDir = null;
//		try{
//		baseDir = FileUtils.path(Global.getUserfilesBaseDir(URLDecoder.decode(names[0], "utf-8")).substring(0, 11));
		FileDownloadUtils.downloadFile2Zip(request, response, names, paths,"" );
//		}
//		catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
		}
//	}
	/**
	 * 文件单个下载
	 */
	@Transactional(readOnly=false)
	public void downloadOne( HttpServletResponse response, String names[], String paths[]) {
		FileDownloadUtils.downloadFile(response,names,paths);
	}

}