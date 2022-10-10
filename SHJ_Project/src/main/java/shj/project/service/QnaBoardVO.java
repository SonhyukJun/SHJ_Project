package shj.project.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QnaBoardVO {
	private int qnaBoardNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaWdate;
	private String memberId;
	private String qnaCheck;	
}
