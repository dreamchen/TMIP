package com.tienn.service.information.org;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
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
}

