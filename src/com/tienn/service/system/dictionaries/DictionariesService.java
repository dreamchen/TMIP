package com.tienn.service.system.dictionaries;

import com.tienn.dao.DaoSupport;
import com.tienn.entity.Page;
import com.tienn.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("dictionariesService")
public class DictionariesService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    //新增
    public void save(PageData pd) throws Exception {
        dao.save("DictionariesMapper.save", pd);
    }

    //修改
    public void edit(PageData pd) throws Exception {
        dao.update("DictionariesMapper.edit", pd);
    }

    //通过id获取数据
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("DictionariesMapper.findById", pd);
    }

    //查询总数
    public PageData findCount(PageData pd) throws Exception {
        return (PageData) dao.findForObject("DictionariesMapper.findCount", pd);
    }

    //查询某编码
    public PageData findBmCount(PageData pd) throws Exception {
        return (PageData) dao.findForObject("DictionariesMapper.findBmCount", pd);
    }

    //列出同一父类id下的数据
    public List<PageData> dictlistPage(Page page) throws Exception {
        return (List<PageData>) dao.findForList("DictionariesMapper.dictlistPage", page);

    }

    //删除
    public void delete(PageData pd) throws Exception {
        dao.delete("DictionariesMapper.delete", pd);

    }


}
