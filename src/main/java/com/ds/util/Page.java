package com.ds.util;


public class Page {
	
	/**
	 * 第几页
	 */
	private Integer page = 1;
	/**
	 * 每页几条
	 */
	private Integer rows = 10;
	
	private Integer startIndex = 0;
	
	private Integer endIndex = 0;
	
	/**
	 * @作者: yuboyake
	 * @功能描述: 计算分页开始结束位置
	 * @时间: 2018/9/26 22:42
	 * @参数:  * @param
	 * @返回值: void
	 **/
	public void calculate(){
		this.startIndex = (page * rows) - rows;
		this.endIndex = page * rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}
	
	
}
