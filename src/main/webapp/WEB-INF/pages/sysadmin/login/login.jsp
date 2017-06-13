<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>在线试题库系统</title>
	<link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/staticfile/skin/default/css/login.css" media="all" />
</head>

<body>
<form id="login_main" method="post">
<div id="png">
	<div class="box">
			<div class="inputstyle">
				<div class="inputlable">用户名：
					<input type="text"  name="username" id="username" onFocus="this.select();" title="请您输入用户名"/>
					<div id="ts" style="z-index:1;">
					</div>
				</div>

			    <div class="inputlable">密　码：
					<input type="password" name="password" id="password" onfocus="$('#ts').css('display','none');this.select();"
						onKeyDown="javascript:if(event.keyCode==13){ submitFind(); }" title="请您输入密码"/>
				</div>
				<div class="btnstyle">
					<input id="aaa" value="" type="button"
							onclick="formSubmit('${ctx}/adminLogin.action','_self');"
							<%--onmouseover="this.className='loginImgOver'"--%>
							<%--onmouseout="this.className='loginImgOut'"--%>
					/>
					<input id="bbb" value="" type="button"
						   onclick="Res()"
						   <%--onmouseover="this.className='resetImgOver'"--%>
						   <%--onmouseout="this.className='resetImgOut'"--%>
					/>
				</div>
			</div>

		  	<div class="msgtip">
				<c:if test="${!empty errorInfo}">
					${errorInfo}
				</c:if>
			</div>
	</div>
</div>
</form>

<script type="text/JavaScript">
	function Res() {
		document.getElementById('login_main').reset();
    }
</script>

</body>
</html>


