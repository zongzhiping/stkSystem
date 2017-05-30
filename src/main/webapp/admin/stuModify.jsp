<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.model.*" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id=Head1><TITLE>学生信息的修改</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK
            href="<%=path %>/admin/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
    <LINK
            href="<%=path %>/admin/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
    <SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/FrameDiv.js"></SCRIPT>

    <SCRIPT language=javascript src="<%=path %>/admin/YHChannelApply.files/Common.js"></SCRIPT>

    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</head>
<body>
<form id="ThisForm" name=ThisForm
      action="<%=path %>/stuEdit.action?id=${bean.id}"
      method=post>
    <%--<input type="hidden" id="id" name="id" value="${bean.id}">--%>

    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_019.jpg" border=0></td>
            <td width="100%" background="<%=path %>/admin/YHChannelApply.files/new_020.jpg" height=20></td>
            <td width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_021.jpg"
                              border=0></td>
        </tr>
        </tbody>
    </table>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0></td>
            <td vAlign=top width="100%" bgColor=#ffffff>
                <table cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <tr>
                        <td class=manageHead>当前位置：管理首页 &gt; 学生管理 &gt; 学生修改</td>
                    </tr>
                    <tr>
                        <td height=2></td>
                    </tr>
                </table>
                <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
                       align=center border=0>
                    <tbody>

                    <tr>
                        <td>
                            <table id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <tbody>
                                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">考号</td>
                                    <td>
                                        <input type="text" id="userNo" name="userNo" value="${bean.userNo}"/>
                                    </td>
                                </tr>
                                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">姓名</td>
                                    <td>
                                        <input type="text" id="realName" name="realName" value="${bean.realName}"/></td>
                                </tr>
                                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">密码</td>
                                    <td>
                                        <input type="text" id="password" name="password" value="${bean.password}"/></td>
                                </tr>
                                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">身份证</td>
                                    <td>
                                        <input type="text" id="cardno" name="cardno" value="${bean.cardno}"/></td>
                                </tr>
                                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">电话</td>
                                    <td>
                                        <input type="text" id="tel" name="tel" value="${bean.tel}"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align=right height=25>
                            <input id="button1" type="button" value="确定" onclick="sure()">
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
</body>
</HTML>

<script>
    function sure(){
        document.getElementById("ThisForm").submit();
    }
</script>


