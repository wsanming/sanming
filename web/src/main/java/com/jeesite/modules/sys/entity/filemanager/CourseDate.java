/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.sys.entity.filemanager;

import javax.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;

/**
 * 课程资料表Entity
 * @author wyn
 * @version 2020-01-16
 */
@Table(name="${_prefix}sys_course_date", alias="a", columns={
		@Column(name="id", attrName="id", label="编号", isPK=true),
		@Column(name="course_name", attrName="courseName", label="课程名称", queryType=QueryType.LIKE),
		@Column(name="course_type", attrName="courseType", label="课程方向"),
		@Column(name="is_exists_file", attrName="isExistsFile", label="是否存在文件"),
		@Column(name="file_name", attrName="fileName", label="文件名称", isQuery=true),
		@Column(name="file_path", attrName="filePath", label="文件路径", isQuery=true),
		@Column(includeEntity=DataEntity.class),
}, orderBy="a.update_date DESC"
)
public class CourseDate extends DataEntity<CourseDate> {

	private static final long serialVersionUID = 1L;
	private String courseName;		// 课程名称
	private String courseType;		// 课程方向
	private String isExistsFile;		// 是否存在文件
	private String fileName;		// 文件名称
	private String filePath;		// 文件路径

	public CourseDate() {
		this(null);
	}

	public CourseDate(String id){
		super(id);
	}

	@NotBlank(message="课程名称不能为空")
	@Length(min=0, max=255, message="课程名称长度不能超过 255 个字符")
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Length(min=0, max=255, message="课程方向长度不能超过 255 个字符")
	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	@NotBlank(message="是否存在文件不能为空")
	@Length(min=0, max=2, message="是否存在文件长度不能超过 2 个字符")
	public String getIsExistsFile() {
		return isExistsFile;
	}

	public void setIsExistsFile(String isExistsFile) {
		this.isExistsFile = isExistsFile;
	}

	@Length(min=0, max=500, message="文件名称长度不能超过 500 个字符")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Length(min=0, max=1000, message="文件路径长度不能超过 1000 个字符")
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "CourseDate{" +
				"courseName='" + courseName + '\'' +
				", courseType='" + courseType + '\'' +
				", isExistsFile='" + isExistsFile + '\'' +
				", fileName='" + fileName + '\'' +
				", filePath='" + filePath + '\'' +
				'}';
	}
}