<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%
    String path = request.getContextPath();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head id=Head1><TITLE>模板</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK
            href="YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
    <LINK
            href="YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
    <script language=javascript src="YHChannelApply.files/FrameDiv.js"></script>

    <script language=javascript src="YHChannelApply.files/Common.js"></script>
    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>

</head>
<body>

<script type=text/javascript>

    //trim函数定义
    function trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g,"");
    }

    function add() {
        document.ThisForm.submit();
    }

    function checkA(obj){
        var aa = obj.value;
        var re = /\s+|\t+|\，+/;//此处的逗号为中文格式
        if(re.test(trim(aa))){
            alert("多个答案之间请用,[这是英文格式]分开!");
            return;
        }
    }
</script>

<form id="ThisForm" name="ThisForm"
      action="<%=path %>/bcAdd.action?subjectInfo=${subjectInfo}"
      method=post>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15><IMG src="YHChannelApply.files/new_019.jpg" border=0></td>
            <td width="100%" background=YHChannelApply.files/new_020.jpg height=20></td>
            <td width=15><IMG src="YHChannelApply.files/new_021.jpg"
                              border=0></td>
        </tr>
        </tbody>
    </table>
    <table cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15 background=YHChannelApply.files/new_022.jpg><IMG
                    src="YHChannelApply.files/new_022.jpg" border=0></td>
            <td vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <tr>
                        <td class=manageHead>当前位置：管理首页 &gt; 题库 &gt; 填空题添加</td>
                    </tr>
                    <tr>
                        <td height=2></td>
                    </tr>
                </TABLE>
                <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
                       align=center border=0>
                    <tbody>

                    <tr>
                        <td>
                            <TABLE id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <tbody>
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">题目</td>
                                    <td><textarea rows="10" cols="30" id="title" name="title"></textarea></td>
                                </tr>
                                <tr
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td align="center">答案</td>
                                    <td><textarea rows="5" cols="30" id="da" name="da" onblur="checkA(this)"></textarea></td>
                                </tr>
                                </tbody>
                            </TABLE>
                        </td>
                    </tr>
                    <tr>
                        <td align=right height=25>
                            <INPUT class=button id=button1 type="button" value="确定" name=button1 onclick="add()">
                        </td>
                    </tr>
                    </tbody>
                </TABLE>
            </td>
            <td width=15 background=YHChannelApply.files/new_023.jpg><IMG
                    src="YHChannelApply.files/new_023.jpg" border=0></td>
        </tr>
        </tbody>
    </table>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <tbody>
        <tr>
            <td width=15><IMG src="YHChannelApply.files/new_024.jpg" border=0></td>
            <td align=middle width="100%" background=YHChannelApply.files/new_025.jpg
                height=15></td>
            <td width=15><IMG src="YHChannelApply.files/new_026.jpg"
                              border=0></td>
        </tr>
        </tbody>
    </TABLE>
</form>
</body>
</HTML>




