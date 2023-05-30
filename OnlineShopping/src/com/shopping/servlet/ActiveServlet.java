package com.shopping.servlet;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.Active;
import com.shopping.model.PageBean;
import com.shopping.service.ActiveService;
import com.shopping.vo.ActiveVO;

@Controller
public class ActiveServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired
	private ActiveService activeService;
    
    @RequestMapping("/back/roleactivelist")
	public ModelAndView roleactivelist(Model model, String currentPage) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	ActiveVO activeVO = new ActiveVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		PageBean<ActiveVO> roleactivelist = activeService.roleactivelist(current, activeVO);
		ma.addObject("roleactivelist", roleactivelist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/roleactivelist");
		return ma;
	}
    
    @RequestMapping("/back/addactive")
    public ModelAndView addactive(Model model) throws Exception {
    	ModelAndView ma = new ModelAndView();
		ma.setViewName("backjsp/addactive");
		return ma;
	}
    
    @RequestMapping("/back/addactives")
    public ModelAndView addactives(Model model,String theme,String message) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Active active = new Active();
    	active.setTheme(theme);
    	active.setMessage(message);
    	active.setCreatedate(new Date());
    	active.setCreater("ADMIN");
    	int count = activeService.addactives(active);
    	if(count!=0){
    		int current = 1;
    		ActiveVO activeVO = new ActiveVO();
    		PageBean<ActiveVO> roleactivelist = activeService.roleactivelist(current, activeVO);
    		ma.addObject("roleactivelist", roleactivelist);
    		ma.addObject("roleactivelistsuccess", SUCCESS);
            ma.setViewName("backjsp/roleactivelist");
    		return ma;
    	}else{
    		ma.addObject("roleactivelistfailure", SUCCESS);
    		ma.setViewName("backjsp/addactive");
    	}
		
		return ma;
	}
    
    
    @RequestMapping("/back/deleteactive")
    public ModelAndView deleteactive(Model model,String id) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Active active = new Active();
    	active.setId(Integer.parseInt(id));
    	int count = activeService.deleteactive(active);
    	if(count!=0){
    		int current = 1;
    		ActiveVO activeVO = new ActiveVO();
    		PageBean<ActiveVO> roleactivelist = activeService.roleactivelist(current, activeVO);
    		ma.addObject("roleactivelist", roleactivelist);
    		ma.addObject("deleteactivesuccess", SUCCESS);
            ma.setViewName("backjsp/roleactivelist");
    		return ma;
    	}
		return ma;
	}
}	
