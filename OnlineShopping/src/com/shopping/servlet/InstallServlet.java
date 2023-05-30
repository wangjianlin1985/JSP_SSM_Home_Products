package com.shopping.servlet;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.contant.BasicContant;
import com.shopping.model.PageBean;
import com.shopping.model.Install;
import com.shopping.model.OrderDetial;
import com.shopping.service.AftersalesService;
import com.shopping.service.InstallService;
import com.shopping.service.OrderService;
import com.shopping.vo.AftersalesVO;
import com.shopping.vo.InstallVO;
import com.shopping.vo.OrderVO;

@Controller
public class InstallServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired 
    private InstallService installService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AftersalesService aftersalesService;
     
	@RequestMapping("/insertInstall")
	public ModelAndView insertInstall(String userid,String id,String goodsid) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Install install = new Install();
    	install.setGoodsid(Integer.parseInt(goodsid));
    	install.setUserid(Integer.parseInt(userid));
    	install.setCreater(BasicContant.USER);
    	install.setCreatedate(new Date());
    	install.setStatus(1);
    	install.setOrderid(Integer.parseInt(id));
    	int re = installService.insertInstall(install);
    	if(re !=0){
    		OrderDetial orders1 = new OrderDetial();
    		orders1.setId(Integer.parseInt(id));
    		OrderDetial orders = orderService.selectorderbyid(orders1);
    		orders.setStatus(6);
    		int count = orderService.roleupdateorder(orders);
    		if(count != 0){
    			int current = 1;
    			OrderVO orderVO = new OrderVO();
	    		orderVO.setUserid(Integer.parseInt(userid));
	    		PageBean<OrderVO> orderslist = orderService.orderlist(current,orderVO);
	    		ma.addObject("orderlist", orderslist);
	    		ma.addObject("installsuccess", SUCCESS);
				ma.addObject(RESULT, SUCCESS);
		        ma.setViewName("frontjsp/orderlist");
    		}
    	}
		return ma;	
    }
    
	@RequestMapping("/back/roleinstalllist")
	public ModelAndView roleinstalllist(Model model,String currentPage,String status) throws Exception {
    	ModelAndView ma = new ModelAndView();
		InstallVO installVO = new InstallVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(status == null || status.equals("")){
		}else{
			installVO.setStatus(Integer.parseInt(status));
			ma.addObject("status", status);
		}
		PageBean<InstallVO> roleinstalllist = installService.roleinstalllist(current, installVO);
		ma.addObject("roleinstalllist", roleinstalllist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/roleinstalllist");
		return ma;
    }
	
	@RequestMapping("/back/roleupdateinstall")
    public ModelAndView roleupdateinstall(Model model,String orderid,String goodsid,String userid) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	InstallVO installVO = new InstallVO();
    	installVO.setGoodsid(Integer.parseInt(goodsid));
    	installVO.setUserid(Integer.parseInt(userid));
    	installVO.setOrderid(Integer.parseInt(orderid));
    	installVO.setStatus(2);
    	int current = 1;
    	int count = installService.roleupdateinstall(installVO);
    	if(count != 0){
    		OrderDetial orders1 = new OrderDetial();
    		orders1.setId(Integer.parseInt(orderid));
    		OrderDetial orders = orderService.selectorderbyid(orders1);
    		AftersalesVO  aftersalesVO = new AftersalesVO();
    		aftersalesVO.setGoodsid(Integer.parseInt(goodsid));
    		aftersalesVO.setUserid(Integer.parseInt(userid));
    		aftersalesVO.setOrderid(Integer.parseInt(orderid));
    		int aftersalescount = aftersalesService.selectaftersalescountss(aftersalesVO);
    		if(aftersalescount !=0){
    			orders.setStatus(8);
    		}else{
    			orders.setStatus(7);
    		}
    		int count1 = orderService.roleupdateorder(orders);
    		if(count1 !=0){
    			InstallVO installVO1 = new InstallVO();
    			PageBean<InstallVO> roleinstalllist = installService.roleinstalllist(current, installVO1);
    			ma.addObject("roleinstalllist", roleinstalllist);
    			ma.addObject(RESULT, SUCCESS);
        		ma.addObject("updateinstall", SUCCESS);
    			ma.setViewName("backjsp/roleinstalllist");
    		}
    		
		}
    	return ma;
    }
}
