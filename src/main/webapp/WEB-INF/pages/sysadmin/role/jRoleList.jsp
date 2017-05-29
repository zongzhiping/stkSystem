<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
<li id="view"><a href="#" onclick="formSubmit('view','_self');this.blur();">查看</a></li>
<li id="new"><a href="#" onclick="formSubmit('create','_self');this.blur();">新增</a></li>
<li id="update"><a href="#" onclick="formSubmit('update','_self');this.blur();">修改</a></li>
<li id="delete"><a href="#" onclick="formSubmit('roleAction_delete','_self');this.blur();">删除</a></li>
<li id="new"><a href="#" onclick="formSubmit('roleAction_tomodule','_self');this.blur();" title="分配权限">权限</a></li>
<li id="new"><a href="#" onclick="formSubmit('toRoleModule','_self');this.blur();" title="分配权限">模块</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    角色列表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('id',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">角色名称</td>
		<td class="tableHeader">备注信息</td>
		<td class="tableHeader">排序号</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	<c:forEach items="${dataList}" var="d" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'" >
		<td><input type="checkbox" name="roleId" id="roleId" value="${d.roleId}"/></td>
		<td>${status.index+1}</td>
		<td>${d.name}</td>
		<td>${d.remarks}</a></td>
		<td>${d.orderNo}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

