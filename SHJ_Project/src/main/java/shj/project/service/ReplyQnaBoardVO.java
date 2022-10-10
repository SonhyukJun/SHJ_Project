package shj.project.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReplyQnaBoardVO {
	private int replyQnaBoardNo;
	private int qnaBoardNo;
	private String replyContent;
	private Date replyWdate;
	private String memberId;
}
