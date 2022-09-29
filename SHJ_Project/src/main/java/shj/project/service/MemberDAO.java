package shj.project.service;

import java.util.List;

public interface MemberDAO {
	
	int memberId_check(String memberId) throws Exception;
	
	void signUp(MemberVO memberVo) throws Exception;
	
	int memberLogin(MemberVO memberVo) throws Exception;
	
	String sessionId(String memberId) throws Exception;
	
	String sessionPassword(String memberId) throws Exception;
	
	String sessionName(String memberId) throws Exception;
	
	String sessionTelNumber(String memberId) throws Exception;
	
	String sessionAddress(String memberId) throws Exception;
	
	String sessionAuthority(String memberId) throws Exception;
	
	void modifyMemberPassword(MemberVO memberVo) throws Exception;
	
	void modifyMemberTelNumber(MemberVO memberVo) throws Exception;
	
	void modifyMemberAddress(MemberVO memberVo) throws Exception;
	
	double totalStars(String memberId) throws Exception;
	
	List<MemberVO> listMemberAdmin(MemberVO memberVo) throws Exception;
	
	int totalMemberAdmin(MemberVO memberVo) throws Exception;
	
	void reportMember(String memberId) throws Exception;
	
	void clearMember(String memberId) throws Exception;
}
