<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>角色修改</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="saveupdate"><a href="#" onclick="formSubmit('saveUpdate','_self');this.blur();">更新</a></li>
	<li id="back"><a href="#" onclick="window.history.go(-1)">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    角色修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tbody class="tableBody" >
	<input type="text" name="roleId" id="roleId" value="${role.roleId }" hidden="hidden"/>
	<tr class="odd">
		<td>角色名称</td>
		<td><input type="text" name="name" id="name" value="${role.name }"/></td>
	</tr>
	<tr class="odd">
		<td>排序号</td>
		<td><input type="text" name="orderNo" id="orderNo" value="${role.orderNo }"/></td>
	</tr>
	<tr class="odd">
		<td>备注信息</td>
		<td><textarea style="width: 1050px; height: 345px;" name="remarks">${role.remarks }</textarea></td>
	</tr>
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html> 