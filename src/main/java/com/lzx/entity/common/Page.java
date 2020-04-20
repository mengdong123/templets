package com.lzx.entity.common;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 	分页page实体类
 */
public class Page<T> {
	
	private Collection<T> res;// 结果集
	private Long totalCount;// 总条数
	private int currentPage;// 当前页
	private int totalPage;// 总页数
	private int count;// 每页条数
	private Map<String,Integer> pagerDisplay = new LinkedHashMap<String, Integer>();//分页条显示内容=跳转时参数
	private String lastPage = "«";
	private String nextPage = "»";
	
	/**
	 * 根据用户传递的List、当前页、每页数量计算所需所有数据
	 * 其中pagerDisplay属性在调用get方法时才会计算
	 * @param wholeData
	 * @param currentPage
	 * @param count
	 */
	public Page(Collection<T> data,int currentPage, int count) {
		totalCount = (long) data.size();
		this.currentPage = currentPage;
		this.count = count;
		res = new ArrayList<>();
		List<T> wholeData = new ArrayList<>(data);
		totalPage = (int) (totalCount % count == 0 ? totalCount / count : totalCount / count + 1);
		for(int i = (currentPage-1)*count;i < (currentPage-1)*count + count; i++) {
			if (i == totalCount) {
				break;
			}
			res.add(wholeData.get(i));
		}
	}
	
	public String getLastPage() {
		return lastPage;
	}

	public void setLastPage(String lastPage) {
		this.lastPage = lastPage;
	}

	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

	public Collection<T> getRes() {
		return res;
	}

	public void setRes(Collection<T> res) {
		this.res = res;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setPagerDisplay(Map<String, Integer> pagerDisplay) {
		this.pagerDisplay = pagerDisplay;
	}

	public Map<String, Integer> getPagerDisplay() {
		if (totalPage <= 1) {
			//只有一页不显示分页按钮
		}
//		else if (totalPage <= 5) {
//			//总页数少于5，只显示页码按钮
//			for(int i = 0; i < totalPage; i++) {
//				pagerDisplay.put(i+1+"", i+1);
//			}
//		}
		else if (totalPage <= 10) {
			//总页数6到10，显示上一页下一页按钮
			pagerDisplay.put(lastPage, currentPage == 1?1:currentPage-1);
			for(int i = 0; i < totalPage; i++) {
				pagerDisplay.put(i+1+"", i+1);
			}
			pagerDisplay.put(nextPage, currentPage == totalPage?totalPage:currentPage+1);
		}else if (currentPage < 6) {
			//超过10页且当前页小于8，不显示前面的...
			pagerDisplay.put(lastPage, currentPage == 1?1:currentPage-1);
			for(int i = 0; i < 8; i++) {
				pagerDisplay.put(i+1+"", i+1);
			}
			pagerDisplay.put("...", 9);
			pagerDisplay.put(totalPage+"", totalPage);
			pagerDisplay.put(nextPage, currentPage+1);
		}else if(currentPage > totalPage-6) {
			pagerDisplay.put(lastPage, currentPage-1);//因为当前页面肯定不是第1页
			pagerDisplay.put("1", 1);
			pagerDisplay.put("...", totalPage-8);
			for(int i = 0; i < 8; i++) {
				pagerDisplay.put(i+totalPage-7+"", i+totalPage-7);
			}
			pagerDisplay.put(nextPage, currentPage == totalPage?totalPage:currentPage+1);
		}else {
			pagerDisplay.put(lastPage, currentPage-1);
			pagerDisplay.put("1", 1);
			pagerDisplay.put("...",currentPage-3);
			for(int i = 0; i < 6; i++) {
				pagerDisplay.put(i+currentPage-2+"", i+currentPage-2);
			}
			pagerDisplay.put("....",currentPage+4);
			pagerDisplay.put(totalPage+"", totalPage);
			pagerDisplay.put(nextPage, currentPage+1);
		}
		return pagerDisplay;
	}
	
	
}
