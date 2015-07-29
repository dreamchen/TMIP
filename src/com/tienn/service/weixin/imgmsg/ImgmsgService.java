package com.tienn.service.weixin.imgmsg;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("imgmsgService")
public class ImgmsgService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /*
    * 新增
    */
    public void save(PageData pd) throws Exception {
        dao.save("ImgmsgMapper.save", pd);
    }

    /*
    * 删除
    */
    public void delete(PageData pd) throws Exception {
        dao.delete("ImgmsgMapper.delete", pd);
    }

    /*
    * 修改
    */
    public void edit(PageData pd) throws Exception {
        dao.update("ImgmsgMapper.edit", pd);
    }

    /*
    *列表
    */
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("ImgmsgMapper.datalistPage", page);
    }

    /*
    *列表(全部)
    */
    public List<PageData> listAll(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ImgmsgMapper.listAll", pd);
    }

    /*
    * 通过id获取数据
    */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("ImgmsgMapper.findById", pd);
    }

    /*
    * 批量删除
    */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("ImgmsgMapper.deleteAll", ArrayDATA_IDS);
    }

    /*
    * 匹配关键词
    */
    public PageData findByKw(PageData pd) throws Exception {
        return (PageData) dao.findForObject("ImgmsgMapper.findByKw", pd);
    }
}

