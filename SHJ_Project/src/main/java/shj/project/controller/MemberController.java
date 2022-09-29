package shj.project.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shj.project.service.MemberService;
import shj.project.service.MemberVO;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService service;

	@ResponseBody
	@RequestMapping(value = "/memberId_check", method = RequestMethod.POST)
	public String memberId_check(@RequestParam(name = "memberId") String memberId) throws Exception {
		String data = "";
		int result = service.memberId_check(memberId);
		if (result == 0) {
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUp(MemberVO memberVo, @RequestParam(name = "memberId") String memberId) throws Exception {
		String data = "";
		int result = service.memberId_check(memberId);
		if (result == 0) {
			service.signUp(memberVo);
			data = "ok";
		} else {
			data = "id";
		}
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
	public String memberLogin(MemberVO memberVo, @RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, HttpSession session) throws Exception {
		String data = "";
		memberVo.setMemberId(memberId);
		memberVo.setMemberPassword(memberPassword);
		int result = service.memberLogin(memberVo);
		System.out.println(result);
		if (result == 1) {
			String sessionId = service.sessionId(memberId);
			String sessionPassword = service.sessionPassword(memberId);
			String sessionName = service.sessionName(memberId);
			String sessionTelNumber = service.sessionTelNumber(memberId);
			String sessionAddress = service.sessionAddress(memberId);
			String sessionAuthority = service.sessionAuthority(memberId);
			session.setAttribute("SessionId", sessionId);
			session.setAttribute("SessionPassword", sessionPassword);
			session.setAttribute("SessionName", sessionName);
			session.setAttribute("SessionTelNumber", sessionTelNumber);
			session.setAttribute("SessionAddress", sessionAddress);
			session.setAttribute("SessionAuthority", sessionAuthority);
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPageForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/myPage";
		} else {
			return "loginCheck";
		}
	}
	
	@RequestMapping(value = "/modifyLogin.do", method = RequestMethod.GET)
	public String modifyLoginForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/modifyLogin";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMember.do", method = RequestMethod.GET)
	public String modifyMemberForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/modifyMember";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMemberPassword.do", method = RequestMethod.GET)
	public String modifyMemberPasswordForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/modifyMemberPassword";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMemberTelNumber.do", method = RequestMethod.GET)
	public String modifyMemberTelNumberForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/modifyMemberTelNumber";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyMemberAddress.do", method = RequestMethod.GET)
	public String modifyMemberAddressForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "member/modifyMemberAddress";
		} else {
			return "loginCheck";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyMemberPassword.do", method = RequestMethod.POST)
	public String modifyMemberPassword(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, MemberVO memberVo,
			HttpSession session) throws Exception {
		String data = "";
		memberVo.setMemberId(memberId);
		memberVo.setMemberPassword(memberPassword);
		service.modifyMemberPassword(memberVo);
		session.setAttribute("SessionPassword", memberPassword);
		data = "ok";
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyMemberTelNumber.do", method = RequestMethod.POST)
	public String modifyMemberTelNumber(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberTelNumber") String memberTelNumber, MemberVO memberVo,
			HttpSession session) throws Exception {
		String data = "";
		memberVo.setMemberId(memberId);
		memberVo.setMemberTelNumber(memberTelNumber);
		service.modifyMemberTelNumber(memberVo);
		session.setAttribute("SessionTelNumber", memberTelNumber);
		data = "ok";
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/modifyMemberAddress.do", method = RequestMethod.POST)
	public String modifyMemberAddress(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberAddress") String memberAddress, MemberVO memberVo,
			HttpSession session) throws Exception {
		String data = "";
		memberVo.setMemberId(memberId);
		memberVo.setMemberAddress(memberAddress);
		service.modifyMemberAddress(memberVo);
		session.setAttribute("SessionAddress", memberAddress);
		data = "ok";
		return data;
	}	

}
