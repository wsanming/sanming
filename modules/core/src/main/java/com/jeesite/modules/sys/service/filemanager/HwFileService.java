/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.service.filemanager;

import java.util.ArrayList;
import java.util.List;

import com.jeesite.common.shiro.e.H;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeesite.common.entity.Page;
import com.jeesite.common.service.CrudService;
import com.jeesite.modules.sys.entity.filemanager.HwFile;
import com.jeesite.modules.sys.dao.filemanager.HwFileDao;
import com.jeesite.modules.file.utils.FileUploadUtils;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 华为证书表Service
 * @author xuqx
 * @version 2020-01-14
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

	@Transactional(readOnly = true)
	public List<HwFile> findHwFileByLoginCode(@RequestParam String loginCode){
		List<HwFile> hwFileList = new ArrayList<HwFile>();
		hwFileList = hwFileDao.findHwFileByLoginCode(loginCode);
		return hwFileList;
	}
	@Transactional(readOnly = true)
	public HwFile findHwFileById(@RequestParam Long fileId){
		HwFile hwFile = new HwFile();
		hwFile = hwFileDao.findHwFileById(fileId);
		return hwFile;
	}

}