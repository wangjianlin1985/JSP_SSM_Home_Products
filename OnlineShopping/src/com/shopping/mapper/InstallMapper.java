package com.shopping.mapper;

import com.shopping.vo.InstallVO;

import java.util.List;
import java.util.Map;

import com.shopping.model.Install;

public interface InstallMapper {
	public int insertInstall(Install install) throws Exception;
	public int roleinstallcount(InstallVO installVO) throws Exception;
	public int selectinstallcountss(InstallVO installVO) throws Exception;
	public List<InstallVO> roleinstalllist(Map<String, Object> map) throws Exception;
	public int roleupdateinstall(InstallVO installVO) throws Exception;
}
