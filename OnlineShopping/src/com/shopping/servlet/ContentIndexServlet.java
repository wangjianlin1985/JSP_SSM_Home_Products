package com.shopping.servlet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.Goods;
import com.shopping.service.ActiveService;
import com.shopping.service.GoodsService;
import com.shopping.vo.ActiveVO;

@Controller
public class ContentIndexServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private ActiveService activeService;
    
    @RequestMapping("/contentindex")
	public ModelAndView contentindex(Model model) throws Exception {
    	List<ActiveVO> activelist = activeService.activelist();
		List<Goods> goodslist = goodsService.getTuiGoods();
		ModelAndView me = new ModelAndView();
		me.addObject("goodslist", goodslist);
		me.addObject("activelist", activelist);
		me.setViewName("frontjsp/index");
		return me;
	}
    
}	
