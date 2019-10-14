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
    
    <title>My JSP 'comment.jsp' starting page</title>
    
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
    	<table border="1px" style="width: 1000px">
    		<tr>
    			<th colspan="4" align="center"><h1>评论列表</h1><a href="news/newsinfo">返回新闻列表</a></th>
    		</tr>
    		<tr style="background-color:gray">
    			<th>评论编号</th>
    			<th>评论内容</th>
    			<th>评论人</th>
    			<th >评论时间</th>
    		</tr>
    		<c:forEach var="list" items="${list}" varStatus="num">
    			<tr <c:if test="${num.index % 2!=1}">style="background-color:DodgerBlue"</c:if>>
    				<td>${list.id}</td>
    				<td>${list.content}</td>
    				<td>${list.author}</td>
    				<td><fmt:formatDate value="${list.createdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
    			</tr>
    			
    		</c:forEach>
    	</table>
    </div>
  </body>
</html>
