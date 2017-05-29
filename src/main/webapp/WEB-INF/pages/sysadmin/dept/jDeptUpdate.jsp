<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<li id="save"><a href="#"
								onclick="formSubmit('saveDeptUpdate','_self');this.blur();">保存修改</a></li>
							<li id="back"><a href="#" onclick="window.history.go(-1)">返回</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="textbox-title">
			<img src="../../staticfile/skin/default/images/icon/currency_yen.png" />
			部门列表
		</div>

		<div>


			<div class="eXtremeTable">
				<table id="ec_table" class="tableRegion" width="98%">
					<thead>
						<tr>
							<!-- <td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('deptId',this)"></td> -->

							<td class="tableHeader">名称</td>
							<td class="tableHeader">上级</td>
							<td class="tableHeader">状态</td>

						</tr>
					</thead>
					<tbody class="tableBody">
							<input type="hidden" name="deptId" value="${dept.deptId }"/>
						<tr class="odd" onmouseover="this.className='highlight'"
							onmouseout="this.className='odd'">
							
							
							
							<td><input name="deptName" type="text"
								value="${dept.deptName }"></td>
							<td><input name="parentDept.deptId" type="text"
								value="${dept.parentDept.deptId}">${dept.parentDept.deptName}</td>
							<td><input name="state" type="text" value="${dept.state }"></td>
						</tr>

					</tbody>
				</table>
			</div>

		</div>


	</form>
</body>
</html>

