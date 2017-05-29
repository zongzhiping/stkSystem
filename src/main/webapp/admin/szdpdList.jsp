<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.model.*" %>
<%
String path = request.getContextPath();
String userName = (String)session.getAttribute("name");
Date nowDate = new Date();
List list  = (List)request.getAttribute("list");
String kid=request.getParameter("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=Head1><TITLE>模板</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="<%=path %>/admin/YHChannelApply.files/Style.css" type=text/css rel=stylesheet><LINK 
href="<%=path %>/admin/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/FrameDiv.js"></SCRIPT>

<SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/Common.js"></SCRIPT>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>
<FORM id=form1 name=form1 

method=post>
<SCRIPT type=text/javascript>
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}




	
function checkAll() {
    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
        document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
    }
}


function modify() {
    var count = 0;
    var j = 0;
    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
        if (document.getElementsByName("selectFlag")[i].checked) {
            j = i;
            count++;
        }
    }
    if (count == 0) {
        alert("请选择需要添加的题目！");
        return;
    }
    if (count > 1) {
        alert("一次只能添加一个题目！");
        return;
    }
    if (count == 1) {
    var id = document.getElementsByName("selectFlag")[j].value;
        window.open ('kstAdd.action?id='+id+'&type=3&kid=<%=kid%>');
    }
}

function deletes() {
    if (window.confirm("确认进入吗？")) {
        with (document.getElementById("form1")) {
            method = "post";
            action = "<%=path %>/szdbcList.action?id=<%=kid%>";
            submit();
        }
    }
}


//]]>
</SCRIPT>

<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background="<%=path %>/admin/YHChannelApply.files/new_020.jpg" height=20></TD>
    <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG 
      src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：管理首页 &gt; 题库 &gt; 随机制定判断题列表</TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        
        <TR>
          <TD>
            <TABLE id=grid 
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
              <TBODY>
              <TR 
              style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                <TD>题目</TD>
                <TD>操作</TD></TR>
             					<%
			for(int i = 0;i<list.size();i++){
				Pd bean = (Pd)list.get(i);
			%>
							
             
              <TR 
              style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                <TD><%=bean.getTitle() %></TD>
                <TD><INPUT id="selectFlag" 
                  type="checkbox"  name="selectFlag"  value="<%=bean.getId()%>">
</TD></TR>
<%} %>

</TBODY></TABLE></TD></TR>
        <TR>
          <TD align=right height=25><INPUT id=boxListValue type=hidden 
            name=boxListValue> <INPUT class=button id=button1 type=button value="添加" name=button1 onclick="modify()"> 
<INPUT class=button id=button2  value="进入编程题" type=button name=button2 onclick="deletes()"> 
           </TD></TR>
       </TBODY></TABLE></TD>
    <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_023.jpg"><IMG 
      src="<%=path %>/admin/YHChannelApply.files/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align=middle width="100%" background="<%=path %>/admin/YHChannelApply.files/new_025.jpg" 
    height=15></TD>
    <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
</FORM></BODY></HTML>


