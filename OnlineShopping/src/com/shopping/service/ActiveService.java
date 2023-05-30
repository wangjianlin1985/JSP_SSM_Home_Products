package com.shopping.service;

import java.util.List;

import com.shopping.model.Active;
import com.shopping.model.PageBean;
import com.shopping.vo.ActiveVO;

public interface ActiveService {
	public List<ActiveVO> activelist() throws Exception;
	public int addactives(Active active)  throws Exception;
	public int deleteactive(Active active)  throws Exception;
	public PageBean<ActiveVO> roleactivelist(int currentPage,ActiveVO activeVO) throws Exception;
}
