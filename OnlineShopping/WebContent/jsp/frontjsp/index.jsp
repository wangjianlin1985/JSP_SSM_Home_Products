<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/activelist.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frontcss/index.css">

</head>
  <body>
  	<jsp:include page ="header.jsp" />
  	<div class="container">
  		
  		<!-- 推荐商品 -->
		<div class="tuigoods">
			<h3>推荐商品</h3>
			<hr>
			<div class="goods">
				<c:forEach items="${goodslist}" var="goods"> 
				  <div class="goodslist">
		             <dl>
		               <dt>
		                 <a href="goodsdetails?id=${goods.id }"><img src="/onlinetemp/upload/image/${goods.photourl}" width="220" height="220" border="1"/></a>
		               </dt>
		               <dd class="dd_name">${goods.name }</dd> 
		               <dd>价格:￥<span class="dd_city"> ${goods.price }</span></dd> 
		             </dl>
		          </div>
				</c:forEach>
			</div>
			<div class="activelist">
				<h3>推广信息</h3>
				<div class="actives">
				<c:forEach items="${activelist}" var="active">
					<div class="panel panel-primary actives">
						<div class="panel-heading">${active.theme }</div>
							<div class="panel-body">
								<p>${active.message }</p>
							</div>
						<div class="panel-footer">发布于：${active.createdate }</div>
					</div>
				</c:forEach>
				</div>
			</div>	
			<div class="clearfix"></div>
		</div>

		<div class="footer"></div>
	</div>
  </body>
</html>