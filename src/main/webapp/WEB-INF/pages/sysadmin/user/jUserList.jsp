<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>用户列表</title>
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
	<li id="update"><a href="#" onclick="formSubmit('

			','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('delete','_self');this.blur();">删除</a></li>
	
	<li id="view"><a href="#" onclick="formSubmit('toRoleUser','_self');this.blur();">角色</a></li>
	<li id="new"><a href="#" onclick="formSubmit('start','_self');this.blur();">启用</a></li>
	<li id="new"><a href="#" onclick="formSubmit('stop','_self');this.blur();">停用</a></li>
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
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('userId',this)"></td><!-- onclick="checkAll('userId',this)注意。。。。。。。。。。。。。 -->
		<td class="tableHeader">序号</td>
		<td class="tableHeader">ID</td>
		<td class="tableHeader">部门</td>
		<td class="tableHeader">用户名</td>
		<td class="tableHeader">姓名</td>
		<td class="tableHeader">身份证号</td>
		<td class="tableHeader">上级领导</td>
		<td class="tableHeader">入职时间</td>
		<td class="tableHeader">工资</td>
		<td class="tableHeader">性别</td>
		<td class="tableHeader">电话号码</td>
		<td class="tableHeader">状态</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${dataList}" var="u" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="userId" value="${u.userId}"/></td>
		<td>${status.index+1}</td>
		<td>${u.userId}</td>
		<td>${u.dept.deptName}</td>
		<td>${u.username}</td>
		<td>${u.userInfo.name}</td>
		<td>${u.userInfo.cardNo}</td>
		<td>${u.userInfo.manager.name}</td>
		<%-- <td>${u.userInfo.joinDate}</td> --%>
		<td><fmt:formatDate value="${u.userInfo.joinDate}" pattern="yyyy-MM-dd"/></td>
		 <td>${u.userInfo.salary}</td>
		<%-- <td>${u.userInfo.gender}</td> --%>
		<td>
			<c:if test="${u.userInfo.gender==1 }">男</c:if>
			<c:if test="${u.userInfo.gender==0 }">女</c:if>
		</td>
		
		
		<td>${u.userInfo.telephone}</td>
		<td>
			<c:if test="${u.state==1}"><a href="stop?userId=${u.userId}"><font color="green">启用</font></a></c:if>
			<c:if test="${u.state==0}"><a href="start?userId=${u.userId}"><font color="red">停用</font></a></c:if>
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

