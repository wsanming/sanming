/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.entity.filemanager;

import javax.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.jeesite.common.mybatis.annotation.JoinTable;
import com.jeesite.common.mybatis.annotation.JoinTable.Type;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;
import org.springframework.beans.factory.annotation.Value;
/**
 * 华为证书表Entity
 * @author xuqx
 * @version 2020-01-14
 */
@Table(name="${_prefix}sys_hw_file", alias="a", columns={
		@Column(name="file_id", attrName="fileId", label="文件编号", isPK=true),
		@Column(name="file_name", attrName="fileName", label="文件名称", queryType=QueryType.LIKE),
		@Column(name="file_direction", attrName="fileDirection", label="证书方向"),
		@Column(name="file_level", attrName="fileLevel", label="证书等级"),
		@Column(name="file_holder", attrName="fileHolder", label="证书持有者"),
		@Column(name="file_date", attrName="fileDate", label="证书到期时间"),
	}, orderBy="a.file_id DESC"
)
public class HwFile extends DataEntity<HwFile> {
	
	private static final long serialVersionUID = 1L;
	private String fileId;		// 文件编号
	private String fileName;		// 文件名称
	private String fileDirection;		// 证书方向
	private String fileLevel;		// 证书等级
	private String fileHolder;		// 证书持有者
	private Date fileDate;		// 证书到期时间
	
	public HwFile() {
		this(null);
	}

	public HwFile(String id){
		super(id);
	}
	
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	@NotBlank(message="文件名称不能为空")
	@Length(min=0, max=1000, message="文件名称长度不能超过 1000 个字符")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@NotBlank(message="证书方向不能为空")
	@Length(min=0, max=1000, message="证书方向长度不能超过 1000 个字符")
	public String getFileDirection() {
		return fileDirection;
	}

	public void setFileDirection(String fileDirection) {
		this.fileDirection = fileDirection;
	}
	
	@NotBlank(message="证书等级不能为空")
	@Length(min=0, max=100, message="证书等级长度不能超过 100 个字符")
	public String getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}
	@NotBlank(message="证书持有者不能为空")
	@Length(min=0, max=10, message="证书持有者长度不能超过 10 个字符")
	public String getFileHolder() {
		return fileHolder;
	}

	public void setFileHolder(String fileHolder) {
		this.fileHolder = fileHolder;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotNull(message="证书到期时间不能为空")
	public Date getFileDate() {
		return fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	
}