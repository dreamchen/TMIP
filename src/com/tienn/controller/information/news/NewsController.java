package com.tienn.controller.information.news;

import com.tienn.controller.base.BaseController;
import com.tienn.entity.Page;
import com.tienn.service.information.news.NewsService;
import com.tienn.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类名称：NewsController
 *
 * @author Erlei Chen
 * @date 2015年7月28日
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController extends BaseController {


    @Resource(name = "newsService")
    private NewsService newsService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    public ModelAndView listUsers(HttpSession session, Page page) throws Exception {
        logBefore(logger, "新闻列表");
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
            List<PageData> varList = newsService.list(page);
            mv.setViewName("information/news/news_list");
            mv.addObject("varList", varList);
            mv.addObject("pd", pd);

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
            mv.setViewName("information/news/news_edit");
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

            pd = newsService.findById(pd);

            mv.setViewName("information/news/news_edit");
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
    public ModelAndView edit(PrintWriter out) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        //获取IP
        HttpServletRequest request = this.getRequest();
        String ip = "";
        if (request.getHeader("x-forwarded-for") == null) {
            ip = request.getRemoteAddr();
        } else {
            ip = request.getHeader("x-forwarded-for");
        }

        String sequence = pd.getString("sequence");

        pd.put("pip", ip);
        pd.put("uptime", DateUtil.getTime());                //修改时间
        pd.put("sequence", "".equals(sequence) ? 0 : sequence);

        newsService.edit(pd);

        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 保存
     */
    @RequestMapping(value = "/save")
    public ModelAndView save(PrintWriter out) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        //获取IP
        HttpServletRequest request = this.getRequest();
        String ip = "";
        if (request.getHeader("x-forwarded-for") == null) {
            ip = request.getRemoteAddr();
        } else {
            ip = request.getHeader("x-forwarded-for");
        }

        String sequence = pd.getString("sequence");

        pd.put("pip", ip);
        pd.put("addtime", DateUtil.getTime());                //新增时间
        pd.put("uptime", DateUtil.getTime());                //修改时间
        pd.put("hits", 0);                                    //点击数
        pd.put("sequence", "".equals(sequence) ? 0 : sequence);

        newsService.save(pd);


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
            newsService.delete(pd);
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }


    /**
     * 生成html
     */
    @RequestMapping(value = "/createHtml")
    public void createHtml(PrintWriter out) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            DelAllFile.delFolder(PathUtil.getClasspath() + "html/news"); //生成代码前,先清空之前生成的代码
            Map<String, Object> root = new HashMap<String, Object>();        //创建数据模型
            List<PageData> varList = newsService.newslist(pd);
            root.put("varList", varList);
            String filePath = "html/news/";                                //存放路径
            String ftlPath = "news";                                    //ftl路径
            /*生成*/
            Freemarker.printFile("index.ftl", root, "index.html", filePath, ftlPath);
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }


    /* ===============================权限================================== */
    public Map<String, String> getHC() {
        Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
        Session session = currentUser.getSession();
        return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
    }
    /* ===============================权限================================== */
}
