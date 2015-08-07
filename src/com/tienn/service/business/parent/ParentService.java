package com.tienn.service.business.parent;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;

@Service("parentService")
public class ParentService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/*
	 * 新增
	 */
	public void save(PageData pd) throws Exception {
		dao.save("ParentMapper.save", pd);
	}

	/*
	 * 删除
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("ParentMapper.delete", pd);
	}

	/*
	 * 修改
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("ParentMapper.edit", pd);
	}

	/*
	 * 列表
	 */
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ParentMapper.datalistPage",
				page);
	}

	/*
	 * 列表(全部)
	 */
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ParentMapper.listAll", pd);
	}

	/*
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ParentMapper.findById", pd);
	}

	/*
	 * 批量删除
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("ParentMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/*
	 * 根据学生的id找到所有的监护人
	 */
	public List<PageData> listByStudentId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ParentMapper.findByStudentId", pd);
	}

}
