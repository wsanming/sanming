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

/**
 * 华为证书表Entity
 * @author xuqx
 * @version 2020-02-02
 */
@Table(name="${_prefix}sys_hw_file", alias="a", columns={
		@Column(name="certificate_id", attrName="certificateId", label="证书编号", isPK=true),
		@Column(name="file_name", attrName="fileName", label="文件名称", queryType=QueryType.LIKE),
		@Column(name="certificate_name", attrName="certificateName", label="证书名称", queryType=QueryType.LIKE),
		@Column(name="certificate_direction", attrName="certificateDirection", label="证书方向"),
		@Column(name="certificate_level", attrName="certificateLevel", label="证书等级"),
		@Column(name="certificate_holder", attrName="certificateHolder", label="证书持有者"),
		@Column(name="certificate_date", attrName="certificateDate", label="证书到期时间"),
		@Column(name="creat_by", attrName="creatBy", label="上传证书者"),
		@Column(name="creat_date", attrName="creatDate", label="上传证书时间"),
		@Column(name="update_by", attrName="updateBy", label="更新证书者", isQuery=false),
		@Column(name="update_date", attrName="updateDate", label="更新证书时间", isQuery=false),
		@Column(name="file_path", attrName="filePath", label="文件路径"),
		@Column(name="is_exists", attrName="isExists", label="证书是否存在"),
		@Column(name="file_extension", attrName="fileExtension", label="文件扩展名"),
		@Column(name="file_status", attrName="fileStatus", label="状态", comment="状态（0正常 1删除 2停用）"),
		@Column(name="remarks", attrName="remarks", label="备注", queryType=QueryType.LIKE),
	}, orderBy="a.update_date DESC"
)
public class HwFile extends DataEntity<HwFile> {
	
	private static final long serialVersionUID = 1L;
	private String certificateId;		// 证书编号
	private String fileName;		// 文件名称
	private String certificateName;		// 证书名称
	private String certificateDirection;		// 证书方向
	private String certificateLevel;		// 证书等级
	private String certificateHolder;		// 证书持有者
	private Date certificateDate;		// 证书到期时间
	private String creatBy;		// 上传证书者
	private Date creatDate;		// 上传证书时间
	private String filePath;		// 文件路径
	private String isExists;		// 证书是否存在
	private String fileExtension;		// 文件扩展名
	private String fileStatus;		// 状态（0正常 1删除 2停用）
	
	public HwFile() {
		this(null);
	}

	public HwFile(String id){
		super(id);
	}
	
	public String getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(String certificateId) {
		this.certificateId = certificateId;
	}
	
	@NotBlank(message="文件名称不能为空")
	@Length(min=0, max=1000, message="文件名称长度不能超过 1000 个字符")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@NotBlank(message="证书名称不能为空")
	@Length(min=0, max=1000, message="证书名称长度不能超过 1000 个字符")
	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}
	
	@NotBlank(message="证书方向不能为空")
	@Length(min=0, max=1000, message="证书方向长度不能超过 1000 个字符")
	public String getCertificateDirection() {
		return certificateDirection;
	}

	public void setCertificateDirection(String certificateDirection) {
		this.certificateDirection = certificateDirection;
	}
	
	@NotBlank(message="证书等级不能为空")
	@Length(min=0, max=100, message="证书等级长度不能超过 100 个字符")
	public String getCertificateLevel() {
		return certificateLevel;
	}

	public void setCertificateLevel(String certificateLevel) {
		this.certificateLevel = certificateLevel;
	}
	
	@NotBlank(message="证书持有者不能为空")
	@Length(min=0, max=10, message="证书持有者长度不能超过 10 个字符")
	public String getCertificateHolder() {
		return certificateHolder;
	}

	public void setCertificateHolder(String certificateHolder) {
		this.certificateHolder = certificateHolder;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotNull(message="证书到期时间不能为空")
	public Date getCertificateDate() {
		return certificateDate;
	}

	public void setCertificateDate(Date certificateDate) {
		this.certificateDate = certificateDate;
	}
	
//	@NotBlank(message="上传证书者不能为空")
//	@Length(min=0, max=100, message="上传证书者长度不能超过 100 个字符")
	public String getCreatBy() {
		return creatBy;
	}

	public void setCreatBy(String creatBy) {
		this.creatBy = creatBy;
	}
	
//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//	@NotNull(message="上传证书时间不能为空")
	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	
	@NotBlank(message="文件路径不能为空")
	@Length(min=0, max=1000, message="文件路径长度不能超过 1000 个字符")
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
//	@NotBlank(message="证书是否存在不能为空")
//	@Length(min=0, max=2, message="证书是否存在长度不能超过 2 个字符")
	public String getIsExists() {
		return isExists;
	}

	public void setIsExists(String isExists) {
		this.isExists = isExists;
	}
	
//	@NotBlank(message="文件扩展名不能为空")
//	@Length(min=0, max=100, message="文件扩展名长度不能超过 100 个字符")
	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
	
//	@NotBlank(message="状态不能为空")
//	@Length(min=0, max=1, message="状态长度不能超过 1 个字符")
	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}
	
}