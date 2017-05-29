<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>用户查看</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="window.history.go(-1)">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    用户查看
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tbody class="tableBody" >
	<tr class="odd">
		<td>用户名:</td>
		<td>${user.username}</td>
		<td>密码:</td>
		<td>${user.password}</td>
	</tr>
	<tr class="odd">
		<td>所属部门:</td>
		<td>${user.dept.deptName}</td>
		<td>姓名:</td>
		<td>${user.userInfo.name}</td>
	</tr>
	<tr class="odd">
		<td>身份证号:</td>
		<td>${user.userInfo.cardNo}</td>
		<td>上级领导:</td>
		<td>${user.userInfo.manager.name}</td>
	</tr>
	<tr class="odd">
		<td>入职时间:</td>
		<td><fmt:formatDate value="${user.userInfo.joinDate}" pattern="yyyy-MM-dd"/></td>
		<td>工资:</td>
		<td>${user.userInfo.salary}</td>
	</tr>
	<tr class="odd">
		<td>生日:</td>
		<td>
			<fmt:formatDate value="${user.userInfo.birthday}" pattern="yyyy-MM-dd"/>
		</td>
		<td>性别:</td>
		<td>${user.userInfo.gender}</td>
	</tr>
	<tr class="odd">
		<td>岗位:</td>
		<td>${user.userInfo.station}</td>
		<td>电话:</td>
		<td>${user.userInfo.telephone}</td>
	</tr>
	<tr class="odd">
		<td>用户级别:</td>
		<td>
			<c:if test="${user.userInfo.userLevel==1}">总经理</c:if>
			<c:if test="${user.userInfo.userLevel==2}">副总</c:if>
			<c:if test="${user.userInfo.userLevel==3}">部门经理</c:if>
			<c:if test="${user.userInfo.userLevel==4}">普通用户</c:if>
		</td>
		<td>排序号:</td>
		<td>${user.userInfo.orderNo}</td>
	</tr>
	<tr class="odd">
		<td>备注信息:</td>
		<td colspan="3">
			<textarea style="width:100%;height:120px" name="userInfo.remark" readonly="readonly">
			${user.userInfo.remark}
			</textarea>
		</td>
	</tr>
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

