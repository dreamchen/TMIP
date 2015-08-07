package com.tienn.controller.business.parent;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tienn.controller.base.BaseController;
import com.tienn.entity.Page;
import com.tienn.service.business.parent.ParentService;
import com.tienn.service.toolService.AddParameterToMv;
import com.tienn.util.AppUtil;
import com.tienn.util.Const;
import com.tienn.util.Jurisdiction;
import com.tienn.util.ObjectExcelView;
import com.tienn.util.PageData;

/**
 * 类名称：ParentController
 * 
 * @author Erlei Chen
 * @date 2015-08-05
 */
@Controller
@RequestMapping(value = "/parent")
public class ParentController extends BaseController {

	String menuUrl = "parent/list.do"; // 菜单地址(权限用)
	@Resource(name = "parentService")
	private ParentService parentService;
	@Resource(name="addParameterToMv")
	private AddParameterToMv addParameterToMv;
	

	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, "新增Parent");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PARENT_ID", this.get32UUID()); // 主键
		parentService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) {
		logBefore(logger, "删除Parent");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			parentService.delete(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, "修改Parent");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		parentService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "列表Parent");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = parentService.list(page); // 列出Parent列表
			mv.setViewName("business/parent/parent_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/listByStudentId")
	public ModelAndView listByStudentId(Page page) {
		logBefore(logger, "列表Parent");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			String stu_id=pd.getString("STUDENT_ID");
			System.out.println("获取的学生id是 "+stu_id);
			List<PageData> varList = parentService.listByStudentId(pd); // 列出Parent列表
			mv.setViewName("business/parent/parent_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd(HttpServletRequest request) throws Exception {
		logBefore(logger, "去新增Parent页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		addParameterToMv.findResultFromDicAndAddParameterToMv(request, mv);
		try {
			mv.setViewName("business/parent/parent_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit(HttpServletRequest request) throws Exception{
		logBefore(logger, "去修改Parent页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		addParameterToMv.findResultFromDicAndAddParameterToMv(request, mv);
		try {
			pd = parentService.findById(pd); // 根据ID读取
			mv.setViewName("business/parent/parent_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Parent");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "dell")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if (null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				parentService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			} else {
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

	/*
	 * 导出到excel
	 * 
	 * @return
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() {
		logBefore(logger, "导出Parent到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("家长姓名"); // 1
			titles.add("被监护人"); // 2
			titles.add("亲属关系"); // 3
			titles.add("血型"); // 4
			titles.add("性别"); // 5
			titles.add("身份证"); // 6
			titles.add("联系电话"); // 7
			titles.add("备注"); // 8
			dataMap.put("titles", titles);
			List<PageData> varOList = parentService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));
				// 1
				vpd.put("var2", varOList.get(i).getString("STUDENT_NAME"));
				// 2
				vpd.put("var3", varOList.get(i).getString("RELATION"));
				// 3
				vpd.put("var4", varOList.get(i).getString("BLOOD_TYPE"));
				// 4
				vpd.put("var5", varOList.get(i).getString("GENDER"));
				// 5
				vpd.put("var6", varOList.get(i).getString("ID_CARD_NUM"));
				// 6
				vpd.put("var7", varOList.get(i).getString("TELEPHONE"));
				// 7
				vpd.put("var8", varOList.get(i).getString("REMARK"));
				// 8
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/*
	 * ===============================权限==================================
	 */
	public Map<String, String> getHC() {
		Subject currentUser = SecurityUtils.getSubject(); // shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
	}

	/*
	 * ===============================权限==================================
	 */

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
