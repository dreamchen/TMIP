package com.tienn.service.information.notice;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("noticeService")
public class NoticeService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /*
    *列表
    */
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("NoticeMapper.noticelistPage", page);
    }

    /*
    * 通过id获取数据
    */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("NoticeMapper.findById", pd);
    }

    /*
    * 保存
    */
    public void save(PageData pd) throws Exception {
        dao.save("NoticeMapper.save", pd);
    }

    /*
    * 修改
    */
    public void edit(PageData pd) throws Exception {
        dao.update("NoticeMapper.edit", pd);
    }

    /*
    * 删除
    */
    public void delete(PageData pd) throws Exception {
        dao.update("NoticeMapper.delete", pd);
    }
}
