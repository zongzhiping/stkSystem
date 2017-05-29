<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>用户新增</title>
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
    用户新增
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tbody class="tableBody" >
	<tr class="odd">
		<td>用户名</td>
		<td><input type="text" name="username" id="username"/></td>
		<td>密码</td>
		<td><input type="password" name="password" id="password"/></td>
	</tr>
	<tr class="odd">
		<td>所属部门</td>
		<td>
		<select name="dept.deptId" style="width: 121px">
			<option>----选一个呗----</option>
			<c:forEach items="${deptList }" var="d">
				<option value="${d.deptId }">${d.deptName }</option>
			</c:forEach>
		</select>
		</td>
		<td>姓名</td>
		<td><input type="text" name="userInfo.name" id="name"/></td>
	</tr>
	<tr class="odd">
		<td>身份证</td>
		<td><input type="text" name="userInfo.cardNo" id="cardNo"/></td>
		<td>上级领导</td>
		<td>
		<select name="userInfo.manager.userInfoId" style="width: 121px">
			<option>----选一个呗----</option>
			<c:forEach items="${userList }" var="u">
				<option value="${u.userId }">${u.userInfo.name }</option>
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr class="odd">
		<td>入职时间</td>
		<td>
			<input type="text" style="width:90px;" name="userInfo.joinDate"
	             value="2013-03"
	             onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"/></td>
		<td>工资</td>
		<td><input type="text" name="userInfo.salary" id="salary"/></td>
	</tr>
	<tr class="odd">
		<td>生日</td>
		<td><input type="text" style="width:90px;" name="userInfo.birthday"
	             onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"/></td>
		<td>性别</td>
		<td><input type="radio" name="userInfo.gender" id="gender" value="1"/>男 <input type="radio" name="userInfo.gender" id="gender" value="0"/>女</td>
	</tr>
	<tr class="odd">
		<td>岗位</td>
		<td><input type="text" name="userInfo.station" id="station"/></td>
		<td>电话号码</td>
		<td><input type="text" name="userInfo.telephone" id="telephone"/></td>
	</tr>
	<tr class="odd">
		<td>用户级别</td>
		<td>
		<select name="userInfo.userLevel" style="width: 121px">
			<option>----选一个呗----</option>
			<option value="1">总经理</option>
			<option value="2">经理</option>
			<option value="3">部门经理</option>
			<option value="4">普通员工</option>
		</select>
		</td>
		<td>排序号</td>
		<td><input type="text" name="userInfo.orderNo" id="orderNor"/></td>
	</tr>
	<tr class="odd">
		<td>备注信息</td>
		<td colspan="3"><textarea rows="100px" cols="100px" name="userInfo.remark"></textarea></td>
	</tr>
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html> 