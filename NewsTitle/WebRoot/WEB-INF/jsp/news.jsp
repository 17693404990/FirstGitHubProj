<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


  </head>
  
  <body>
    <div align="center">
    	<form id="ProForm" method="get" action="${pageContext.request.contextPath }/news/newsinfo">
    		<input type="hidden" name="pageIndex" value="1" />
    		新闻标题&nbsp;&nbsp;<input type="text" name="title">&nbsp;&nbsp;
    		<input type="submit" value="查询">
    	</form>
    	</div>
    	<div align="center">
    	<table border="1px" style="width: 1000px">
    		<tr>
				<td colspan="6" align="center"><h1>新闻列表</h1></td>
			</tr>
			<tr style="background-color:gray">
				<th style="width: 50px">新闻编号</th>
				<th>新闻标题</th>
				<th style="width: 500px">新闻摘要</th>
				<th style="width: 100px">作者</th>
				<th style="width: 150px">创建时间</th>
				<th style="width: 180px">操作</th>
			</tr>
			<c:forEach var="lsit" items="${list}" varStatus="num">
				<tr
					<c:if test="${num.index % 2!=1}">style="background-color:DodgerBlue"</c:if>>
					<td>${lsit.id}</td>
					<td>${lsit.title}</td>
					<td>${lsit.summary}</td>
					<td>${lsit.author}</td>
					<td><fmt:formatDate value="${lsit.createdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					<td><a class="upd" href="news/comment?id=${lsit.id}" >查看评论</a>&nbsp;&nbsp;
					<a class="upd" href="news/add?id=${lsit.id}">评论</a>&nbsp;&nbsp;
					 <a href="javascript:;" onclick="del(${lsit.id})">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right"><span style="color:red"><c:if test="${tishi!=null}">${tishi}</c:if></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:page_nav(document.forms[0],1);">首页</a>|
					<a href="javascript:page_nav(document.forms[0],${currentPageNo-1});">上一页</a>|
					<a href="javascript:page_nav(document.forms[0],${currentPageNo+1 });">下一页</a>|
					<a href="javascript:page_nav(document.forms[0],${totalPageCount });">最后一页</a>|
					第${pages.currentPageNo }页/共${pages.totalPageCount}页&nbsp;&nbsp;共${totalCount }条记录
				</td>
			</tr>
    	</table>
    </div>
  </body>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/NewsDelete.js"></script>
  <script type="text/javascript">
function page_nav(frm,num){
	frm.pageIndex.value = num;
	frm.submit();
}
</script>
</html>
