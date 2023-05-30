package com.shopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.ActiveMapper;
import com.shopping.model.Active;
import com.shopping.model.PageBean;
import com.shopping.service.ActiveService;
import com.shopping.vo.ActiveVO;

@Service
public class ActiveServiceImpl implements ActiveService{

	@Autowired
	private ActiveMapper activeMapper;

	@Override
	public List<ActiveVO> activelist() throws Exception {
		return activeMapper.activelist();
	}

	@Override
	public int addactives(Active active) throws Exception {
		return activeMapper.addactives(active);
	}

	@Override
	public int deleteactive(Active active) throws Exception {
		return activeMapper.deleteactive(active);
	}

	@Override
	public PageBean<ActiveVO> roleactivelist(int currentPage, ActiveVO activeVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<ActiveVO> pageBean = new PageBean<ActiveVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = activeMapper.roleactivecount(activeVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        //封装每页显示的数据
        List<ActiveVO> lists = activeMapper.roleactivelist(map);
        pageBean.setList(lists);
        return pageBean;
	}

}
