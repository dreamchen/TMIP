package com.tienn.controller.system.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tienn.controller.base.BaseController;
import com.tienn.entity.Page;
import com.tienn.entity.system.Role;
import com.tienn.entity.system.User;
import com.tienn.service.information.org.OrgService;
import com.tienn.service.system.dictionaries.DictionariesService;
import com.tienn.service.system.menu.MenuService;
import com.tienn.service.system.role.RoleService;
import com.tienn.service.system.user.UserService;
import com.tienn.util.AppUtil;
import com.tienn.util.Const;
import com.tienn.util.FileDownload;
import com.tienn.util.FileUpload;
import com.tienn.util.GetPinyin;
import com.tienn.util.Jurisdiction;
import com.tienn.util.ObjectExcelRead;
import com.tienn.util.ObjectExcelView;
import com.tienn.util.PageData;
import com.tienn.util.PathUtil;
import com.tienn.util.Tools;

/**
 * 类名称：UserController
 *
 * @author Erlei Chen
 * @date 2015年7月28日
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "roleService")
    private RoleService roleService;
    @Resource(name = "menuService")
    private MenuService menuService;
    @Resource(name = "orgService")
    private OrgService orgService;
    @Resource(name = "dictionariesService")
    private DictionariesService dictionariesService;


    /**
     * 保存用户
     */
    @RequestMapping(value = "/saveU")
    public ModelAndView saveU(PrintWriter out) throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        pd.put("USER_ID", this.get32UUID());    //ID
        pd.put("RIGHTS", "");                    //权限
        pd.put("LAST_LOGIN", "");                //最后登录时间
        pd.put("IP", "");                        //IP
        pd.put("STATUS", "0");                    //状态
        pd.put("SKIN", "default");                //默认皮肤

        pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());

        if (null == userService.findByUId(pd)) {
            if (Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
                userService.saveU(pd);
            } //判断新增权限
            mv.addObject("msg", "success");
        } else {
            mv.addObject("msg", "failed");
        }
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 判断用户名是否存在
     */
    @RequestMapping(value = "/hasU")
    @ResponseBody
    public Object hasU() {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            if (userService.findByUId(pd) != null) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    /**
     * 判断邮箱是否存在
     */
    @RequestMapping(value = "/hasE")
    @ResponseBody
    public Object hasE() {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();

            if (userService.findByUE(pd) != null) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    /**
     * 判断编码是否存在
     */
    @RequestMapping(value = "/hasN")
    @ResponseBody
    public Object hasN() {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            if (userService.findByUN(pd) != null) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    /**
     * 修改用户
     */
    @RequestMapping(value = "/editU")
    public ModelAndView editU() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        if (pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))) {
            pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());
        }
        if (Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            userService.editU(pd);
        }
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 去修改用户页面
     */
    @RequestMapping(value = "/goEditU")
    public ModelAndView goEditU() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        //顶部修改个人资料
        String fx = pd.getString("fx");

        //System.out.println(fx);

        if ("head".equals(fx)) {
            mv.addObject("fx", "head");
        } else {
            mv.addObject("fx", "user");
        }

        List<Role> roleList = roleService.listAllERRoles();            //列出所有二级角色
        pd = userService.findByUiId(pd);                            //根据ID读取
        
        pd.put("P_BM", "GW");//查询岗位
        List<PageData> dictList = dictionariesService.findDictListByBM(pd);
        
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        String userDept = user.getDEPT();
        pd.put("ORG_ID", userDept);
       
        List<PageData> szdList = orgService.takeOrgTreeByORGID(pd);
        JSONArray arr = JSONArray.fromObject(szdList);
        String json = arr.toString();
        json = json.replaceAll("ORG_ID", "id").replaceAll("NAME", "name").replaceAll("P_ID", "pId");
        System.out.println(json);
        mv.addObject("zTreeNodes",json);
        
        mv.setViewName("system/user/user_edit");
        mv.addObject("msg", "editU");
        mv.addObject("pd", pd);
        mv.addObject("roleList", roleList);
        mv.addObject("dictList", dictList);
        return mv;
    }

    /**
     * 去新增用户页面
     */
    @RequestMapping(value = "/goAddU")
    public ModelAndView goAddU() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<Role> roleList;

        roleList = roleService.listAllERRoles();            //列出所有二级角色
        
        pd.put("P_BM", "GW");//查询岗位
        List<PageData> dictList = dictionariesService.findDictListByBM(pd);

        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        String userDept = user.getDEPT();
        pd.put("ORG_ID", userDept);
       
        List<PageData> szdList = orgService.takeOrgTreeByORGID(pd);
        JSONArray arr = JSONArray.fromObject(szdList);
        String json = arr.toString();
        json = json.replaceAll("ORG_ID", "id").replaceAll("NAME", "name").replaceAll("P_ID", "pId");
        System.out.println(json);
        mv.addObject("zTreeNodes",json);
        
        mv.setViewName("system/user/user_edit");
        mv.addObject("msg", "saveU");
        mv.addObject("pd", pd);
        mv.addObject("roleList", roleList);
        mv.addObject("dictList", dictList);
        return mv;
    }

    /**
     * 显示用户列表(用户组)
     */
    List<String> orgs;
    @RequestMapping(value = "/listUsers")
    public ModelAndView listUsers(Page page) throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        String USERNAME = pd.getString("USERNAME");

        if (null != USERNAME && !"".equals(USERNAME)) {
            USERNAME = USERNAME.trim();
            pd.put("USERNAME", USERNAME);
        }
        
        String ORG_ID = pd.getString("DEPT");
        if (null != ORG_ID && !"".equals(ORG_ID)) {
        	ORG_ID = ORG_ID.trim();
        	//递归查询所有子节点id
        	orgs=new ArrayList<String>();
        	orgs.add(ORG_ID);
        	takeAllSonId(ORG_ID);
        	pd.put("DEPT", orgs);
        }

        String lastLoginStart = pd.getString("lastLoginStart");
        String lastLoginEnd = pd.getString("lastLoginEnd");

        if (lastLoginStart != null && !"".equals(lastLoginStart)) {
            lastLoginStart = lastLoginStart + " 00:00:00";
            pd.put("lastLoginStart", lastLoginStart);
        }
        if (lastLoginEnd != null && !"".equals(lastLoginEnd)) {
            lastLoginEnd = lastLoginEnd + " 00:00:00";
            pd.put("lastLoginEnd", lastLoginEnd);
        }

        page.setPd(pd);
//        List<PageData> varList = orgService.dictlistPage(page);
        List<PageData> userList = userService.listPdPageUser(page);            //列出用户列表
        //递归查询所有用户
        
        
        List<Role> roleList = roleService.listAllERRoles();                        //列出所有二级角色

        mv.setViewName("system/user/user_list");
        mv.addObject("userList", userList);
        mv.addObject("roleList", roleList);
        mv.addObject("pd", pd);
        mv.addObject(Const.SESSION_QX, this.getHC());    //按钮权限
        return mv;
    }
    
    /**
     * 递归查询节点下的所有子节点
     * @param ORG_ID
     * @throws Exception
     */
    public void takeAllSonId(String ORG_ID) throws Exception{
    	List<PageData> listSonId = orgService.selectSonOrgID(ORG_ID);
    	for (PageData pdOrgId : listSonId) {
    		orgs.add(pdOrgId.getString("ORG_ID"));
    		takeAllSonId(pdOrgId.getString("ORG_ID"));
		}
    }
    
//    /**
//     * 递归查询当前节点的根节点
//     * @param ORG_ID
//     * @throws Exception
//     */
//    public void selectRootByID(String ORG_ID) throws Exception{
//    	List<PageData> listSonId = orgService.selectRootByID(ORG_ID);
//    	for (PageData pdOrgId : listSonId) {
//    		orgs.add(pdOrgId.getString("ORG_ID"));
//    		takeAllSonId(pdOrgId.getString("ORG_ID"));
//		}
//    }
	
	public List<PageData> createUserTree(List<PageData> userList,String deptid) throws Exception{
		List<PageData> jsonList = new ArrayList<PageData>();
		Page jsonData =new Page();
		deptid = null!=deptid?deptid:"0"; //避免deptid为null
		for (PageData userInf : userList) {
//			if(deptid.equals(userInf.get("DEPT"))){
				jsonData =new Page();
				List<PageData> listSonId = orgService.selectSonOrgID(userInf.get("DEPT"));
				for (PageData orgId : listSonId) {
					PageData pd =new PageData();
					pd.put("DEPT", orgId);
					jsonData.setPd(pd);
					List<PageData> listU =userService.listPdPageUser(jsonData);
					for (PageData u : listU) {
						jsonList.add(jsonData.getPd());
						createUserTree(listU, orgId.getString("ORG_ID"));
					}
//				}
			}
		}
		return jsonList;
	}


    /**
     * 显示用户列表(tab方式)
     */
    @RequestMapping(value = "/listtabUsers")
    public ModelAndView listtabUsers(Page page) throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> userList = userService.listAllUser(pd);            //列出用户列表
        mv.setViewName("system/user/user_tb_list");
        mv.addObject("userList", userList);
        mv.addObject("pd", pd);
        mv.addObject(Const.SESSION_QX, this.getHC());    //按钮权限
        return mv;
    }

    /**
     * 删除用户
     */
    @RequestMapping(value = "/deleteU")
    public void deleteU(PrintWriter out) {
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            if (Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
                userService.deleteU(pd);
            }
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }

    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteAllU")
    @ResponseBody
    public Object deleteAllU() {
        PageData pd = new PageData();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            pd = this.getPageData();
            List<PageData> pdList = new ArrayList<PageData>();
            String USER_IDS = pd.getString("USER_IDS");

            if (null != USER_IDS && !"".equals(USER_IDS)) {
                String ArrayUSER_IDS[] = USER_IDS.split(",");
                if (Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
                    userService.deleteAllU(ArrayUSER_IDS);
                }
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
    //===================================================================================================


    /**
     * zTree多级别树页面
     */
    @RequestMapping(value = "/userTree")
    public ModelAndView userTree() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        
        Subject currentUser = SecurityUtils.getSubject();
        Session session = currentUser.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        String userDept = user.getDEPT();
        pd.put("ORG_ID", userDept);
       
        List<PageData> szdList = orgService.takeOrgTreeByORGID(pd);
       /* //根据所有园区查找教育类的，并且根据ORG_ID查询所属班级信息
        List<PageData> resultList =new ArrayList<PageData>();
        List<PageData> listClass;
        for (PageData pdata : szdList) {
			if (null!=pdata.getString("DEFAULTONE")&&pdata.getString("DEFAULTONE").equals("7165f8defb8b4077bd9fd5e68a53b4e4")) {
				resultList.add(pdata);
				//以上为教育类的机构数，也就是只显示园区信息，操作半截维护页面
				
				//以下为增加班级至树型结构，操作儿童列表维护页面
				listClass = orgService.listClassByOrgId(pdata.getString("ORG_ID"));
				for (PageData pdClass : listClass) {
					resultList.add(pdClass);
				}
			}
		}
        JSONArray arr = JSONArray.fromObject(resultList);*/
        JSONArray arr = JSONArray.fromObject(szdList);
        String json = arr.toString();
        json = json.replaceAll("ORG_ID", "id").replaceAll("NAME", "name").replaceAll("P_ID", "pId");
        System.out.println(json);
        json = json.replaceAll("CLASSINFO_ID", "id").replaceAll("NAME", "name").replaceAll("KINDERGARTEN_ID", "pId");//将班级信息加入至机构树
        mv.addObject("zTreeNodes",json);
        System.out.println(json);
        mv.setViewName("system/user/userTree");
//        mv.setViewName("system/tools/selectTree");
        mv.addObject("pd", pd);
        return mv;
    }
    
    /*
     * 导出用户信息到EXCEL
     * @return
     */
    @RequestMapping(value = "/excel")
    public ModelAndView exportExcel() {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            if (Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
                //检索条件===
                String USERNAME = pd.getString("USERNAME");
                if (null != USERNAME && !"".equals(USERNAME)) {
                    USERNAME = USERNAME.trim();
                    pd.put("USERNAME", USERNAME);
                }
                String lastLoginStart = pd.getString("lastLoginStart");
                String lastLoginEnd = pd.getString("lastLoginEnd");
                if (lastLoginStart != null && !"".equals(lastLoginStart)) {
                    lastLoginStart = lastLoginStart + " 00:00:00";
                    pd.put("lastLoginStart", lastLoginStart);
                }
                if (lastLoginEnd != null && !"".equals(lastLoginEnd)) {
                    lastLoginEnd = lastLoginEnd + " 00:00:00";
                    pd.put("lastLoginEnd", lastLoginEnd);
                }
                //检索条件===

                Map<String, Object> dataMap = new HashMap<String, Object>();
                List<String> titles = new ArrayList<String>();

                titles.add("用户名");        //1
                titles.add("编号");        //2
                titles.add("姓名");            //3
                titles.add("职位");            //4
                titles.add("手机");            //5
                titles.add("邮箱");            //6
                titles.add("最近登录");        //7
                titles.add("上次登录IP");    //8

                dataMap.put("titles", titles);

                List<PageData> userList = userService.listAllUser(pd);
                List<PageData> varList = new ArrayList<PageData>();
                for (int i = 0; i < userList.size(); i++) {
                    PageData vpd = new PageData();
                    vpd.put("var1", userList.get(i).getString("USERNAME"));        //1
                    vpd.put("var2", userList.get(i).getString("NUMBER"));        //2
                    vpd.put("var3", userList.get(i).getString("NAME"));            //3
                    vpd.put("var4", userList.get(i).getString("ROLE_NAME"));    //4
                    vpd.put("var5", userList.get(i).getString("PHONE"));        //5
                    vpd.put("var6", userList.get(i).getString("EMAIL"));        //6
                    vpd.put("var7", userList.get(i).getString("LAST_LOGIN"));    //7
                    vpd.put("var8", userList.get(i).getString("IP"));            //8
                    varList.add(vpd);
                }
                dataMap.put("varList", varList);
                ObjectExcelView erv = new ObjectExcelView();                    //执行excel操作
                mv = new ModelAndView(erv, dataMap);
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 打开上传EXCEL页面
     */
    @RequestMapping(value = "/goUploadExcel")
    public ModelAndView goUploadExcel() throws Exception {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/user/uploadexcel");
        return mv;
    }

    /**
     * 下载模版
     */
    @RequestMapping(value = "/downExcel")
    public void downExcel(HttpServletResponse response) throws Exception {

        FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");

    }

    /**
     * 从EXCEL导入到数据库
     */
    @RequestMapping(value = "/readExcel")
    public ModelAndView readExcel(
            @RequestParam(value = "excel", required = false) MultipartFile file
    ) throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;                                //文件上传路径
            String fileName = FileUpload.fileUp(file, filePath, "userexcel");                            //执行上传

            List<PageData> listPd = (List) ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);    //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet

			/*存入数据库操作======================================*/
            pd.put("RIGHTS", "");                    //权限
            pd.put("LAST_LOGIN", "");                //最后登录时间
            pd.put("IP", "");                        //IP
            pd.put("STATUS", "0");                    //状态
            pd.put("SKIN", "default");                //默认皮肤

            List<Role> roleList = roleService.listAllERRoles();    //列出所有二级角色

            pd.put("ROLE_ID", roleList.get(0).getROLE_ID());    //设置角色ID为随便第一个
            /**
             * var0 :编号
             * var1 :姓名
             * var2 :手机
             * var3 :邮箱
             * var4 :备注
             */
            for (int i = 0; i < listPd.size(); i++) {
                pd.put("USER_ID", this.get32UUID());                                        //ID
                pd.put("NAME", listPd.get(i).getString("var1"));                            //姓名

                String USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"));    //根据姓名汉字生成全拼
                pd.put("USERNAME", USERNAME);
                if (userService.findByUId(pd) != null) {                                        //判断用户名是否重复
                    USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1")) + Tools.getRandomNum();
                    pd.put("USERNAME", USERNAME);
                }
                pd.put("BZ", listPd.get(i).getString("var4"));                                //备注
                if (Tools.checkEmail(listPd.get(i).getString("var3"))) {                        //邮箱格式不对就跳过
                    pd.put("EMAIL", listPd.get(i).getString("var3"));
                    if (userService.findByUE(pd) != null) {                                    //邮箱已存在就跳过
                        continue;
                    }
                } else {
                    continue;
                }

                pd.put("NUMBER", listPd.get(i).getString("var0"));                            //编号已存在就跳过
                pd.put("PHONE", listPd.get(i).getString("var2"));                            //手机号

                pd.put("PASSWORD", new SimpleHash("SHA-1", USERNAME, "123").toString());    //默认密码123
                if (userService.findByUN(pd) != null) {
                    continue;
                }
                userService.saveU(pd);
            }
            /*存入数据库操作======================================*/

            mv.addObject("msg", "success");
        }

        mv.setViewName("save_result");
        return mv;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }


    /* ===============================权限================================== */
    public Map<String, String> getHC() {
        Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
        Session session = currentUser.getSession();
        return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
    }
    /* ===============================权限================================== */
}
