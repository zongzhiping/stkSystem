package com.util;

import java.util.List;

//封装页面显示逻辑
public class Pagination
{

	private int totle;// 总共的数据量

	private int pageSize;// 每页显示多少条

	private int totlePage;// 共有多少页

	private int index;// 当前是第几页

	private List data; // 数据

	private int prePage; //上一页

	private int nextPage; //下一页

	private String path;// 连接路径

	public int getTotle() {
		return totle;
	}

	public void setTotle(int totle) {
		this.totle = totle;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotlePage() {
		return totlePage;
	}

	public void setTotlePage(int totlePage) {
		this.totlePage = totlePage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	//	public void setTotle(int totle)
//	{
//		this.totle = totle;
//	}
//
//	public void setPageSize(int pageSize)
//	{
//		this.pageSize = pageSize;
//	}
//
//	public void setIndex(int index)
//	{
//		this.index = index;
//	}
//
//	public void setPath(String path)
//	{
//		this.path = path;
//	}
//
//	public int getTotle()
//	{
//		return totle;
//	}
//
//	public int getPageSize()
//	{
//		return pageSize;
//	}
//
//	public int getTotlePage()
//	{
//		return (this.totle + this.pageSize - 1) / this.pageSize;
//	}
//
//	public int getIndex()
//	{
//		return index;
//	}
//
//	public List getData()
//	{
//		return data;
//	}
//
//	public void setData(List data)
//	{
//		this.data = data;
//	}
//
//	public void setTotlePage(int totlePage) {
//		this.totlePage = totlePage;
//	}
//
//	public int getPrePage() {
//		return prePage;
//	}
//
//	public void setPrePage(int prePage) {
//		this.prePage = prePage;
//	}
//
//	public int getNextPage() {
//		return nextPage;
//	}
//
//	public void setNextPage(int nextPage) {
//		this.nextPage = nextPage;
//	}

	//	public String getPageDisplay()
//	{
//		StringBuffer displayInfo = new StringBuffer();
//		if (index == 0 || pageSize == 0)
//		{
//			displayInfo.append("没有分页的信息!");
//		} else
//		{
//			displayInfo.append("<div>");
//			displayInfo.append("共" + totle
//					+ "条记录&nbsp;&nbsp;&nbsp;&nbsp;每页<span style='color:#FF0000'>" + pageSize
//					+ "</span>条&nbsp;&nbsp;&nbsp;&nbsp;");
//			displayInfo.append("第<span style='color:#FF0000'>" + index
//					+ "</span>页/共" + this.getTotlePage() + "页&nbsp;&nbsp;&nbsp;&nbsp;");
//			// 判断如果当前是第一页 则“首页”和“第一页”失去链接
//			if (index == 1)
//			{
//				displayInfo.append("首页&nbsp;&nbsp;&nbsp;&nbsp;");
//				displayInfo.append("上一页&nbsp;&nbsp;&nbsp;&nbsp;");
//			} else
//			{
//				displayInfo.append("<a href='" + path
//						+ "index=1'>首页&nbsp;&nbsp;&nbsp;&nbsp;</a>");
//				displayInfo.append("<a href='" + path + "index=" + (index - 1)
//						+ "'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;");
//			}
//			if (index >= this.getTotlePage())
//			{
//				displayInfo.append("下一页&nbsp;&nbsp;&nbsp;&nbsp;");
//				displayInfo.append("末页&nbsp;&nbsp;&nbsp;&nbsp;");
//			} else
//			{
//				displayInfo.append("<a href='" + path + "index=" + (index + 1)
//						+ "'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>");
//				displayInfo.append("<a href='" + path + "index="
//						+ this.getTotlePage() + "'>末页</a>&nbsp;&nbsp;&nbsp;&nbsp;");
//			}
//			displayInfo.append("</div>");
//		}
//		return displayInfo.toString();
//	}
}
