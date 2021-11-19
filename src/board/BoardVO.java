package board;

public class BoardVO {
	private int bId;
	private String bTitle;

	private String userId;
	private String bDate;
	private String bContent;
	private int bAvailable;
	private String bimage;

	public String getbimage(){
		return bimage;
	}
	public void setbimage(String bimage) {
		this.bimage = bimage;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getuserId() {
		return userId;
	}
	public void setuserId(String userId) {
		this.userId = userId;

	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbAvailable() {
		return bAvailable;
	}
	public void setbAvailable(int bAvailable) {
		this.bAvailable = bAvailable;
	}
}
