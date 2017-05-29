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
	<li id="back"><a href="#" onclick="window.history.go(-1)">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    部门列表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<!-- <td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('deptId',this)"></td> -->
		<td class="tableHeader">序号</td>
		<td class="tableHeader">名称</td>
		<td class="tableHeader">上级</td>	
		<td class="tableHeader">状态</td>
		<td class="tableHeader">CREATE_BY</td>
		<td class="tableHeader">CREATE_DEPT</td>
		<td class="tableHeader">CREATE_TIME</td>	
		<td class="tableHeader">UPDATE_BY</td>
		<td class="tableHeader">UPDATE_TIME</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<%-- <c:forEach items="${deptList}" var="d" varStatus="status">
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
	
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<%-- <td><input type="checkbox" name="deptId" value="${d.deptId}"/></td> --%>
		<td>${dept.deptId }</td>
		<td>${dept.deptName }</td>
		<td>${dept.parentDept.deptId }</td>
		<td>${dept.state }</td>
		<td>${dept.createBy }</td>
		<td>${dept.createDept }</td>
		<td><fmt:formatDate value="${dept.createTime }" pattern="yyyy-MM-dd"/></td>
		<td>${dept.updateBy }</td>
		<td>${dept.updateTime }</td>
		
		<%-- <td>
			<c:if test="${d.state==1}"><a href="stop?deptId=${d.deptId}"><font color="green">启用</font></a></c:if>
			<c:if test="${d.state==0}"><a href="start?deptId=${d.deptId}"><font color="red">停用</font></a></c:if>
		</td>
		
		<td>${status.index+1}</td>
		<td>${de.deptId}</td>
		<td>${d.parentDept.deptName}</td>
		<td><a href="dept/toview?id=${d.deptId}">${d.deptName}</a></td><!-- 超链接可以查看部门信息aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa --> --%>
		
	</tr>
	
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

