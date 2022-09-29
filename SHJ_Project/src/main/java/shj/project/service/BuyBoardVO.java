package shj.project.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyBoardVO {
	private int buyBoardNo;
	private String buyTitle;
	private String buyMemberId;
	private int buyPrice;
	private String buyId;
	private String buyStatus;
	
	private String searchCondition3;
	private String searchKeyword3;
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 10;
	private int firstPage = 0;
	private int lastPage = 0;
}
