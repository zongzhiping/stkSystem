<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%
    String path = request.getContextPath();
    String userName = (String) session.getAttribute("name");
    Date nowDate = new Date();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD id=Head1><TITLE>顶部</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <STYLE type=text/css>BODY {
        PADDING-RIGHT: 0px;
        PADDING-LEFT: 0px;
        PADDING-BOTTOM: 0px;
        MARGIN: 0px;
        PADDING-TOP: 0px;
        BACKGROUND-COLOR: #9933FF
    }

    BODY {
        FONT-SIZE: 12px;
        COLOR: #003366;
        FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
    }

    TD {
        FONT-SIZE: 12px;
        COLOR: #003366;
        FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
    }

    DIV {
        FONT-SIZE: 12px;
        COLOR: #003366;
        FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
    }

    P {
        FONT-SIZE: 12px;
        COLOR: #003366;
        FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
    }
    </STYLE>

    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
<FORM id=form1 name=form1 action=YHTop.aspx method=post>
    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
            <TD width=10><IMG src="YHTop.files/new_001.jpg" border=0></TD>
            <TD background=YHTop.files/new_002.jpg><FONT size=4><B>在线试题库系统</B></FONT></TD>
            <TD background=YHTop.files/new_002.jpg>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                        <TD align=right height=35></TD>
                    </TR>
                    <TR>
                        <TD align="right" height=35><A href="toLogin.action"
                                         target=_top><FONT color=red><B>安全退出</B></FONT></A>
                        </TD>
                    </TR>
                    </TBODY>
                </TABLE>
            </TD>
<%--            <TD width=10><IMG src="YHTop.files/new_003.jpg"
                              border=0></TD>--%>
        </TR>
        </TBODY>
    </TABLE>
</FORM>
</BODY>
</HTML>
