<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.util.*" %>
<%@ page import="com.model.*" %>
<%@ page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

    Pagination p = (Pagination) request.getAttribute("page");
    int totleNum = p.getTotle();
    int totlePage = p.getTotlePage();
    int currentPage = p.getIndex();
    List list = p.getData();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id=Head1><TITLE>模板</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <link href="<%=path %>/admin/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
    <link href="<%=path %>/admin/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
    <link href="<%=path%>/css/page.css" type="text/css" rel="stylesheet">
    <script language=javascript src="<%=path %>/admin/YHChannelApply.files/FrameDiv.js"></script>

    <script language=javascript src="<%=path %>/admin/YHChannelApply.files/Common.js"></script>


    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</head>
<body>
<form id=form1 name=form1
      method=post>

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

        //页面跳转js
        function  changePageA(obj) {
            with (document.getElementById("form1")){
                method = "post";
                action = "<%=path%>/pdList.action?index="+obj+"&subjectInfo=${subjectInfo}";
                submit();
            }
        }

        //输入跳转页面
        function changePage(obj){
            var aa = obj.value;

            if(isNaN(aa)){
                alert("请输入数字");
                return;
            }

            if(aa<1||aa>${page.totlePage}){
                alert("数值超出");
                return;
            }

            with(document.getElementById("form1")){
                method = "post";
                action = "<%=path%>/pdList.action?index="+obj.value+"&subjectInfo=${subjectInfo}";
                submit();
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
                alert("一次只能修改一个数据！");
                return;
            }
            if (count == 1) {
                with (document.getElementById("form1")) {
                    method = "post";
                    action = "<%=path %>/pdMb.action?id=" + j+"&subjectInfo=${subjectInfo}";
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
                    action = "<%=path %>/pdDel.action?idList=" + arrayObj;
                    submit();
                }
            }
        }

    </script>

    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <TR>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_019.jpg" border=0></TD>
            <TD width="100%" background="<%=path %>/admin/YHChannelApply.files/new_020.jpg" height=20></TD>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_021.jpg"
                              border=0></TD>
        </TR>
        </tbody>
    </table>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_022.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_022.jpg" border=0></TD>
            <TD vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <TR>
                        <TD class=manageHead>当前位置：管理首页 &gt; 题库 &gt; 判断题管理</TD>
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
                            <span onclick="modify()"> <img alt="" src="<%=path %>/admin/YHChannelApply.files/114.gif">修改</span>
                            <span onclick="deletes()"> <img alt="" src="<%=path %>/admin/YHChannelApply.files/083.gif">删除</span>

                        </TD>
                    </TR>
                    <TR>
                        <TD>
                            <TABLE id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <TBODY>
                                <TR
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <TD>题目</TD>
                                    <TD>答案</TD>
                                    <TD>操作</TD>
                                </TR>

                                <c:forEach items="${page.data}" var="bean">
                                    <tr>
                                        <td>${bean.title}</td>
                                        <td>${bean.da}</td>
                                        <td><input name="selectFlag" type="checkbox" value="${bean.id}"></td>
                                    </tr>
                                </c:forEach>

                                <%--<%--%>
                                    <%--for (int i = 0; i < list.size(); i++) {--%>
                                        <%--Pd bean = (Pd) list.get(i);--%>
                                <%--%>--%>
                                <%--<TR--%>
                                        <%--style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">--%>
                                    <%--<TD><%=bean.getTitle() %>--%>
                                    <%--</TD>--%>
                                    <%--<TD><%=bean.getDa() %>--%>
                                    <%--</TD>--%>
                                    <%--<TD><INPUT id="selectFlag"--%>
                                               <%--type="checkbox" name="selectFlag" value="<%=bean.getId()%>"></TD>--%>
                                <%--</TR>--%>
                                <%--<%} %>--%>

                                </TBODY>
                            </TABLE>
                        </TD>
                    </TR>
                    <tr>
                        <td>
                            <div id="fy_div">
                                共${page.totle}条记录 共${page.totlePage}页 <a
                                    href="javascript:void(0)" onclick="changePageA(1)">首页</a> <a
                                    href="javascript:void(0)" onclick="changePageA(${page.prePage})">上一页</a>
                                <%-- 分页逻辑开始 --%>
                                <c:set var="begin" value="0" scope="page"/>
                                <c:set var="end" value="0" scope="page"/>
                                <c:if test="${page.totlePage<=5}">
                                    <c:set var="begin" value="1" scope="page"/>
                                    <c:set var="end" value="${page.totlePage}" scope="page"/>
                                </c:if>
                                <c:if test="${page.totlePage>5}">
                                    <c:choose>
                                        <c:when test="${page.index<=3 }">
                                            <c:set var="begin" value="1" scope="page"/>
                                            <c:set var="end" value="5" scope="page"/>
                                        </c:when>
                                        <c:when test="${page.index>=page.totlePage-2 }">
                                            <c:set var="begin" value="${page.totlePage-4}" scope="page"/>
                                            <c:set var="end" value="${page.totlePage}" scope="page"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="begin" value="${page.index-2}" scope="page"/>
                                            <c:set var="end" value="${page.index+2}" scope="page"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <%--遍历页码 --%>
                                <c:forEach begin="${begin}" end="${end}" step="1" var="i">
                                    <c:if test="${page.index==i }">${i}</c:if>
                                    <c:if test="${page.index!=i }">
                                        <a href="javascript:void(0)" onclick="changePageA(${i})">${i}</a>
                                    </c:if>
                                </c:forEach>
                                <%-- 分页逻辑结束 --%>
                                <a href="javascript:void(0)" onclick="changePageA(${page.nextPage})">下一页</a>
                                <a href="javascript:void(0)" onclick="changePageA(${page.totlePage})">尾页</a>
                                跳转到<input type="text" value="${page.index }"
                                          onblur="changePage(this)"/>页
                            </div>
                        </td>
                    </tr>
                    </TBODY>
                </TABLE>
            </TD>
            <TD width=15 background="<%=path %>/admin/YHChannelApply.files/new_023.jpg"><IMG
                    src="<%=path %>/admin/YHChannelApply.files/new_023.jpg" border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_024.jpg" border=0></TD>
            <TD align=middle width="100%" background="<%=path %>/admin/YHChannelApply.files/new_025.jpg"
                height=15></TD>
            <TD width=15><IMG src="<%=path %>/admin/YHChannelApply.files/new_026.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
</form>
</body>
</HTML>


