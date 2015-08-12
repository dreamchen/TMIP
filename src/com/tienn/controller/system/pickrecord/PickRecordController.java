package com.tienn.controller.system.pickrecord;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.tienn.util.AppUtil;
import com.tienn.util.ObjectExcelView;
import com.tienn.util.Const;
import com.tienn.util.PageData;
import com.tienn.util.Tools;
import com.tienn.util.Jurisdiction;
import com.tienn.service.system.pickrecord.PickRecordService;

/** 
 * 类名称：PickRecordController
 * @author Erlei Chen
 * @date 2015-08-02
 */
@Controller
@RequestMapping(value="/pickrecord")
public class PickRecordController extends BaseController {
	
	String menuUrl = "pickrecord/list.do"; //菜单地址(权限用)
	@Resource(name="pickrecordService")
	private PickRecordService pickrecordService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增PickRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PICKRECORD_ID", this.get32UUID());	//主键
		pickrecordService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除PickRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pickrecordService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改PickRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pickrecordService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表PickRecord");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = pickrecordService.list(page);	//列出PickRecord列表
			mv.setViewName("system/pickrecord/pickrecord_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增PickRecord页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			pd.put("PICK_DATETIME",sf.format(new Date()));
			mv.setViewName("system/pickrecord/pickrecord_edit");
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
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改PickRecord页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = pickrecordService.findById(pd);	//根据ID读取
			mv.setViewName("system/pickrecord/pickrecord_edit");
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
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除PickRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				pickrecordService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
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
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出PickRecord到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("学生姓名");	//1
			titles.add("接送时间");	//2
			titles.add("接送人ID");	//3
			titles.add("接送人名称");	//4
			titles.add("是否代接");	//5
			titles.add("代理人身份证号");	//6
			titles.add("代理人姓名");	//7
			titles.add("代理人照片");	//8
			titles.add("代理人身份证照片");	//9
			titles.add("委托详情");	//10
			titles.add("0:送 1:接");	//11
			titles.add("数据状态");	//12
			dataMap.put("titles", titles);
			List<PageData> varOList = pickrecordService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
				vpd.put("var2", varOList.get(i).getString("PICK_DATETIME"));	//2
				vpd.put("var3", varOList.get(i).getString("PICK_PEOPLE_ID"));	//3
				vpd.put("var4", varOList.get(i).getString("PICK_PEOPLE_NAME"));	//4
				vpd.put("var5", varOList.get(i).getString("IS_ENTRUST"));	//5
				vpd.put("var6", varOList.get(i).getString("ENTRUST_CARD"));	//6
				vpd.put("var7", varOList.get(i).getString("ENTRUST_NAME"));	//7
				vpd.put("var8", varOList.get(i).getString("ENTRUST_PHOTO"));	//8
				vpd.put("var9", varOList.get(i).getString("ENTRUST_CARD_PHOTO"));	//9
				vpd.put("var10", varOList.get(i).getString("ENTRUST_INFO"));	//10
				vpd.put("var11", varOList.get(i).getString("TYPE"));	//11
				vpd.put("var12", varOList.get(i).getString("STATUS"));	//12
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
