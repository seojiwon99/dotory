package co.dotory.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {
	private int startPage,endPage;
	private boolean prev, next;
	
	private int total;
	private int curPage;
	
	public PageDTO(int curPage, int total) {
		this.curPage = curPage;
		this.total = total;
		
		this.endPage = (int)Math.ceil((double)curPage/10) * 10;
		this.startPage = this.endPage -9;
		
		int realEnd = (int)(Math.ceil((double)total / 10));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	@Override
	public String toString() {
		return "pageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", curPage=" + curPage + "]";
	}
}
