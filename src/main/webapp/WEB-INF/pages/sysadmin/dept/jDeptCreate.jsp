<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>部门列表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="save"><a href="#" onclick="formSubmit('save','_self');this.blur();">保存</a></li>
	<li id="back"><a href="#" onclick="window.history.go(-1)">返回</a></li>

</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    部门新增
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >




	<!-- <thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('deptId',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">编号</td>
		<td class="tableHeader">上级</td>
		<td class="tableHeader">名称</td>
		<td class="tableHeader">状态</td>
	</tr>
	</thead> -->
	
	
	
	
	<tbody>
	<tr class="odd">
		<td>部门ID</td>
		<td><input type="text" name="deptId" id="deptId"></td>
	</tr>
	<tr>
		<td>部门名称</td>
		<td><input type="text" name="deptName" id="deptName"></td>
	</tr>
	<tr>
		<td>上级部门</td>
		<td>
			<select name="parentDept.deptId" style="width:120px">
				<option>---请选择---</option>
				<c:forEach items="${deptList }" var="d">
					<option value="${d.deptId }">${d.deptName }</option>
				</c:forEach>
			</select>
			
		</td>
	</tr>
	
	
	
	
	<%-- <tr>
		<td>部门名称</td>
		<td><input type="text" name="deptName" id="deptName"></td>
	</tr>
	
	<tbody class="tableBody" >
	
	<c:forEach items="${deptList}" var="d" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="deptId" value="${d.deptId}"/></td>
		<td>${status.index+1}</td>
		<td>${d.deptId}</td>
		<td>${d.parentDept.deptName}</td>
		<td><a href="dept/toview?id=${d.deptId}">${d.deptName}</a></td><!-- 超链接可以查看部门信息aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa -->
		<td>
			<c:if test="${d.state==1}"><a href="stop?deptId=${d.deptId}"><font color="green">启用</font></a></c:if>
			<c:if test="${d.state==0}"><a href="start?deptId=${d.deptId}"><font color="red">停用</font></a></c:if>
		</td>
	</tr>
	</c:forEach> --%>
	
	
	
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

