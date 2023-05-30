package com.shopping.mapper;

import java.util.List;
import java.util.Map;

import com.shopping.model.Active;
import com.shopping.vo.ActiveVO;

public interface ActiveMapper {
	public List<ActiveVO> activelist() throws Exception;
	public int addactives(Active active)  throws Exception;
	public int deleteactive(Active active)  throws Exception;
	public List<ActiveVO> roleactivelist(Map<String, Object> map) throws Exception;
	public int roleactivecount(ActiveVO activeVO) throws Exception;
}
