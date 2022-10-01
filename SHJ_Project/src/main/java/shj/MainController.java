package shj;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shj.project.service.BoardService;
import shj.project.service.BoardVO;

@Controller
public class MainController {

	@Resource(name = "boardService")
	private BoardService service;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(BoardVO boardVo, Model model) throws Exception {
		model.addAttribute("latelyBoard1", service.latelyBoard1(boardVo));
		model.addAttribute("latelyBoard2", service.latelyBoard2(boardVo));
		model.addAttribute("latelyBoard3", service.latelyBoard3(boardVo));
		model.addAttribute("latelyBoard4", service.latelyBoard4(boardVo));
		model.addAttribute("latelyBoard5", service.latelyBoard5(boardVo));
		model.addAttribute("latelyBoard6", service.latelyBoard6(boardVo));
		return "main";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			return "main";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUpForm() {
		return "member/signUp";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("SessionId");
		session.removeAttribute("SessionPassword");
		session.removeAttribute("SessionName");
		session.removeAttribute("SessionTelNumber");
		session.removeAttribute("SessionAddress");
		session.removeAttribute("SessionAuthority");
		return "main";
	}

	@RequestMapping(value = "/tradeForm.do", method = RequestMethod.GET)
	public String tradeForm() {
		return "trade/tradeMain";
	}

}
