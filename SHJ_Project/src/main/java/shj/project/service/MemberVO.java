package shj.project.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {	
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberTelNumber;
	private String memberAddress;
	private String authority;
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 10;
	private int firstPage = 0;
	private int lastPage = 0;
	
}
