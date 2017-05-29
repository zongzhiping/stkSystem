<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>角色查看</title>
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
    角色查看
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tbody class="tableBody" >
	<tr hidden="hidden"><td><input type="text" name="roleId" value="${role.roleId}"></td></tr>
	<tr class="odd">
		<td>角色名称</td>
		<td>${role.name}</td>
	</tr>
	<tr class="odd">
		<td>排序号</td>
		<td>${role.orderNo}</td>
	</tr>
	<tr class="odd">
		<td>创建日期</td>
		<td><fmt:formatDate value="${role.createTime}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr class="odd">
		<td>修改日期</td>
		<td><fmt:formatDate value="${role.updateTime}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr class="odd">
		<td>备注信息</td>
		<td>
		 	<textarea style="width:100%;height:120px" name="remarks" readonly="readonly">
		 		${role.remarks}
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

