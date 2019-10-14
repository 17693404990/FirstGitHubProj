<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
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
    	<form action="news/adds">
    		<table border="1px" style="width: 493px;">
    			<tr>
    				<td colspan="2" style="text-align: center;  background-color:DodgerBlue;"><h2>增加评论</h2></td>
    			</tr>
    			<tr>
    				<td>评论内容</td>
    				<td><textarea style="width: 350px;" name="content"></textarea></td>
    			</tr>
    			<tr>
    				<td>评论人</td>
    				<td><input type="text" name="author"><input type="hidden" name="newsid" value="${id}"></td>
    			</tr>
    			<tr>    				
    				<td colspan="3" style="text-align: center; height: 65px"><input type="submit" value="提交">
    				<input type="button" id="back" value="返回"></td>
    			</tr>
    		</table>
    	</form>
    </div>
  </body>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/NewsAdd.js"></script>
</html>
