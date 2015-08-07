package com.tienn.controller.business.classinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

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
import com.tienn.entity.system.User;
import com.tienn.service.business.classinfo.ClassInfoService;
import com.tienn.service.information.org.OrgService;
import com.tienn.service.toolService.AddParameterToMv;
import com.tienn.util.AppUtil;
import com.tienn.util.Const;
import com.tienn.util.Jurisdiction;
import com.tienn.util.ObjectExcelView;
import com.tienn.util.PageData;

/**
 * 类名称：ClassInfoController
 * 
 * @author Erlei Chen
 * @date 2015-08-06
 */
@Controller
@RequestMapping(value = "/classinfo")
public class ClassInfoController extends BaseController {

	String menuUrl = "classinfo/list.do"; // 菜单地址(权限用)
	@Resource(name = "classinfoService")
	private ClassInfoService classinfoService;
	@Resource(name="addParameterToMv")
	private AddParameterToMv addParameterToMv;
	@Resource(name="orgService")
	private OrgService orgService;


	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, "新增ClassInfo");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CLASSINFO_ID", this.get32UUID()); // 主键
		classinfoService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) {
		logBefore(logger, "删除ClassInfo");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			classinfoService.delete(pd);
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
		logBefore(logger, "修改ClassInfo");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		classinfoService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "列表ClassInfo");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = classinfoService.list(page); // 列出ClassInfo列表
			mv.setViewName("business/classinfo/classinfo_list");
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
	@RequestMapping(value = "/findById")
	public ModelAndView findById(Page page) throws Exception {
		logBefore(logger, "列表ClassInfo_detail");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			System.out.println("class_id==>"+pd.getString("CLASSINFO_ID"));
			pd=classinfoService.findById(pd);
			// 列出ClassInfo列表
			mv.setViewName("business/classinfo/classinfo_list_detail");
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
	public ModelAndView goAdd() {
		logBefore(logger, "去新增ClassInfo页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("business/classinfo/classinfo_edit");
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
	public ModelAndView goEdit() {
		logBefore(logger, "去修改ClassInfo页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = classinfoService.findById(pd); // 根据ID读取
			mv.setViewName("business/classinfo/classinfo_edit");
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
		logBefore(logger, "批量删除ClassInfo");
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
				classinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出ClassInfo到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("园区名称"); // 1
			titles.add("班级名称"); // 2
			titles.add("班级人数"); // 3
			titles.add("班主任老师"); // 4
			titles.add("营养师"); // 5
			titles.add("班级类型"); // 6
			titles.add("班级状态"); // 7
			titles.add("开班时间"); // 8
			titles.add("成长阶段开始时间"); // 9
			titles.add("成长阶段结束"); // 10
			titles.add("状态改变日期"); // 11
			titles.add("班级简介"); // 12
			titles.add("备注"); // 13
			dataMap.put("titles", titles);
			List<PageData> varOList = classinfoService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("KINDERGARTEN_ID"));
				// 1
				vpd.put("var2", varOList.get(i).getString("CLASS_NAME"));
				// 2
				vpd.put("var3", varOList.get(i).get("QUANTITY").toString());
				// 3
				vpd.put("var4", varOList.get(i).getString("MAIN_TEACHER_ID"));
				// 4
				vpd.put("var5", varOList.get(i).getString("DIETITIAN_ID"));
				// 5
				vpd.put("var6", varOList.get(i).getString("CLASS_TYPE"));
				// 6
				vpd.put("var7", varOList.get(i).getString("STATUS"));
				// 7
				vpd.put("var8", varOList.get(i).getString("CLASS_BEGIN_TIME"));
				// 8
				vpd.put("var9", varOList.get(i).getString("GROWTH_STAGE_BEGIN"));
				// 9
				vpd.put("var10", varOList.get(i).getString("GROWTH_STAGE_END"));
				// 10
				vpd.put("var11", varOList.get(i)
						.getString("STATUS_CHANGE_TIME"));
				// 11
				vpd.put("var12", varOList.get(i).getString("DESCRIPTION"));
				// 12
				vpd.put("var13", varOList.get(i).getString("REMARK"));
				// 13
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
	
	/**
     * zTree多级别树页面
     */
    @RequestMapping(value = "/classinfoTree")
    public ModelAndView classinfoTree() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        String userDept = user.getDEPT();
        pd.put("ORG_ID", userDept);
       
        List<PageData> szdList = orgService.takeOrgTreeByORGID(pd);
        
       //根据所有园区查找教育类的，并且根据ORG_ID查询所属班级信息
        List<PageData> resultList =new ArrayList<PageData>();
        List<PageData> listClass;
        for (PageData pdata : szdList) {
			if (null!=pdata.getString("DEFAULTONE")&&pdata.getString("DEFAULTONE").equals("7165f8defb8b4077bd9fd5e68a53b4e4")) {
				resultList.add(pdata);
				//以上为教育类的机构数，也就是只显示园区信息，操作半截维护页面
				
//				//以下为增加班级至树型结构，操作儿童列表维护页面
//				listClass = orgService.listClassByOrgId(pdata.getString("ORG_ID"));
//				for (PageData pdClass : listClass) {
//					resultList.add(pdClass);
//				}
			}
		}
        
        JSONArray arr = JSONArray.fromObject(resultList);
        String json = arr.toString();
        json = json.replaceAll("ORG_ID", "id").replaceAll("CLASS_NAME", "name").replaceAll("NAME", "name").replaceAll("P_ID", "pId");
        System.out.println(json);
        json = json.replaceAll("CLASSINFO_ID", "id").replaceAll("KINDERGARTEN_ID", "pId");//将班级信息加入至机构树
        mv.addObject("zTreeNodes",json);
        System.out.println(json);
        mv.setViewName("business/classinfo/classinfo_Tree");
        
        mv.addObject("pd", pd);
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
