package com.tienn.service.business.classinfo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;

@Service("classinfoService")
public class ClassInfoService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/*
	 * 新增
	 */
	public void save(PageData pd) throws Exception {
		dao.save("ClassInfoMapper.save", pd);
	}

	/*
	 * 删除
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("ClassInfoMapper.delete", pd);
	}

	/*
	 * 修改
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("ClassInfoMapper.edit", pd);
	}

	/*
	 * 列表
	 */
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ClassInfoMapper.datalistPage",
				page);
	}

	/*
	 * 列表(全部)
	 */
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ClassInfoMapper.listAll", pd);
	}

	/*
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ClassInfoMapper.findById", pd);
	}
	
	/*
	 * 通过id获取数据
	 */
	public List<PageData> findByKindergartenId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ClassInfoMapper.findByKindergartenId", pd);
	}

	/*
	 * 批量删除
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("ClassInfoMapper.deleteAll", ArrayDATA_IDS);
	}

}
