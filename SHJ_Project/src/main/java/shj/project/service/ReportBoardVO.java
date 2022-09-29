package shj.project.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportBoardVO {

	private int reportBoardNo;
	private String reportMemberId;
	private String reportTitle;
	private Date reportDate;
	private String reportContent;
	private String memberId;
	private String authority;
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 10;
	private int firstPage = 0;
	private int lastPage = 0;
}
