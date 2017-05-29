<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>用户角色分配</title>
	<link rel="stylesheet" href="${ctx}/staticfile/components/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctx}/staticfile/components/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/staticfile/components/zTree/js/jquery.ztree.core-3.5.min.js"></script>
	<script type="text/javascript" src="${ctx}/staticfile/components/zTree/js/jquery.ztree.excheck-3.5.min.js"></script>
	<SCRIPT type="text/javascript">

	
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		
		//这里相当于在拿后来传来的数据，后台在传数据的时候，属性名要对应上
		var zNodes =${zTreeJson}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#htZtree"), setting, zNodes);

			var zTreeObj = $.fn.zTree.getZTreeObj("htZtree");
			zTreeObj.expandAll(true);		//展开所有树节点
		});
		
		
		//获取到所以用户选中的节点id值
		//获取所有选择的节点，提交时调用下面函数
		function submitCheckedNodes(treeNode) {
			var nodes = new Array();
			var zTreeObj = $.fn.zTree.getZTreeObj("htZtree");
			nodes = zTreeObj.getCheckedNodes(true);		//取得选中的结点
			var str = "";
			for (i = 0; i < nodes.length; i++) {
				if (str != "") {
					str += ",";
				}
				str += nodes[i].id;
			}
			
			$('#roleIds').val(str);		//将拼接完成的字符串放入隐藏域，这样就可以通过post提交
		}
	</SCRIPT>
</head>

	<body>
		<form name="icform" method="post">
			<div id="menubar">
			<div id="middleMenubar">
			<div id="innerMenubar">
		 	<div id="navMenubar">
			<ul>
				<li id="save"><a href="#" onclick="submitCheckedNodes();formSubmit('saveUserRole','_self');this.blur();">保存</a></li>
				<li id="back"><a href="#" onclick="window.history.go(-1);this.blur();">返回</a></li>
			</ul>
		    </div>
		    </div>
		    </div>
			</div>
		   
		  <div class="textbox-title">
			<img src="${ctx}/staticfile/skin/default/images/icon/currency_yen.png"/>
		    用户角色分配
		  </div> 
		<div>
			<div class="eXtremeTable" >
				<table id="ec_table" class="tableRegion" width="98%" >
					<!--隐藏域用来传递数据  -->
					<input type="hidden" id="userId" name="userId" value="${userId}"/>
					<input type="hidden" id="roleIds" name="roleIds"/>
					<ul id="htZtree" class="ztree"></ul>
				</table>
			</div>
		</div>
		 
		 
		</form>
	</body>
</html>

