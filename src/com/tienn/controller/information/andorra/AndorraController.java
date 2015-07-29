package com.tienn.controller.information.andorra;

import com.tienn.controller.base.BaseController;
import com.tienn.entity.Page;
import com.tienn.service.information.andorra.AndorraService;
import com.tienn.util.Const;
import com.tienn.util.DateUtil;
import com.tienn.util.PageData;
import com.tienn.util.UuidUtil;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 类名称：AndorraController
 *
 * @author Erlei Chen
 * @date 2015年7月28日
 */
@Controller
@RequestMapping(value = "/andorra")
public class AndorraController extends BaseController {

    @Resource(name = "andorraService")
    private AndorraService andorraService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    public ModelAndView listUsers(HttpSession session, Page page) throws Exception {
        logBefore(logger, "广告列表");
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        try {
            pd = this.getPageData();

            //检索条件================================
            String title = pd.getString("title");
            String publisher = pd.getString("publisher");
            if (null != title && !"".equals(title)) {
                title = title.trim();
                pd.put("title", title);
            }
            if (null != publisher && !"".equals(publisher)) {
                publisher = publisher.trim();
                pd.put("publisher", publisher);
            }
            //检索条件================================

            page.setPd(pd);
            List<PageData> varList = andorraService.list(page);

            mv.setViewName("information/andorra/andorra_list");
            mv.addObject("varList", varList);
            mv.addObject("pd", pd);
            mv.addObject(Const.SESSION_QX, this.getHC());    //按钮权限
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

        return mv;
    }


    /**
     * 去新增页面
     */
    @RequestMapping(value = "/goAdd")
    public ModelAndView goAdd() {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            mv.setViewName("information/andorra/andorra_edit");
            mv.addObject("msg", "save");
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 去修改页面
     */
    @RequestMapping(value = "/goEdit")
    public ModelAndView goEdit() {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {

            pd = andorraService.findById(pd);

            mv.setViewName("information/andorra/andorra_edit");
            mv.addObject("msg", "edit");
            mv.addObject("pd", pd);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit(
            HttpServletRequest request,
            @RequestParam(value = "tp", required = false) MultipartFile tp,
            @RequestParam(value = "tpz", required = false) String tpz,
            @RequestParam(value = "id", required = false) String id,
            @RequestParam(value = "title", required = false) String title,
            @RequestParam(value = "content", required = false) String content,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "publisher", required = false) String publisher,
            @RequestParam(value = "starttime", required = false) String starttime,
            @RequestParam(value = "endtime", required = false) String endtime,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "tourl", required = false) String tourl
    ) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("content", content);
        pd.put("id", id);
        pd.put("title", title);
        pd.put("type", type);
        pd.put("publisher", publisher);
        pd.put("starttime", starttime);
        pd.put("endtime", endtime);
        pd.put("status", status);
        pd.put("tourl", tourl);
        pd.put("uptime", DateUtil.getTime());                //修改时间

        if (null == tpz) {
            tpz = "";
        }

        //图片上传
        String pictureSaveFilePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../";
        pictureSaveFilePath = pictureSaveFilePath.substring(6);        //去掉 'file:/'

        if (null != tp && !tp.isEmpty()) {
            try {
                String tpid = UuidUtil.get32UUID();

                // 扩展名格式：
                String extName = "";
                if (tp.getOriginalFilename().lastIndexOf(".") >= 0) {
                    extName = tp.getOriginalFilename().substring(tp.getOriginalFilename().lastIndexOf("."));
                }

                this.copyFile(tp.getInputStream(), pictureSaveFilePath + "TP", tpid + extName).replaceAll("-", "");
                pd.put("adurl", tpid + extName);
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        } else {
            pd.put("adurl", tpz);
        }


        andorraService.edit(pd);


        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 保存
     */
    @RequestMapping(value = "/save")
    public ModelAndView save(
            HttpServletRequest request,
            @RequestParam(value = "tp", required = false) MultipartFile tp,
            @RequestParam(value = "title", required = false) String title,
            @RequestParam(value = "content", required = false) String content,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "publisher", required = false) String publisher,
            @RequestParam(value = "starttime", required = false) String starttime,
            @RequestParam(value = "endtime", required = false) String endtime,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "tourl", required = false) String tourl
    ) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        pd.put("title", title);
        pd.put("content", content);
        pd.put("type", type);
        pd.put("publisher", publisher);
        pd.put("starttime", starttime);
        pd.put("endtime", endtime);
        pd.put("status", status);
        pd.put("tourl", tourl);

        pd.put("addtime", DateUtil.getTime());                //新增时间
        pd.put("uptime", DateUtil.getTime());                //修改时间


        //图片上传
        String pictureSaveFilePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../";
        pictureSaveFilePath = pictureSaveFilePath.substring(6);        //去掉 'file:/'

        if (null != tp && !tp.isEmpty()) {
            try {
                String id = UuidUtil.get32UUID();

                // 扩展名格式：
                String extName = "";
                if (tp.getOriginalFilename().lastIndexOf(".") >= 0) {
                    extName = tp.getOriginalFilename().substring(tp.getOriginalFilename().lastIndexOf("."));
                }

                this.copyFile(tp.getInputStream(), pictureSaveFilePath + "TP", id + extName).replaceAll("-", "");
                pd.put("adurl", id + extName);
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        } else {
            pd.put("adurl", "");
        }


        andorraService.save(pd);


        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    public void delete(PrintWriter out) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        try {
            pd = this.getPageData();

            pd = andorraService.findById(pd);                                                        //通过ID获取数据
            String adurl = pd.getString("adurl");

            //删除硬盘上的文件 start
            String xmpath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../";    //项目路径

            if (adurl != null && !adurl.equals("")) {
                adurl = (xmpath.trim() + "TP/" + adurl.trim()).substring(6).trim();
                File f1 = new File(adurl.trim());
                if (f1.exists()) {
                    f1.delete();
                } else {
                    System.out.println("====" + adurl + "不存在");
                }
            }

            andorraService.delete(pd);
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }

    //删除图片
    @RequestMapping(value = "/deltp")
    public void deltp(PrintWriter out) {
        logBefore(logger, "删除图片");
        try {
            ModelAndView mv = new ModelAndView();
            PageData pd = new PageData();
            pd = this.getPageData();

            String tpurl = pd.getString("tpurl");                                                    //图片路径
            if (tpurl != null) {
                //删除硬盘上的文件 start
                String xmpath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../";    //项目路径
                tpurl = xmpath.trim() + "TP/" + tpurl.trim();
                tpurl = tpurl.substring(6);                                                            //去掉 'file:/'
                File f = new File(tpurl.trim());
                if (f.exists()) {
                    f.delete();
                } else {
                    System.out.println("====" + tpurl + "不存在");
                }
                //删除硬盘上的文件 end
                andorraService.delTp(pd);                                                        //删除数据中图片数据
            }

            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
    }


    /**
     * 写文件到当前目录的upload目录中
     *
     * @param in
     * @param fileName
     * @throws IOException
     */
    private String copyFile(InputStream in, String dir, String realName)
            throws IOException {
        File file = new File(dir, realName);
        if (!file.exists()) {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
        }
        FileUtils.copyInputStreamToFile(in, file);
        return realName;
    }


    /* ===============================权限================================== */
    public Map<String, String> getHC() {
        Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
        Session session = currentUser.getSession();
        return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
    }
    /* ===============================权限================================== */
}
