<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>模块列表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="view"><a href="#" onclick="formSubmit('toview','_self');this.blur();">查看</a></li>
	<li id="new"><a href="#" onclick="formSubmit('tocreate','_self');this.blur();">新增</a></li>
	<li id="update"><a href="#" onclick="formSubmit('toupdate','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('delete','_self');this.blur();">删除</a></li>
	<li id="new"><a href="#" onclick="formSubmit('start','_self');this.blur();">启用</a></li>
	<li id="new"><a href="#" onclick="formSubmit('stop','_self');this.blur();">停用</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
  	模块列表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('moduleId',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">模块名称</td>
		<td class="tableHeader">上级模块</td>
		<td class="tableHeader">模块信息</td>
		<td class="tableHeader">备注信息</td>
		<td class="tableHeader">状态</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${dataList}" var="d" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="moduleId" value="${d.moduleId}"/></td>
		<td>${status.index+1}</td>
		<td>${d.name}</td>
		<td>${d.parentModule.name}</td>
		<td>
			<c:if test="${d.ctype==1 }">主菜单</c:if>
			<c:if test="${d.ctype==2 }">左侧菜单</c:if>
			<c:if test="${d.ctype==3 }">按钮</c:if>
			
		</td>
		<td>${d.remark }</td>
		<td>
			<c:if test="${d.state==1}"><a href="stop?moduleId=${d.moduleId}"><font color="green">启用</font></a></c:if>
			<c:if test="${d.state==0}"><a href="start?moduleId=${d.moduleId}"><font color="red">停用</font></a></c:if>
		</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

