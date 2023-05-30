<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>安装列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/goodslist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/backjs/goodslist.js"></script>
</head>
<body>
			<div class="goodlist">
			<h3>安装状态</h3>
			<form action ="<%=basePath%>back/roleinstalllist" id="forms" method="POST">
			<div class="form-horizontal checkgoods">
				<div class="form-group col-sm-6">
	                <div class="col-sm-4">
	                	<input type="hidden" value="1" name="currentPage" />
				    	<select id="status" name="status" class="form-control">
				    		<option value="">全部</option>
				    		<option value="1">未处理</option>
				    		<option value="2">已安装</option>
				    	</select>   
	                </div>
	                <div class="col-sm-2">
	                	<input type="submit" value="查询" class="btn btn-primary" />
	                </div>
		        </div>
			</div>
			</form>
			<br/><br/><br/>	
				<h3>安装详情</h3>			
					<c:if test="${updateinstall == 'SUCCESS' }">
				  	   <script>
					  	  BootstrapDialog.show({
		                      title : '操作提示',
		                      message : '商品已安装完成'
		                  });
				  	   </script>
				    </c:if>	
					<c:if test="${!empty roleinstalllist.list}">
						<table class="table table-bordered orderlist">
						<tr>
						<td>商品</td>
						<td>订单号</td>
						<td>创建时间</td>
						<td>收货人</td>
						<td>安装地址</td>
						<td>进度</td>
						<td>操作</td>
						</tr>
						<c:forEach items="${roleinstalllist.list}" var="install">
						<tr>
						  <td>
						  <div style="float:left;"><p>${install.name }&nbsp;&nbsp;${install.title }</p></div>
						  </td>
						  <td>${install.ordernum }</td>
						  <td>${install.createdate }</td>
						  <td>${install.username }</td>
						  <td>${install.address }</td>
						  <c:if test="${install.status==1 }">
						  	<td>未处理</td>
						  </c:if>
						  <c:if test="${install.status==2 }">
						  	<td>已安装</td>
						  </c:if>
						  <c:if test="${install.status==1 }">
						  	<td><a href="<%=basePath%>back/roleupdateinstall?orderid=${install.orderid }&userid=${install.userid }&goodsid=${install.goodsid}">安装完成</a></td>
						  </c:if>
						  <c:if test="${install.status==2 }">
						  	<td>已完成安装</td>
						  </c:if>
						</tr>
						</c:forEach>
						</table>
						<div class="clearfix"></div>
						<div style="float:right;font-size: 16px;">
						    <a href="<%=basePath%>back/roleinstalllist?currentPage=${1}&status=${status}">首页</a>
						    <c:if test="${roleinstalllist.currentPage>1 }">
						        <a href="<%=basePath%>back/roleinstalllist?currentPage=${roleinstalllist.currentPage-1}&status=${status}">上一页</a>
						    </c:if>
						    
						    <c:if test="${roleinstalllist.totalPage>6 }">
						    	<c:if test="${roleinstalllist.currentPage<5 }">
						    		<c:forEach begin="1" end="6" step="1" var="i">
								        <c:if test="${roleinstalllist.currentPage==i }">
								            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
								        </c:if>
								        <c:if test="${roleinstalllist.currentPage!=i }">
								            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}">${i}</a>
								        </c:if>
								    </c:forEach>
								    <span>...</span>
						    		<a href="<%=basePath%>back/roleinstalllist?currentPage=${roleinstalllist.totalPage}&status=${status}">${roleinstalllist.totalPage}</a>
						    	</c:if>
						    	<c:if test="${roleinstalllist.currentPage>=5 }">
						    		<c:if test="${roleinstalllist.currentPage<roleinstalllist.totalPage-3 }">
						    			<c:forEach begin="${roleinstalllist.currentPage-2}" end="${roleinstalllist.currentPage+3}" step="1" var="i">
									        <c:if test="${roleinstalllist.currentPage==i }">
									            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
									        </c:if>
									        <c:if test="${roleinstalllist.currentPage!=i }">
									            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}">${i}</a>
									        </c:if>
									    </c:forEach>
									    <span>...</span>
							    		<a href="<%=basePath%>back/roleinstalllist?currentPage=${roleinstalllist.totalPage}&status=${status}">${roleinstalllist.totalPage}</a>
						    		</c:if>
						    		<c:if test="${roleinstalllist.currentPage>=roleinstalllist.totalPage-3 }">
						    			<a href="<%=basePath%>back/roleinstalllist?currentPage=${1}&status=${status}">1</a>
						    			<span>...</span>
						    			<c:forEach begin="${roleinstalllist.totalPage-4}" end="${roleinstalllist.totalPage}" step="1" var="i">
									        <c:if test="${roleinstalllist.currentPage==i }">
									            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
									        </c:if>
									        <c:if test="${roleinstalllist.currentPage!=i }">
									            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}">${i}</a>
									        </c:if>
									    </c:forEach>
						    		</c:if>
						    	</c:if>
						    </c:if>
						    <c:if test="${roleinstalllist.totalPage<=6 }">
						    	<c:forEach begin="1" end="${roleinstalllist.totalPage }" step="1" var="i">
							        <c:if test="${roleinstalllist.currentPage==i }">
							            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}"><font color="#ff0000">${i}</font></a>
							        </c:if>
							        <c:if test="${roleinstalllist.currentPage!=i }">
							            <a href="<%=basePath%>back/roleinstalllist?currentPage=${i}&status=${status}">${i}</a>
							        </c:if>
							    </c:forEach>
						    </c:if>
						    
						    <c:if test="${roleinstalllist.currentPage< roleinstalllist.totalPage }">
						        <a href="<%=basePath%>back/roleinstalllist?currentPage=${roleinstalllist.currentPage+1}&status=${status}">下一页</a>
						    </c:if>
						    <a href="<%=basePath%>back/roleinstalllist?currentPage=${roleinstalllist.totalPage}&status=${status}">末页</a>
						    <span class='totalPages'> 共<span>${roleinstalllist.totalPage }</span>页</span><span>, </span>
						    <span class='totalSize'><span>${roleinstalllist.totalCount }</span>条记录 </span>
						</div>
					</c:if>
					<c:if test="${empty roleinstalllist.list}">
						<h3 style="margin-top:30px;">还未有安装请求</h3>
					</c:if>
			</div>
</body>
</html>