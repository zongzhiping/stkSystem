<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.model.*" %>
<%@page import="com.util.*" %>
<%
    String path = request.getContextPath();
    String userName = (String) session.getAttribute("name");
    Date nowDate = new Date();
    List list = (List) request.getAttribute("list");
    int type = (Integer) request.getAttribute("type");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id=Head1><TITLE>模板</TITLE>
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
<form id=form1 name=form1

      method=post>
    <input type="hidden" id="type" name="type" value="<%=type %>">
    <script type=text/javascript>

        function checkAll(obj) {
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                document.getElementsByName("selectFlag")[i].checked = obj.checked;
            }
        }

        window.onload = function () {
            var len = document.getElementsByName("selectFlag").length;
            for (var i = 0; i < len; i++) {
                document.getElementsByName("selectFlag")[i].onclick = function () {
                    var flag = true;
                    for (var j = 0; j < len; j++) {
                        if (!document.getElementsByName("selectFlag")[j].checked) {
                            flag = false;
                        }
                    }
                    document.getElementById("allbox").checked = flag;
                }
            }
        }

        function modify() {
            var count = 0;
            var j = 0;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    j = document.getElementsByName("selectFlag")[i].value;
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择需要修改的数据！");
                return;
            }
            if (count > 1) {
                alert("一次只能查看一张试卷！");
                return;
            }
            if (count == 1) {
                with (document.getElementById("form1")) {
                    method = "post";
                    action = "<%=path %>/ksMb.action?id=" + j+"&subjectInfo=${subjectInfo}";
                    submit();
                }
            }
        }

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
                    action = "<%=path %>/ksDel.action?idList=" + arrayObj;
                    submit();
                }
            }
        }


        //]]>
    </script>

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
        <TBODY>
        <TR>
            <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0></TD>
            <TD vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <TR>
                        <TD class=manageHead>当前位置：管理首页 &gt; 制定试卷 &gt; 试卷管理</TD>
                    </TR>
                    <TR>
                        <TD height=2></TD>
                    </TR>
                </TABLE>
                <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
                       align=center border=0>
                    <TBODY>
                    <TR>
                        <TD align=right height=25><INPUT id=boxListValue type=hidden
                                                         name=boxListValue> <INPUT onclick=checkAll(this); id="allbox" type=checkbox
                                                                                   name="ifAll"> 全选
                            <span onclick="modify()"> <img alt="" src="<%=path %>/admin/YHChannelApply.files/114.gif">查看试卷</span>
                            <span onclick="deletes()"> <img alt="" src="<%=path %>/admin/YHChannelApply.files/083.gif">删除</span>

                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <TABLE id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <TBODY>
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td>标题</td>
                                    <td>考试时间</td>
                                    <td>考试班级</td>
                                    <td>单选题</td>
                                    <td>多选题</td>
                                    <td>判断题</td>
                                    <td>填空题</td>
                                    <td>操作</td>
                                </tr>
                                <%
                                    for (int i = 0; i < list.size(); i++) {
                                        Ks bean = (Ks) list.get(i);
                                %>


                                <TR
                                        style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                                    <TD><%=bean.getTitle() %>
                                    </TD>
                                    <TD><%=bean.getTimes() %>
                                    </TD>
                                    <TD><%=bean.getClas() %>
                                    </TD>
                                    <TD><%=ValueBean.gethave(bean.getDx()) %>
                                    </TD>
                                    <TD><%=ValueBean.gethave(bean.getDdx()) %>
                                    </TD>
                                    <TD><%=ValueBean.gethave(bean.getPd()) %>
                                    </TD>
                                    <TD><%=ValueBean.gethave(bean.getBc()) %>
                                    </TD>
                                    <TD><INPUT id="selectFlag"
                                               type="checkbox" name="selectFlag" value="<%=bean.getId()%>">
                                    </TD>
                                </TR>
                                <%} %>

                                </TBODY>
                            </TABLE>
                        </TD>
                    </TR>

                    </TBODY>
                </TABLE>
            </TD>
            <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_023.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_023.jpg" border=0></TD>
        </TR>
        </TBODY>
    </table>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_024.jpg" border=0></TD>
            <TD align=middle width="100%" background="<%=path %>/admin/YHChannelApply.files/new_025.jpg"
                height=15></TD>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_026.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </table>
</form>
</body>
</HTML>


