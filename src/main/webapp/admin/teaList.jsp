<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.enumtype.*" %>
<%@page import="com.model.*" %>
<%
    String path = request.getContextPath();
    String userName = (String) session.getAttribute("name");
    Date nowDate = new Date();
    List list = (List) request.getAttribute("list");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id=Head1><TITLE>模板</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <link
            href="<%=path %>/admin/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
    <link
            href="<%=path %>/admin/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>


    <meta content="MSHTML 6.00.2900.3492" name=GENERATOR>
</head>
<BODY>
<form id=form1 name=form1

      method=post>
    <script type=text/javascript>
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


        function checkAll(obj) {
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                document.getElementsByName("selectFlag")[i].checked = obj.checked;
            }
        }

        window.onload = function () {
            var itmes = document.getElementsByName("selectFlag");
            var len = itmes.length;
            for (var i = 0; i < len; i++) {
                itmes[i].onclick = function () {
                    var flag = true;
                    for (var j = 0; j < len; j++) {
                        if (!document.getElementsByName("selectFlag")[j].checked) {
                            flag = false;
                        }
                    }
                    document.getElementById("ifAll").checked = flag;
                }
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
                alert("请选择需要修改的数据！");
                return;
            }
            if (count > 1) {
                alert("一次只能修改一个数据！");
                return;
            }
            if (count == 1) {
                with (document.getElementById("form1")) {
                    method = "post";
                    action = "<%=path %>/dxtMb.action";
                    submit();
                }
            }
        }

        <!--编辑-->
        function edit() {

            var len = 0;
            var j = 0;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    j = document.getElementsByName("selectFlag")[i].value;
                    len++;
                }
            }


            if (len > 1) {
                alert("每次只能编辑一名教师！");
            } else if (len = 0) {
                alert("请选择要编辑的数据！");
            } else if (len = 1) {
                with (document.getElementById("form1")) {
                    method = "post";
                    action = "<%=path %>/teaMb.action?id=" + j;
                    submit();
                }
            } else {
                alert("数据被篡改！")
            }
        }

        <%--function deletes() {--%>
            <%--var flag = false;--%>
            <%--for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {--%>
                <%--if (document.getElementsByName("selectFlag")[i].checked) {--%>
                    <%--flag = true;--%>
                <%--}--%>
            <%--}--%>
            <%--if (!flag) {--%>
                <%--alert("请选择需要删除的数据！");--%>
                <%--return;--%>
            <%--}--%>
            <%--if (window.confirm("确认删除吗？")) {--%>
                <%--with (document.getElementById("form1")) {--%>
                    <%--method = "post";--%>
                    <%--action = "<%=path %>/teaDel.action";--%>
                    <%--submit();--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>


        function deletes() {
            var flag = false;
            var j = 0;
            var arrayObj = new Array();
            var a = 0;//记录所选中的数据
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    flag = true;
                    j = document.getElementsByName("selectFlag")[i].value;//获取id
                    a = arrayObj.push(j);
                }
            }
            if (!flag) {
                alert("请选择需要删除的数据！");
                return;
            }
            if (window.confirm("确认删除吗？")) {
                with (document.getElementById("form1")) {
                    method = "post";
                    action = "<%=path %>/teaDel.action?idList=" + arrayObj;
                    submit();
                }
            }
        }

        //]]>
    </script>

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
            <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0></TD>
            <td vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <TR>
                        <TD class=manageHead>当前位置：管理首页 &gt; 教师管理 &gt; 教师管理</TD>
                    </TR>
                    <TR>
                        <TD height=2></TD>
                    </TR>
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
                                <TR
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">

                                    <TD>账户</TD>
                                    <TD>密码</TD>
                                    <TD>所教科目</TD>
                                    <TD><INPUT onclick="checkAll(this)" ; type=checkbox id="ifAll">
                                    </TD>

                                </TR>
                                <%
                                for (int i = 0; i < list.size(); i++) {
                                Teacher bean = (Teacher) list.get(i);
                                %>

                                <%--<c:forEach items="${list}" var="bean">--%>

                                    <tr
                                            style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                                        <td><%= bean.getUserName()%></td>
                                        <td><%= bean.getPassword()%></td>
                                        <td><%=SubjectType.get(bean.getSubjectInfo())%></td>
                                        <td>
                                            <input id="selectFlag"
                                                   type="checkbox" name="selectFlag" value="<%=bean.getId()%>"
                                                   onclick="checkOne()">
                                        </td>
                                    </tr>
                                <%--</c:forEach>--%>
                                <%} %>

                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <tr bgcolor="#a9a9a9">
                        <td align=center height=25><input id=boxListValue type=hidden
                                                          name=boxListValue>
                            <input class=button id=button1 value="编辑" name=button1 onclick="edit()">
                            <input class=button id=button2 value="删除" name=button2 onclick="deletes()">
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


