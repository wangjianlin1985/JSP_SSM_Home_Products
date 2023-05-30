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
<title>推广列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backcss/roleactivelist.css">
<script type="text/javascript" src="<%=basePath%>js/jQuery/jquery-3.2.1.js"></script>
</head>
<body>
		<div class="goodlist">	
			<h3>推广列表</h3>
			<c:if test="${deleteactivesuccess== 'SUCCESS' }">
				<script>
				  	BootstrapDialog.show({
	                    title : '操作提示',
	                    message : '删除推广成功'
	                });
			  	</script>
			</c:if>
			<c:if test="${!empty roleactivelist.list}">
				<div class="centeralign">
				<table class="table table-bordered userlist">
				<tr style="height:30px;">
				<td>标题</td>
				<td>添加时间</td>
				<td>操作</td>
				</tr>
				<c:forEach items="${roleactivelist.list}" var="active">
				<tr>
				  <td class="cen">${active.theme }</td>
				  <td class="cen">${active.createdate }</td>	
				  <td>
				  <a href="<%=basePath%>back/deleteactive?id=${active.id }" class="btn btn-danger">删除</a>
				  </td>
				</tr>
				</c:forEach>
				</table>
				</div>
				<div class="clearfix"></div>
				
				<div style="float:right;font-size: 16px;">
					<a href="<%=basePath%>back/roleactivelist?currentPage=${1}">首页</a>
			    <c:if test="${roleactivelist.currentPage>1 }">
			        <a href="<%=basePath%>back/roleactivelist?currentPage=${roleactivelist.currentPage-1}">上一页</a>
			    </c:if>
			    
			    <c:if test="${roleactivelist.totalPage>6 }">
			    	<c:if test="${roleactivelist.currentPage<5 }">
			    		<c:forEach begin="1" end="6" step="1" var="i">
					        <c:if test="${roleactivelist.currentPage==i }">
					            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
					        </c:if>
					        <c:if test="${roleactivelist.currentPage!=i }">
					            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}">${i}</a>
					        </c:if>
					    </c:forEach>
					    <span>...</span>
			    		<a href="<%=basePath%>back/roleactivelist?currentPage=${roleactivelist.totalPage}">${roleactivelist.totalPage}</a>
			    	</c:if>
			    	<c:if test="${roleactivelist.currentPage>=5 }">
			    		<c:if test="${roleactivelist.currentPage<roleactivelist.totalPage-3 }">
			    			<c:forEach begin="${roleactivelist.currentPage-2}" end="${roleactivelist.currentPage+3}" step="1" var="i">
						        <c:if test="${roleactivelist.currentPage==i }">
						            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${roleactivelist.currentPage!=i }">
						            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}">${i}</a>
						        </c:if>
						    </c:forEach>
						    <span>...</span>
				    		<a href="<%=basePath%>back/roleactivelist?currentPage=${roleactivelist.totalPage}">${roleactivelist.totalPage}</a>
			    		</c:if>
			    		<c:if test="${roleactivelist.currentPage>=roleactivelist.totalPage-3 }">
			    			<a href="<%=basePath%>back/roleactivelist?currentPage=${1}">1</a>
			    			<span>...</span>
			    			<c:forEach begin="${roleactivelist.totalPage-4}" end="${roleactivelist.totalPage}" step="1" var="i">
						        <c:if test="${roleactivelist.currentPage==i }">
						            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
						        </c:if>
						        <c:if test="${roleactivelist.currentPage!=i }">
						            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}">${i}</a>
						        </c:if>
						    </c:forEach>
			    		</c:if>
			    	</c:if>
			    </c:if>
			    <c:if test="${roleactivelist.totalPage<=6 }">
			    	<c:forEach begin="1" end="${roleactivelist.totalPage }" step="1" var="i">
				        <c:if test="${roleactivelist.currentPage==i }">
				            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}"><font color="#ff0000">${i}</font></a>
				        </c:if>
				        <c:if test="${roleactivelist.currentPage!=i }">
				            <a href="<%=basePath%>back/roleactivelist?currentPage=${i}">${i}</a>
				        </c:if>
				    </c:forEach>
			    </c:if>
			    
			    <c:if test="${roleactivelist.currentPage< roleactivelist.totalPage }">
			        <a href="<%=basePath%>back/roleactivelist?currentPage=${roleactivelist.currentPage+1}">下一页</a>
			    </c:if>
			    <a href="<%=basePath%>back/roleactivelist?currentPage=${roleactivelist.totalPage}">末页</a>
			    <span class='totalPages'> 共<span>${roleactivelist.totalPage }</span>页</span><span>, </span>
			    <span class='totalSize'><span>${roleactivelist.totalCount }</span>条记录 </span>
				</div>
			</c:if>
			<c:if test="${empty roleactivelist.list}">
				<h3 style="margin-top:30px;">还未有推广信息</h3>
			</c:if>
			</div>

</body>
</html>

