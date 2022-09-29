package shj.project.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int boardNo;
	private String title;
	private String content;
	private Date writeDate;
	private String boardType;	
	private String picture;
	private int countingStars;
	private String boardStatus;
	private int price;
	
	private String memberId;
	
	private String buyId;
	
	public BoardVO(String title, String content, Date writeDate, String boardType, String picture, int countingStars,
			String memberId, String boardStatus, int price) {
		super();
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.boardType = boardType;
		this.picture = picture;
		this.countingStars = countingStars;
		this.memberId = memberId;
		this.boardStatus = boardStatus;
		this.price = price;
	}
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 8;
	
	private int startIndex2 = 0;
	private int endIndex2 = 10;	
	
	private int pageList = 10;
	private int firstPage = 0;
	private int lastPage = 0;
	
}
