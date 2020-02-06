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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String form(HwFile hwFile, Model model) {
        model.addAttribute("hwFile", hwFile);
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
    public void download(HttpServletRequest request, HttpServletResponse response, String [] names, String [] paths) {
        String scheme = request.getScheme();//http
        String serverName = request.getServerName();//localhost
        int port = request.getServerPort();//8080
        String servePath = scheme+"://"+serverName+":"+port;  // http://localhost:8980/js/
        //存放--服务器上zip文件的目录
        String directory = "D:\\repository\\zipDir";
        File directoryFile=new File(directory);
        if(!directoryFile.isDirectory() && !directoryFile.exists()){ //判断是否存在目录
            directoryFile.mkdirs();
        }
        //设置最终输出zip文件的目录+文件名
        SimpleDateFormat formatter  = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        String zipFileName = formatter.format(new Date())+".zip";
        String strZipPath = directory+"\\"+zipFileName;

        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        //构造最终压缩包的输出流
        try {
            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));

            for(int i = 0; i < paths.length; i++){
                System.out.println("文件名称："+names[i]);
                //解码获取真实路径+真实文件名
                String realFileName = URLDecoder.decode(names[i],"utf-8");
//                System.out.println("磁盘："+Global.getUserfilesBaseDir(""));

//                System.out.println("文件路径："+URLDecoder.decode(Global.getUserfilesBaseDir("")+paths[i].substring(13),"utf-8"));

//                String realFilePath ="D:\\jeesite\\userfiles\\fileupload\\202001\\1215928295040294913.pdf";// servePath+URLDecoder.decode(paths[i],"utf-8");   //  /js/userfiles/fileupload/202001/1217655236346392578.txt
                String realFilePath =Global.getUserfilesBaseDir("")+paths[i].substring(13);

                File file = new File(realFilePath);
                if (file.exists()) {
                    //将需要压缩的文件格式化为输入流
                    zipSource = new FileInputStream(file);
					/*
					压缩条目不是具体独立的文件，而是压缩包文件列表的条目，这里的name为文件名，
					当文件名name和之前的重复就会导致文件被覆盖
					 */
                    ZipEntry zipEntry = new ZipEntry(realFileName); //压缩条目中的文件名
                    zipStream.putNextEntry(zipEntry); //定位该压缩条目位置，开始将文件写日到压缩包中
                    bufferStream = new BufferedInputStream(zipSource, 1024*10);
                    int read = 0;
                    byte[] buf = new byte[1024 * 10];
                    while ((read = bufferStream.read(buf, 0, 1024*10)) != -1) {
                        zipStream.write(buf, 0, read);
                    }
                } else {
                    System.out.println("========================下载文件未找到："+realFilePath );
//					String error = "下载的文件资源不存在";
//					response.getWriter().write(new JSONObject().put("error", error).toString());

                }
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferStream != bufferStream)
                    bufferStream.close();
                if (zipStream != null) {
                    zipStream.flush();
                    zipStream.close();
                }
                if (zipSource != null)
                    zipSource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //判断系统压缩包是否存在：true则把压缩包输出到客户端并删除压缩文件，false则不操作
        if (zipFile.exists()){
            downFile(response,zipFileName,strZipPath);
            zipFile.delete();
        }
    }

    private void downFile(HttpServletResponse response,String filename,String path) {
        if (filename != null) {
            FileInputStream is = null;
            BufferedInputStream bs = null;
            OutputStream os = null;
            try {
                File file = new File(path);
                if (file.exists()) {
                    //设置Headers
                    response.setHeader("Content-Type", "application/octet-stream");
                    //设置下载的文件名称，并用于解决中文乱码问题
                    response.setHeader("Content-Disposition", "attachment;filename="
                            + new String(filename.getBytes("UTF-8"), "ISO8859-1"));
                    is = new FileInputStream(file);
                    bs = new BufferedInputStream(is);
                    os = response.getOutputStream();

                    byte[] buffer = new byte[1024];
                    int len = 0;
                    while ((len = bs.read(buffer)) !=-1) {
                        os.write(buffer, 0, len);
                    }
                } else {
                    System.out.println("============下载的文件资源不存在============");
                }
            } catch(IOException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (is != null)
                        is.close();
                    if (bs != null)
                        bs.close();
                    if (os != null) {
                        os.flush();
                        os.close();
                    }
                } catch (IOException  e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

