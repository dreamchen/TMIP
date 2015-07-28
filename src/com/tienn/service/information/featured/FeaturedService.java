package com.tienn.service.information.featured;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("featuredService")
public class FeaturedService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    /*
    *列表
    */
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("FeaturedMapper.featuredlistPage", page);
    }

    /*
    * 通过id获取数据
    */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("FeaturedMapper.findById", pd);
    }

    /*
    * 保存
    */
    public void save(PageData pd) throws Exception {
        dao.save("FeaturedMapper.save", pd);
    }

    /*
    * 修改
    */
    public void edit(PageData pd) throws Exception {
        dao.update("FeaturedMapper.edit", pd);
    }

    /*
    * 删除
    */
    public void delete(PageData pd) throws Exception {
        dao.update("FeaturedMapper.delete", pd);
    }
}
