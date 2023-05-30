package com.shopping.service;

import com.shopping.model.PageBean;
import com.shopping.vo.InstallVO;
import com.shopping.model.Install;

public interface InstallService {
	public int insertInstall(Install install) throws Exception;
	public PageBean<InstallVO> roleinstalllist(int currentPage,InstallVO installVO) throws Exception;
	public int roleupdateinstall(InstallVO installVO) throws Exception;
	public int selectinstallcountss(InstallVO installVO) throws Exception;
}
