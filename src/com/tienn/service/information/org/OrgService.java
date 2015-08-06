package com.tienn.service.information.org;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import net.sf.ehcache.hibernate.management.impl.BeanUtils;

import org.codehaus.jackson.map.util.BeanUtil;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.Util;
import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.entity.system.Menu;
import com.tienn.util.PageData;


@Service("orgService")
public class OrgService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("OrgMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("OrgMapper.edit", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrgMapper.findById", pd);
	}
	
	//查询总数
	public PageData findCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrgMapper.findCount", pd);
	}
	
	//查询某编码
	public PageData findBmCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrgMapper.findBmCount", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrgMapper.orglistPage", page);
		
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("OrgMapper.delete", pd);
		
	}

	/*
	 * 获取机构树
	 */
	public List<PageData> selectOrgTree(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("OrgMapper.selectOrgTree", pd);
	}
	
	/*
	 * 查询是否有子节点
	 */
	public int hasSonId(Object id) throws Exception{
		return (Integer)dao.findForObject("OrgMapper.hasSonId", id.toString());
	}
	
	/*
	 * 查询此节点下的子节点
	 */
	public List<PageData> selectSonOrgID(Object P_ID) throws Exception{
		return (List<PageData>)dao.findForList("OrgMapper.selectSonOrgID", P_ID.toString());
	}
	
	/*
	 * 根据用户部门id查询上一级机构信息
	 */
	public PageData findPreORGIDByID(String ORG_ID) throws Exception{
		return (PageData)dao.findForObject("OrgMapper.findPreORGIDByID", ORG_ID);
	}
	/**
	 * 查询
	 * @param DEPT
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllParentOrg(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("OrgMapper.listAllParentOrg", pd);
    }
	public List<PageData> listSubOrgByParentId(String pid) throws Exception {
        return (List<PageData>) dao.findForList("OrgMapper.listSubOrgByParentId", pid);
    }
	
	/**
	 * 查询班级信息根据所在园区
	 * @param orgID
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listClassByOrgId(String ORG_ID) throws Exception {
        return (List<PageData>) dao.findForList("OrgMapper.listClassByOrgId", ORG_ID);
    }
	
	/**
	 * 根据用户部门id查询所在园区机构信息
	 * @param ORG_ID
	 * @return
	 * @throws Exception
	 */
	List<PageData> szdList;
    public List<PageData> takeOrgTreeByORGID(PageData pdPar) throws Exception{
		szdList = new ArrayList<PageData>();
		//根据用户部门id查询上一级OrgID
		PageData pd = this.findPreORGIDByID(pdPar.getString("ORG_ID"));
		//判断上一级机构P_ID是否是0（根节点）
        if (null!=pd&&pd.getString("P_ID").equals("0")) {//是则停止递归向上查询，此用户为总园人员
        	//将总园区加入集合
        	pd.put("open", true);
        	szdList.add(pd);
        	//如果是总园人员则把pd的ORG_ID作为参数传入（总园P_ID也就是0），查询所有机构信息；
        	this.getOrgTree(pd.getString("ORG_ID"));	//	逆序
		}else {//否则继续查询上一级部门信息 ,此用户为分园人员
			//分园人员则把方法中参数ORG_ID作为参数传入(总园下一级机构ID)，查询下一级机构的全部部门信息
			//递归查询总园区下一分级
			
			//查询用户所在的部门机构信息
			pdPar = this.findById(pdPar);
			pdPar = getFristSonID(pdPar);
			
			//添加至集合
			pdPar.put("open", true);
			szdList.add(pdPar);
			this.getOrgTree(pdPar.getString("ORG_ID"));	//	逆序
		}
        Collections.reverse(szdList);
        return szdList;
	}
    
    /**
     * 查询总园区的下一分级ID根据所在机构部门
     * @return
     * @throws Exception 
     */
    public PageData getFristSonID(PageData pdPar) throws Exception{
    	pdPar = this.findPreORGIDByID(pdPar.getString("ORG_ID"));
    	if (null!=pdPar&&pdPar.getString("P_ID").equals("0")) {
    		getFristSonID(pdPar);
		}
    	return pdPar;
    }
    
  //递归
    List<PageData> pdps;
  	public void getOrgTree(String ORG_ID) throws Exception {
  		pdps = this.listSubOrgByParentId(ORG_ID);

  		if (pdps.size()!=0) {
			for (PageData pdp : pdps) {
				if (!szdList.contains(pdp)) {
					pdp.put("open", true);
					szdList.add(pdp);
				}
			}
			for (PageData pdp : pdps) {
				String PARENT_IDs = pdp.getString("ORG_ID");
  				this.getOrgTree(PARENT_IDs);
			}
		}
  	}
}

