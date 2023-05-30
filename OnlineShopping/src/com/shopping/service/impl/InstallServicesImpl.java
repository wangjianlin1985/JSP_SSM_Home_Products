package com.shopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.InstallMapper;
import com.shopping.model.PageBean;
import com.shopping.model.Install;
import com.shopping.service.InstallService;
import com.shopping.vo.InstallVO;

@Service
public class InstallServicesImpl implements InstallService{
	
	@Autowired
	private InstallMapper installMapper;

	@Override
	public int insertInstall(Install install) throws Exception {
		return installMapper.insertInstall(install);
	}

	@Override
	public PageBean<InstallVO> roleinstalllist(int currentPage, InstallVO installVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<InstallVO> pageBean = new PageBean<InstallVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = installMapper.roleinstallcount(installVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("status", installVO.getStatus());
        //封装每页显示的数据
        List<InstallVO> lists = installMapper.roleinstalllist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public int roleupdateinstall(InstallVO installVO) throws Exception {
		return installMapper.roleupdateinstall(installVO);
	}

	@Override
	public int selectinstallcountss(InstallVO installVO) throws Exception {
		return installMapper.selectinstallcountss(installVO);
	}

}
