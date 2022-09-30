package shj.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import shj.project.service.MemberDAO;
import shj.project.service.MemberService;
import shj.project.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAOMybatis")
	private MemberDAO dao;

	@Override
	public void signUp(MemberVO memberVo) throws Exception {
		dao.signUp(memberVo);
	}
	
	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = dao.memberId_check(memberId);
		return result;
	}

	@Override
	public int memberLogin(MemberVO memberVo) throws Exception {
		int result = dao.memberLogin(memberVo);
		return result;
	}

	@Override
	public String sessionId(String memberId) throws Exception {
		String sessionId = dao.sessionId(memberId);
		return sessionId;
	}	

	@Override
	public String sessionPassword(String memberId) throws Exception {
		String sessionPassword = dao.sessionPassword(memberId);
		return sessionPassword;
	}	

	@Override
	public String sessionName(String memberId) throws Exception {
		String sessionName = dao.sessionName(memberId);
		return sessionName;
	}

	@Override
	public String sessionTelNumber(String memberId) throws Exception {
		String sessionTelNumber = dao.sessionTelNumber(memberId);
		return sessionTelNumber;
	}
	
	@Override
	public String sessionAuthority(String memberId) throws Exception {
		String sessionAuthority = dao.sessionAuthority(memberId);
		return sessionAuthority;
	}

	@Override
	public String sessionAddress(String memberId) throws Exception {
		String sessionAddress = dao.sessionAddress(memberId);
		return sessionAddress;
	}

	@Override
	public void modifyMemberPassword(MemberVO memberVo) throws Exception {
		dao.modifyMemberPassword(memberVo);		
	}

	@Override
	public void modifyMemberTelNumber(MemberVO memberVo) throws Exception {
		dao.modifyMemberTelNumber(memberVo);
	}

	@Override
	public void modifyMemberAddress(MemberVO memberVo) throws Exception {
		dao.modifyMemberAddress(memberVo);
	}

	@Override
	public double totalStars(String memberId) throws Exception {
		double result = dao.totalStars(memberId); 
		return result;
	}

	@Override
	public List<MemberVO> listMemberAdmin(MemberVO memberVo) throws Exception {
		return dao.listMemberAdmin(memberVo);
	}

	@Override
	public int totalMemberAdmin(MemberVO memberVo) throws Exception {
		int result = dao.totalMemberAdmin(memberVo);
		return result;
	}

	@Override
	public void reportMember(String memberId) throws Exception {
		dao.reportMember(memberId);
	}

	@Override
	public void clearMember(String memberId) throws Exception {
		dao.clearMember(memberId);
	}

	@Override
	public String memberAuthorityCheck(String memberId) throws Exception {
		String result = dao.memberAuthorityCheck(memberId);
		return result;
	}

}
