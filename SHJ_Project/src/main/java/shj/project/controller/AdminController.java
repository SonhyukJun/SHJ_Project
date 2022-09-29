package shj.project.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shj.project.service.BoardService;
import shj.project.service.BoardVO;
import shj.project.service.BuyBoardVO;
import shj.project.service.MemberService;
import shj.project.service.MemberVO;
import shj.project.service.ReportBoardVO;
import shj.project.service.ReviewBoardVO;

@Controller
public class AdminController {
	
	@Resource(name = "memberService")
	private MemberService serviceM;
	
	@Resource(name = "boardService")
	private BoardService serviceB;

	@RequestMapping(value = "/adminPage.do", method = RequestMethod.GET)
	public String adminPageForm(HttpSession session, HttpServletRequest request) {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			return "admin/adminPage";
		} else {
			return "authorityCheck";
		}
	}
	
	@RequestMapping(value = "/listMemberAdmin.do", method = RequestMethod.GET)
	public String listMemberAdmin(HttpSession session, HttpServletRequest request,
			Model model, MemberVO memberVo) throws Exception {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			int total = serviceM.totalMemberAdmin(memberVo);

			int totalPage = (int) Math.ceil((double) total / 10);
			int pageList = memberVo.getPageList();
			int viewPage = memberVo.getViewPage();

			int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
			int lastPage = firstPage + pageList - 1;
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			int startIndex = (viewPage - 1) * 10;
			int endIndex = 10;

			memberVo.setStartIndex(startIndex);
			memberVo.setEndIndex(endIndex);
			memberVo.setPageList(pageList);
			memberVo.setFirstPage(firstPage);
			memberVo.setLastPage(lastPage);

			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageList", pageList);
			model.addAttribute("firstPage", firstPage);
			model.addAttribute("lastPage", lastPage);
			
			List<MemberVO> list = serviceM.listMemberAdmin(memberVo);
			model.addAttribute("listMemberAdmin", list);
			return "admin/listMemberAdmin";
		} else {
			return "authorityCheck";
		}		
	}
	
	@RequestMapping(value = "/listBoardAdmin.do", method = RequestMethod.GET)
	public String listBoardAdmin(HttpSession session, HttpServletRequest request,
			Model model, BoardVO boardVo) throws Exception {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			int total = serviceB.totalBoard(boardVo);

			int totalPage = (int) Math.ceil((double) total / 10);
			int pageList = boardVo.getPageList();
			int viewPage = boardVo.getViewPage();

			int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
			int lastPage = firstPage + pageList - 1;
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			int startIndex = (viewPage - 1) * 10;
			int endIndex = 10;
			
			boardVo.setStartIndex2(startIndex);
			boardVo.setEndIndex2(endIndex);
			boardVo.setPageList(pageList);
			boardVo.setFirstPage(firstPage);
			boardVo.setLastPage(lastPage);

			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageList", pageList);
			model.addAttribute("firstPage", firstPage);
			model.addAttribute("lastPage", lastPage);
			
			List<BoardVO> list = serviceB.listboardAdmin(boardVo);
			model.addAttribute("listBoardAdmin", list);
			return "admin/listBoardAdmin";
		} else {
			return "authorityCheck";
		}		
	}
	
	@RequestMapping(value = "/listBuyBoardAdmin.do", method = RequestMethod.GET)
	public String listBuyBoardAdmin(HttpSession session, HttpServletRequest request,
			Model model, BuyBoardVO buyBoardVo) throws Exception {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			int total = serviceB.totalBuyBoard(buyBoardVo);

			int totalPage = (int) Math.ceil((double) total / 10);
			int pageList = buyBoardVo.getPageList();
			int viewPage = buyBoardVo.getViewPage();

			int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
			int lastPage = firstPage + pageList - 1;
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			int startIndex = (viewPage - 1) * 10;
			int endIndex = 10;
			
			buyBoardVo.setStartIndex(startIndex);
			buyBoardVo.setEndIndex(endIndex);
			buyBoardVo.setPageList(pageList);
			buyBoardVo.setFirstPage(firstPage);
			buyBoardVo.setLastPage(lastPage);

			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageList", pageList);
			model.addAttribute("firstPage", firstPage);
			model.addAttribute("lastPage", lastPage);
			
			List<BuyBoardVO> list = serviceB.listBuyBoardAdmin(buyBoardVo);
			model.addAttribute("listBuyBoardAdmin", list);
			return "admin/listBuyBoardAdmin";
		} else {
			return "authorityCheck";
		}		
	}
	
	@RequestMapping(value = "/listReviewBoardAdmin.do", method = RequestMethod.GET)
	public String listReviewBoardAdmin(HttpSession session, HttpServletRequest request,
			Model model, ReviewBoardVO reviewBoardVo) throws Exception {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			int total = serviceB.totalReview(reviewBoardVo);

			int totalPage = (int) Math.ceil((double) total / 10);
			int pageList = reviewBoardVo.getPageList();
			int viewPage = reviewBoardVo.getViewPage();

			int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
			int lastPage = firstPage + pageList - 1;
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			int startIndex = (viewPage - 1) * 10;
			int endIndex = 10;
			
			reviewBoardVo.setStartIndex(startIndex);
			reviewBoardVo.setEndIndex(endIndex);
			reviewBoardVo.setPageList(pageList);
			reviewBoardVo.setFirstPage(firstPage);
			reviewBoardVo.setLastPage(lastPage);

			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageList", pageList);
			model.addAttribute("firstPage", firstPage);
			model.addAttribute("lastPage", lastPage);
			
			List<ReviewBoardVO> list = serviceB.listReviewBoardAdmin(reviewBoardVo);
			model.addAttribute("listReviewBoardAdmin", list);
			return "admin/listReviewBoardAdmin";
		} else {
			return "authorityCheck";
		}		
	}
	
	@RequestMapping(value = "/listReportBoardAdmin.do", method = RequestMethod.GET)
	public String listReportBoardAdmin(HttpSession session, HttpServletRequest request,
			Model model, ReportBoardVO reportBoardVo) throws Exception {
		String sessionAuthority = "";
		session = request.getSession();
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionAuthority.equals("Admin")) {
			int total = serviceB.totalReport(reportBoardVo);

			int totalPage = (int) Math.ceil((double) total / 10);
			int pageList = reportBoardVo.getPageList();
			int viewPage = reportBoardVo.getViewPage();

			int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
			int lastPage = firstPage + pageList - 1;
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			int startIndex = (viewPage - 1) * 10;
			int endIndex = 10;
			
			reportBoardVo.setStartIndex(startIndex);
			reportBoardVo.setEndIndex(endIndex);
			reportBoardVo.setPageList(pageList);
			reportBoardVo.setFirstPage(firstPage);
			reportBoardVo.setLastPage(lastPage);

			model.addAttribute("totalPage", totalPage);
			model.addAttribute("pageList", pageList);
			model.addAttribute("firstPage", firstPage);
			model.addAttribute("lastPage", lastPage);
			
			List<ReportBoardVO> list = serviceB.listReportBoardAdmin(reportBoardVo);
			model.addAttribute("listReportBoardAdmin", list);
			return "admin/listReportBoardAdmin";
		} else {
			return "authorityCheck";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "/reportAccept.do", method = RequestMethod.GET)
	public String reportAccept(@RequestParam(name = "reportMemberId") String reportMemberId) throws Exception {
		String data = "";
		serviceM.reportMember(reportMemberId);
		data = "ok";
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reportClear.do", method = RequestMethod.GET)
	public String reportClear(@RequestParam(name="reportMemberId") String reportMemberId) throws Exception {
		String data = "";
		serviceM.clearMember(reportMemberId);
		data = "ok";
		return data;
	}

	
}
