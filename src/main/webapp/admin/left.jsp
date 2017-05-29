<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String userName = (String) session.getAttribute("name");
	int type = Integer
			.parseInt(session.getAttribute("type").toString());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD id=Head1>
<TITLE>导航</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px;
	PADDING-LEFT: 0px;
	PADDING-BOTTOM: 0px;
	MARGIN: 0px;
	PADDING-TOP: 0px;
	BACKGROUND-COLOR: #9933FF
}

BODY {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

TD {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

DIV {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

P {
	FONT-SIZE: 11px;
	COLOR: #003366;
	FONT-FAMILY: Verdana
}

.mainMenu {
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	CURSOR: hand;
	COLOR: #000000
}

A.style2:link {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:visited {
	PADDING-LEFT: 4px;
	COLOR: #0055bb;
	TEXT-DECORATION: none
}

A.style2:hover {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

A.active {
	PADDING-LEFT: 4px;
	COLOR: #ff0000;
	TEXT-DECORATION: none
}

.span {
	COLOR: #ff0000
}
</STYLE>

<SCRIPT language=javascript>
		function MenuDisplay(obj)
		{
		   var index=0;
		   var type='<%=type%>';
		if (type == 1) {
			index = 3;
		} else if (type == 2) {
			index = 4;
		} else if (type == 3) {
			index = 2;
		}
		for ( var i = 1; i <= index; i++) {
			document.getElementById('table_' + i).style.display = 'none';
			//document.getElementById('table_'+i+'Span').i='＋';
		}
		if (document.getElementById(obj).style.display == 'none') {
			document.getElementById(obj).style.display = 'block';
			//document.getElementById(obj+'Span').innerText='－';
		} else if(document.getElementById(obj).style.display == 'block') {
			document.getElementById(obj).style.display = 'none';
			//document.getElementById(obj+'Span').innerText='＋';
		}
	}
</SCRIPT>
<BODY>
	<FORM id=form1 name=form1 action=YHMenu.aspx method=post>
		<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="<%=path%>/admin/YHMenu.files/new_005.jpg" border=0>
					</TD>
					<TD align=middle width=180
						background="<%=path%>/admin/YHMenu.files/new_006.jpg" height=35><B>考试管理系统
							－功能菜单</B></TD>
					<TD width=15><IMG
						src="<%=path%>/admin/YHMenu.files/new_007.jpg" border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
			<TBODY>
				<TR>
					<TD width=15 background="<%=path%>/admin/YHMenu.files/new_008.jpg"></TD>
					<TD vAlign=top width=180 bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
							<TBODY>
								<%
									if (type == 1) {
								%>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
										class=span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 用户管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/teaList.action'
														target=dmMain>教师管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/teaAdd.jsp'
														target=dmMain>教师添加</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/stuList.action'
														target=dmMain>学生管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/stuAdd.jsp'
														target=dmMain>学生添加</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
										class=span id=table_2Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 考试管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/ksAdd2.jsp?type=1'
														target=dmMain>自动生成试卷</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=1'
														target=dmMain>自动试卷管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/ksAdd.jsp?type=2'
														target=dmMain>手动制定试卷</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=2'
														target=dmMain>手动试卷管理</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>


								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN
										class=span id=table_3Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 查询功能</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=8'
														target=dmMain>成绩查询</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<%
									} else if (type == 2) {
								%>

								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
										class=span id=table_1Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 题库</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/dxtAdd.jsp'
														target=dmMain>单选题添加</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/dxtList.action'
														target=dmMain>单选题管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/ddxtAdd.jsp'
														target=dmMain>多选题添加</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ddxtList.action'
														target=dmMain>多选题管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/pdAdd.jsp'
														target=dmMain>判断题添加</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/pdList.action' target=dmMain>判断题管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/bcAdd.jsp'
														target=dmMain>计算题添加</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/bcList.action' target=dmMain>计算题管理</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
										class=span id=table_2Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 试卷信息管理</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/ksAdd2.jsp?type=1'
														target=dmMain>自动生成试卷</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=1'
														target=dmMain>自动试卷管理</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/admin/ksAdd.jsp?type=2'
														target=dmMain>手动制定试卷</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=2'
														target=dmMain>手动试卷管理</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN
										class=span id=table_3Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 阅卷</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_3 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=6'
														target=dmMain>自动阅卷</A>
													</TD>
												</TR>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=7'
														target=dmMain>半自动阅卷</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>




								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN
										class=span id=table_Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 统计功能</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_4 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=8'
														target=dmMain>统计查询</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<%
									} else {
								%>
								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN
										class=span id=table_1Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 我的信息</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_1 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/myself.action' target=dmMain>我的信息</A>
													</TD>
												</TR>

											</TBODY>
										</TABLE>
									</TD>
								</TR>


								<TR>
									<TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN
										class=span id=table_2Span><img
											src="<%=path%>/images/311.gif">
									</SPAN> 我的考试</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table_2 style="DISPLAY: none" cellSpacing=0
											cellPadding=2 width=155 align=center border=0>
											<TBODY>
												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/ksList.action?type=0'
														target=dmMain>试卷列表</A>
													</TD>
												</TR>

												<TR>
													<TD class=menuSmall><img src="<%=path%>/images/a.gif"><A
														class=style2 href='<%=path%>/mycjlist.action'
														target=dmMain>历史成绩</A>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<%
									}
								%>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="<%=path%>/admin/YHMenu.files/new_009.jpg"></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="<%=path%>/admin/YHMenu.files/new_010.jpg" border=0>
					</TD>
					<TD align=middle width=180
						background="<%=path%>/admin/YHMenu.files/new_011.jpg" height=15><br>
					</TD>
					<TD width=15><IMG
						src="<%=path%>/admin/YHMenu.files/new_012.jpg" border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
