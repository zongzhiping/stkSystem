<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="com.enumtype.SubjectType" %>
<%
    String path = request.getContextPath();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD id=Head1><TITLE>模板</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK
            href="<%=path %>/admin/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
    <LINK
            href="<%=path %>/admin/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
    <SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/FrameDiv.js"></SCRIPT>

    <SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/Common.js"></SCRIPT>


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
        document.ThisForm.submit();
    }


    //]]>
</SCRIPT>
<form id="ThisForm" name="ThisForm"
      action="<%=path %>/teaAdd.action"
      method=post>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_019.jpg" border=0></TD>
            <TD width="100%" background="<%=path %>/admin/YHChannelApply.files/new_020.jpg" height=20></TD>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_021.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </table>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0></td>
            <td vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <tr>
                        <td class=manageHead>当前位置：管理首页 &gt; 教师管理 &gt; 教师添加</td>
                    </tr>
                    <tr>
                        <td height=2></td>
                    </tr>
                </TABLE>
                <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
                       align=center border=0>
                    <tbody>

                    <tr>
                        <td>
                            <table id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <tbody>
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">账户</td>
                                    <td><input type="text" id="username" name="username"/></td>
                                </tr>
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">密码</td>
                                    <td><input type="text" id="password" name="password"/></td>
                                </tr>

                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">科目</td>
                                    <td><select name="subjectInfo" >
                                        <%
                                            SubjectType[] values = SubjectType.values();
                                            for(int i = 0 ; i < values.length ; i++){
                                        %>
                                        <option value="<%=values[i].getValue()%>"><%=values[i].getLabel()%></option>
                                        <%}%>
                                    </select></td>
                                </tr>

                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align=right height=25>
                            <input class=button id=button1 value="确定" name=button1 onclick="add()">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <td width=15 background="<%=path %>/admin/YHChannelApply.files/new_023.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_023.jpg" border=0></td>
        </tr>
        </tbody>
    </table>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_024.jpg" border=0></td>
            <td align=middle width="100%" background="<%=path %>/admin/YHChannelApply.files/new_025.jpg"
                height=15></td>
            <td width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_026.jpg"
                              border=0></td>
        </tr>
        </tbody>
    </table>
</form>
</BODY>
</HTML>


