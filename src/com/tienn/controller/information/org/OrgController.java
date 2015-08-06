package com.tienn.controller.information.org;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tienn.controller.base.BaseController;
import com.tienn.entity.Page;
import com.tienn.service.information.org.OrgService;
import com.tienn.service.system.dictionaries.DictionariesService;
import com.tienn.util.AppUtil;
import com.tienn.util.PageData;

/** 
 * 类名称：OrgController
 * 创建人：FH 
 * 创建时间：2015-07-23
 */
@Controller
@RequestMapping(value="/org")
public class OrgController extends BaseController {
	
	String menuUrl = "org.do"; //菜单地址(权限用)
	@Resource(name="orgService")
	private OrgService orgService;
	@Resource(name = "dictionariesService")
    private DictionariesService dictionariesService;
	
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdp = new PageData();
		pdp = this.getPageData();
		
		String PARENT_ID = pd.getString("P_ID");
		pdp.put("ORG_ID", PARENT_ID);
		
		if(null == pd.getString("ORG_ID") || "".equals(pd.getString("ORG_ID"))){
			if(null != PARENT_ID && "0".equals(PARENT_ID)){
				pd.put("CLASS", 1);
				pd.put("PCODE", pd.getString("CODE"));
			}else{
				pdp = orgService.findById(pdp);
				pd.put("CLASS", Integer.parseInt(pdp.get("CLASS").toString()) + 1);
				pd.put("PCODE", pdp.getString("CODE") + "_" + pd.getString("CODE"));
			}
			pd.put("ORG_ID", this.get32UUID());	//ID
			orgService.save(pd);
		}else{
			pdp = orgService.findById(pdp);
			if(null != PARENT_ID && "0".equals(PARENT_ID)){
				pd.put("PCODE",  pd.getString("CODE"));
			}else{
				pd.put("PCODE", pdp.getString("CODE") + "_" + pd.getString("CODE"));
			}
			
			orgService.edit(pd);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}
	
	/**
	 * 列表
	 */
	List<PageData> szdList;
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PARENT_ID = pd.getString("P_ID");
		
		
		if(null != PARENT_ID && !"".equals(PARENT_ID) && !"0".equals(PARENT_ID)){
			
			//返回按钮用
			PageData pdp = new PageData();
			pdp = this.getPageData();
			
			pdp.put("ORG_ID", PARENT_ID);
			pdp = orgService.findById(pdp);
			mv.addObject("pdp", pdp);
			
			//头部导航
			szdList = new ArrayList<PageData>();
			this.getZDname(PARENT_ID);	//	逆序
			Collections.reverse(szdList);
			
		}
		
		
		String NAME = pd.getString("NAME");
		if(null != NAME && !"".equals(NAME)){
			NAME = NAME.trim();
			pd.put("NAME", NAME);
		}
		page.setShowCount(5);	//设置每页显示条数
		page.setPd(pd);				
		List<PageData> varList = orgService.dictlistPage(page);
		
		mv.setViewName("information/org/org_list");
		mv.addObject("varList", varList);
		mv.addObject("varsList", szdList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	//递归
	public void getZDname(String PARENT_ID) {
		logBefore(logger, "递归");
		System.out.println(22323);
		try {
			PageData pdps = new PageData();;
			pdps.put("ORG_ID", PARENT_ID);
			pdps = orgService.findById(pdps);
			if(pdps != null){
				szdList.add(pdps);
				String PARENT_IDs = pdps.getString("P_ID");
				this.getZDname(PARENT_IDs);
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
	}
	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(){
		logBefore(logger, "去新增Org页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> dictList = dictionariesService.findDictListByBM(pd);
			mv.addObject("dictList",dictList);
			mv.setViewName("information/org/org_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去编辑页面
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit( String ROLE_ID )throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> dictList = dictionariesService.findDictListByBM(pd);
		mv.addObject("dictList",dictList);
		
		pd = orgService.findById(pd);
		if(Integer.parseInt(orgService.findCount(pd).get("ZS").toString()) != 0){
			mv.addObject("msg", "no");
		}else{
			mv.addObject("msg", "ok");
		}
		
		mv.setViewName("information/org/org_edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 判断编码是否存在
	 */
	@RequestMapping(value="/has")
	public void has(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(orgService.findBmCount(pd) != null){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		String errInfo = "";
		try{
			pd = this.getPageData();
			
			if(Integer.parseInt(orgService.findCount(pd).get("ZS").toString()) != 0){
				errInfo = "false";
			}else{
				orgService.delete(pd);
				errInfo = "success";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**
	 * 
	 * getOrgTByAll 
	 * @Description:机构列表（ConbomTREE）
	 * @return:JSON 
	 * @throws Exception 
	 */
	@RequestMapping("getOrgTByAll")
	public @ResponseBody JSON getOrgTByAll() throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> orgList =new ArrayList<PageData>();
		orgList = orgService.selectOrgTree(pd);
		
		JSON json = this.createOrgTree(orgList, "0");
		System.out.println(json);
		return json;
	}
	
	
	public JSON createOrgTree(List<PageData> orgList,String pid) throws Exception{
		List<PageData> jsonList = new ArrayList<PageData>();
		PageData jsonData =new PageData();
		for (PageData orgInf : orgList) {
			if(pid.equals(orgInf.get("P_ID"))){
				jsonData =new PageData();
				jsonData.put("id", orgInf.get("ORG_ID"));
				jsonData.put("text", orgInf.get("NAME"));
//				jsonData.put("pid", orgInf.get("P_ID"));
//				jsonData.put("url", "http://www.baidu.com");
//				jsonData.put("target", "treeFrame");
				if ((Integer)orgService.hasSonId(orgInf.get("ORG_ID"))>0) {
					jsonData.put("state", "open");
					jsonData.put("children",createOrgTree(orgList,(orgInf.get("ORG_ID")).toString()));
				}
				System.out.println(jsonData);
				jsonList.add(jsonData);
			}
		}
		return JSONArray.fromObject(jsonList);
	}
	
//	/**
//	 * 列表
//	 */
//	@RequestMapping(value="/list")
//	public ModelAndView list(Page page){
//		logBefore(logger, "列表Org");
//		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		try{
//			pd = this.getPageData();
//			page.setPd(pd);
//			List<PageData>	varList = orgService.list(page);	//列出Org列表
//			mv.setViewName("information/org/org_list");
//			mv.addObject("varList", varList);
//			mv.addObject("pd", pd);
//			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//		return mv;
//	}
	
	
	
//	/**
//	 * 批量删除
//	 */
//	@RequestMapping(value="/deleteAll")
//	@ResponseBody
//	public Object deleteAll() {
//		logBefore(logger, "批量删除Org");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
//		PageData pd = new PageData();		
//		Map<String,Object> map = new HashMap<String,Object>();
//		try {
//			pd = this.getPageData();
//			List<PageData> pdList = new ArrayList<PageData>();
//			String DATA_IDS = pd.getString("DATA_IDS");
//			if(null != DATA_IDS && !"".equals(DATA_IDS)){
//				String ArrayDATA_IDS[] = DATA_IDS.split(",");
//				orgService.deleteAll(ArrayDATA_IDS);
//				pd.put("msg", "ok");
//			}else{
//				pd.put("msg", "no");
//			}
//			pdList.add(pd);
//			map.put("list", pdList);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		} finally {
//			logAfter(logger);
//		}
//		return AppUtil.returnObject(pd, map);
//	}
	
//	/*
//	 * 导出到excel
//	 * @return
//	 */
//	@RequestMapping(value="/excel")
//	public ModelAndView exportExcel(){
//		logBefore(logger, "导出Org到excel");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
//		ModelAndView mv = new ModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		try{
//			Map<String,Object> dataMap = new HashMap<String,Object>();
//			List<String> titles = new ArrayList<String>();
//			titles.add("园区名称");	//1
//			titles.add("组织机构代码");	//2
//			titles.add("上级机构代码");	//3
//			titles.add("级别");	//4
//			titles.add("顺序");	//5
//			titles.add("成立时间");	//6
//			titles.add("人数规模");	//7
//			titles.add("园长");	//8
//			titles.add("地址");	//9
//			titles.add("联系电话");	//10
//			titles.add("邮箱");	//11
//			titles.add("官方网址");	//12
//			titles.add("简介");	//13
//			titles.add("其他备注");	//14
//			titles.add("预留字段一");	//15
//			titles.add("预留字段二");	//16
//			titles.add("预留字段三");	//17
//			dataMap.put("titles", titles);
//			List<PageData> varOList = orgService.listAll(pd);
//			List<PageData> varList = new ArrayList<PageData>();
//			for(int i=0;i<varOList.size();i++){
//				PageData vpd = new PageData();
//				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
//				vpd.put("var2", varOList.get(i).getString("CODE"));	//2
//				vpd.put("var3", varOList.get(i).getString("PCODE"));	//3
//				vpd.put("var4", varOList.get(i).get("CLASS").toString());	//4
//				vpd.put("var5", varOList.get(i).get("ORDERS").toString());	//5
//				vpd.put("var6", varOList.get(i).getString("CREATEDATE"));	//6
//				vpd.put("var7", varOList.get(i).get("PERSONNUM").toString());	//7
//				vpd.put("var8", varOList.get(i).getString("LEADER"));	//8
//				vpd.put("var9", varOList.get(i).getString("ADDRESS"));	//9
//				vpd.put("var10", varOList.get(i).getString("PHONE"));	//10
//				vpd.put("var11", varOList.get(i).getString("EMAIL"));	//11
//				vpd.put("var12", varOList.get(i).getString("URL"));	//12
//				vpd.put("var13", varOList.get(i).getString("INTRO"));	//13
//				vpd.put("var14", varOList.get(i).getString("REMARK"));	//14
//				vpd.put("var15", varOList.get(i).getString("DEFAULTONE"));	//15
//				vpd.put("var16", varOList.get(i).getString("DEFAULTTWO"));	//16
//				vpd.put("var17", varOList.get(i).getString("DEFAULTTHREE"));	//17
//				varList.add(vpd);
//			}
//			dataMap.put("varList", varList);
//			ObjectExcelView erv = new ObjectExcelView();
//			mv = new ModelAndView(erv,dataMap);
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//		return mv;
//	}
}
