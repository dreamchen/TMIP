package com.tienn.service.toolService;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tienn.service.system.dictionaries.DictionariesService;
import com.tienn.util.PageData;

/**
 * 
 * 
 * 这个类的作用是从页面获取传过来的参数，然后到字典里面查找对应的记录，然后添加到mv里面，将结果带回到页面进行展示
 * 
 * @author liang.app
 *
 */
@Service(value="addParameterToMv")
public class AddParameterToMv {
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	
	/**
	 * 这个方法
	 * 第一步先将页面传过来的参数添加到mv里面，即传过来的参数键值对保存，
	 * 第二步把传过来的value到字典表中进行查询，然后value当做key，查询结果当做value，存入mv中，供页面使用
	 * 第三步，将整个键值对返回到页面
	 * @param request
	 * @param mv
	 * @throws Exception
	 */
	public void findResultFromDicAndAddParameterToMv(HttpServletRequest request, ModelAndView mv)
			throws Exception {
		List<PageData> list;

		Enumeration<String> names = request.getParameterNames();

		while (names.hasMoreElements()) {
			String key = names.nextElement();
			String value = new String(request.getParameter(key).getBytes("ISO-8859-1"), "UTF-8");
			//这里先将所有的参数键值对都放在mv里面，供页面之间传值，
			mv.addObject(key, value);
			System.out.println(key + "==>" + value);
			list = dictionariesService.findDictListByMyBM(value);
			System.out.println("==>" + list.size());
			// request.setAttribute("list", list);
			//这里将从字典里面查出来的数据让入mv，供页面使用
			if (list.size() != 0) {
				mv.addObject(value, list);
			}

		}
	}
	
	/**
	 * 这个方法是将页面发送出来的参数带到controller中，然后带入另一个页面，在页面之间互相传值
	 * @param request
	 * @param mv
	 * @throws Exception
	 */
	public void addParameterToMv(HttpServletRequest request, ModelAndView mv)throws Exception {
		List<PageData> list;

		Enumeration<String> names = request.getParameterNames();

		while (names.hasMoreElements()) {
			String key = names.nextElement();
			String value = new String(request.getParameter(key).getBytes("ISO-8859-1"), "UTF-8");
			//这里先将所有的参数键值对都放在mv里面，供页面之间传值，
			mv.addObject(key, value);
			
		}
	}
	
	
}
