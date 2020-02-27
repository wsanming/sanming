package com.jeesite.common.utils;

import com.jeesite.common.config.Global;
import com.jeesite.common.io.FileUtils;
import com.jeesite.common.lang.StringUtils;
import com.jeesite.modules.sys.utils.UserUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileDownloadUtils {

    private static String baseDir =  FileUtils.path(Global.getUserfilesBaseDir("")); // 获取路径：/D:/jeesite/userfiles/

    public static String getBaseDir() {
        return baseDir;
    }

    public static void setBaseDir(String baseDir) {
        FileDownloadUtils.baseDir = baseDir;
    }

    /**
     * 课程表资料批量下载:压缩文件列表命名方式修改后，如 序号_文件类型_文件名称.xlsx
     * @param request
     * @param response
     * @param names
     * @param paths
     * @param typeNames 文件类型
     */
    public static void downloadFile2Zip(HttpServletRequest request, HttpServletResponse response, String [] names, String [] paths, String[] typeNames) {
        try {
            baseDir = FileDownloadUtils.getBaseDir();
            System.out.println("baseDir = "+baseDir);
            for(int i = 0; i < names.length; i++){
                names[i] = URLDecoder.decode(i+"_"+typeNames[i]+"_"+names[i],"utf-8");
                System.out.println("name= "+names[i]);
            }
            downloadFile2Zip( request,  response, names, paths, baseDir);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public FileDownloadUtils() {
    }

        /**
         * 批量下载多个文件合成生成压缩文件zip
         * @param request
         * @param response
         * @param names 压缩列表中条目文件名
         * @param paths 被压缩的文件路径
         * @param baseDir 服务器上传文件跟路径
         */
    public static void downloadFile2Zip(HttpServletRequest request, HttpServletResponse response, String [] names, String [] paths, String baseDir) {
        //存放在服务器上zip文件的目录
        if (StringUtils.isEmpty(baseDir)) {
            baseDir= FileDownloadUtils.getBaseDir();
        }
        String directory = FileUtils.path(baseDir.substring(0,11)+"\\zipDir");
        File directoryFile=new File(directory);
        if(!directoryFile.isDirectory() && !directoryFile.exists()){ //判断是否存在目录
            directoryFile.mkdirs();
        }
        //设置最终输出zip文件的目录+文件名
        SimpleDateFormat formatter  = new SimpleDateFormat("yyMMddHHmmss");
        String zipFileName = formatter.format(new Date())+"_"+UserUtils.getUser()+".zip";
        String strZipPath = FileUtils.path(directory+"\\"+zipFileName);

        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        //构造最终压缩包的输出流
        try {
            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));

            for(int i = 0; i < paths.length; i++){
                //解码获取真实路径+真实文件名
                String realFilePath =baseDir+paths[i];
                String realFileName =names[i];
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
                    System.out.println("========================下载文件路径未找到："+realFilePath +"========================" );
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
        //判断系统压缩包是否存：true则把压缩包输出到客户端并删除压缩文件，false则不操作
        if (zipFile.exists()){
            try {
                downloadFile(request, response,zipFileName,strZipPath);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            zipFile.delete();
        }
    }

    /**
     * 下载单个文件
     * @param response
     * @param filename
     * @param path
     */
    public static void downloadFile(HttpServletRequest request, HttpServletResponse response, String filename, String path) throws UnsupportedEncodingException {
        String userAgent = request.getHeader("user-agent").toLowerCase();
        if (userAgent.contains("msie")) {
            // win10 ie
            filename = URLEncoder.encode(filename, "UTF-8");
        } else {
            // edge 谷歌、火狐浏览器
            filename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
        }
        if (filename != null) {
            FileInputStream is = null;
            BufferedInputStream bs = null;
            OutputStream os = null;
            try {
                File file = new File(path);
                if (file.exists()) {
                    response.setCharacterEncoding("utf-8");
                    //设置Headers
                    response.setHeader("Content-Type", "application/octet-stream");
                    //设置下载的文件名称，并用于解决中文乱码问题
                    response.setHeader("Content-Disposition", "attachment;filename=" + filename);
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
