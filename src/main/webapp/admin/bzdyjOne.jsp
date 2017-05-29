<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.model.*" %>
<%
String path = request.getContextPath();
List listbc  = (List)request.getAttribute("listbc");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=Head1><TITLE>模板</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="YHChannelApply.files/Style.css" type=text/css rel=stylesheet><LINK 
href="YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="YHChannelApply.files/FrameDiv.js"></SCRIPT>

<SCRIPT language=javascript src="YHChannelApply.files/Common.js"></SCRIPT>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>

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

function add() {
    if (window.confirm("确认吗？")) {
        with (document.getElementById("ThisForm")) {
            method = "post";
            action = "<%=path %>/bzdyjok.action";
            submit();
        }
    }
}



//]]>
</SCRIPT>
<center>
<form name="timerform">
<INPUT  id=button1  value="确定" name=button1 onclick="add()" > 
</form>
</center>
<FORM id="ThisForm" name= "ThisForm"
action="<%=path %>/dxtAdd.action"
method=post>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background=YHChannelApply.files/new_020.jpg height=20></TD>
    <TD width=15><IMG src="YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
       <TR>
    <TD width=15 background=YHChannelApply.files/new_022.jpg><IMG 
      src="YHChannelApply.files/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>编程题</TD></TR>
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
               <%
              for (int i = 0; i < listbc.size(); i++) {
              Tm tm = (Tm)listbc.get(i);
               int id= tm.getId();
               %>
              <TR 
              style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                <TD align="center"><%=i+1 %>.<%=tm.getTitle() %>(<%=tm.getFs() %>分)</TD>
                </TR>
           
                 <TR 
              style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                <TD align="center">
                <textarea rows="20" cols="100" ><%=tm.getStuda() %></textarea>
                  <input type="hidden" id="id" name="id" value="<%=id%>">
                </TD>
                </TR>
                
                 <TR 
              style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                 <TD align="center">
                  得分:<input type="text"" id="fs<%=id %>" name="fs<%=id %>">
                </TD>
                </TR>
                
				<%} %>

</TBODY></TABLE></TD></TR>
       </TBODY></TABLE></TD>
    <TD width=15 background=YHChannelApply.files/new_023.jpg><IMG 
      src="YHChannelApply.files/new_023.jpg" border=0> </TD></TR>
      
      
      </TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align=middle width="100%" background=YHChannelApply.files/new_025.jpg 
    height=15></TD>
    <TD width=15><IMG src="YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
</FORM></BODY></HTML>


