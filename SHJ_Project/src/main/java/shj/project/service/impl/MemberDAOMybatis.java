package shj.project.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import shj.project.service.MemberDAO;
import shj.project.service.MemberVO;

@Repository("memberDAOMybatis")
public class MemberDAOMybatis extends EgovAbstractMapper implements MemberDAO {

	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = selectOne("memberId_check", memberId);
		return result;
	}

	@Override
	public void signUp(MemberVO memberVo) throws Exception {
		insert("signUp", memberVo);		
	}

	@Override
	public int memberLogin(MemberVO memberVo) throws Exception {
		int result = selectOne("memberLogin", memberVo);
		return result;
	}

	@Override
	public String sessionId(String memberId) throws Exception {
		String sessionId = selectOne("sessionId", memberId);
		return sessionId;
	}

	@Override
	public String sessionPassword(String memberId) throws Exception {
		String sessionPassword = selectOne("sessionPassword", memberId);
		return sessionPassword;
	}

	@Override
	public String sessionName(String memberId) throws Exception {
		String sessionName = selectOne("sessionName", memberId);
		return sessionName;
	}

	@Override
	public String sessionTelNumber(String memberId) throws Exception {
		String sessionTelNumber = selectOne("sessionTelNumber", memberId);
		return sessionTelNumber;
	}
	
	@Override
	public String sessionPostCode(String memberId) throws Exception {
		String sessionPostCode = selectOne("sessionPostCode", memberId);
		return sessionPostCode;
	}

	@Override
	public String sessionAddress(String memberId) throws Exception {
		String sessionAddress = selectOne("sessionAddress", memberId);
		return sessionAddress;
	}
	
	@Override
	public String sessionAuthority(String memberId) throws Exception {
		String sessionAuthority = selectOne("sessionAuthority", memberId);
		return sessionAuthority;
	}

	@Override
	public void modifyMemberPassword(MemberVO memberVo) throws Exception {
		update("modifyMemberPassword", memberVo);		
	}

	@Override
	public void modifyMemberTelNumber(MemberVO memberVo) throws Exception {
		update("modifyMemberTelNumber", memberVo);		
	}

	@Override
	public void modifyMemberAddress(MemberVO memberVo) throws Exception {
		update("modifyMemberAddress", memberVo);		
	}

	@Override
	public double totalStars(String memberId) throws Exception {
		double result = selectOne("totalStars", memberId);
		return result;
	}

	@Override
	public List<MemberVO> listMemberAdmin(MemberVO memberVo) throws Exception {
		return selectList("listMemberAdmin", memberVo);
	}

	@Override
	public int totalMemberAdmin(MemberVO memberVo) throws Exception {
		int result = selectOne("totalMemberAdmin", memberVo);
		return result;
	}

	@Override
	public void reportMember(String memberId) throws Exception {
		update("reportMember", memberId);
	}

	@Override
	public void clearMember(String memberId) throws Exception {
		update("clearMember", memberId);
	}

	@Override
	public String memberAuthorityCheck(String memberId) throws Exception {
		String result = selectOne("memberAuthorityCheck", memberId);
		return result;
	}

}
