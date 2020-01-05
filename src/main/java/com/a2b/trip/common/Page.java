package com.a2b.trip.common;

public class Page implements java.io.Serializable {
	
	private static final long serialVersionUID = 20000L;
	
	private int totalCount;	//	전체 게시물 개수
	private int currentPage=1;	//	현재 페이지 번호
	private int contentNum=10;	//	한 페이지에 몇개 표시할지
	private int startPage=1;	//	현재 페이지 블록의 시작 페이지
	private int endPage=10;	//	현재 페이지 블록의 마지막 페이지
	private boolean prev=false;	//	이전 페이지로 가는 화살표
	private boolean next;	//	다음 페이지로 가는 화살표
	private int currentBlock;	//	현재 페이지 블록
	private int lastBlock;	//	마지막 페이지 블록
	private int startRow;	//db에서 조회할 시작 rowNum
	private int endRow;	//db에서 조회할 마지막 rowNum
	private int totalPage;	//	총 페이지 수
	
	public Page() {}

	public Page(int totalCount, int currentPage, int contentNum, int startPage, int endPage, boolean prev, boolean next,
			int currentBlock, int lastBlock, int startRow, int endRow, int totalPage) {
		super();
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.contentNum = contentNum;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.currentBlock = currentBlock;
		this.lastBlock = lastBlock;
		this.startRow = startRow;
		this.endRow = endRow;
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getContentNum() {
		return contentNum;
	}

	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}

	public int getLastBlock() {
		return lastBlock;
	}

	public void setLastBlock(int lastBlock) {
		this.lastBlock = lastBlock;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "Page [totalCount=" + totalCount + ", currentPage=" + currentPage + ", contentNum=" + contentNum
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", currentBlock=" + currentBlock + ", lastBlock=" + lastBlock + ", startRow=" + startRow + ", endRow="
				+ endRow + ", totalPage=" + totalPage + "]";
	}
	
	public void calcRow(int currentPage) {
		this.startRow = (currentPage * contentNum) - 9;
		this.endRow = currentPage * contentNum;
	}
	
	public void prevnext(int currentPage) {
		if(currentPage > 0 && currentPage < 11) {
			setPrev(false);
			setNext(true);
		}else if(getLastBlock() == getCurrentBlock()){
			setPrev(true);
			setNext(false);
		}else {
			setPrev(true);
			setNext(true);
		}
	}
	
	public int calcPage(int totalCount, int contentNum) {	//	전체 페이지 수를 계산하는 함수
		
		//	ex) 125개의 글 / 한 페이지의 게시글 10개 => 12.5
		//	총 13페이지
		
		//	ex) 50 / 10 => 5
		// 총 5페이지
		this.totalPage = totalCount / contentNum;
		if(totalCount%contentNum > 0)
			totalPage++;
		return totalPage;
	}
	
	public void saveStartPage(int currentBlock) {
		this.startPage = (currentBlock * 10)-9;
		//	현재 페이지 블록 1이면 1,2,3,4,5,6,7,8,9,10
		//	현재 페이지 블록 2이면 11,12,13,14,15,16,17,18,19,20
	}
	
	public void saveEndPage(int getLastBlock, int getCurrentBlock) {
		if(getLastBlock == getCurrentBlock)
			this.endPage = calcPage(getTotalCount(), getContentNum());
		else
			this.endPage = getStartPage() + 9;
	}
	
	public void saveCurrentBlock(int currentPage) {
		this.currentBlock = currentPage/10;
		if(currentPage % 10 > 0)
			this.currentBlock++;
	}
	
	public void saveLastBlock(int totalCount) {
		this.lastBlock = totalCount / (10 * this.contentNum);
		if(totalCount % (10 * this.contentNum) > 0)
			this.lastBlock++;
	}
	
}
