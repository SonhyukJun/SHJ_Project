package shj.project.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewBoardVO {
	
	private int buyBoardNo;
	private String sellId;
	private String buyId;
	private int countingStars;
	private String reviewContent;
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 10;
	private int firstPage = 0;
	private int lastPage = 0;
	
}
