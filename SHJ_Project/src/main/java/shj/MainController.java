package shj;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
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
