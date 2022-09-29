package shj.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import shj.project.service.BoardService;
import shj.project.service.BoardVO;
import shj.project.service.BuyBoardVO;
import shj.project.service.MemberService;
import shj.project.service.ReportBoardVO;
import shj.project.service.ReviewBoardVO;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService service;

	@Resource(name = "memberService")
	private MemberService serviceM;

	@RequestMapping(value = "/tradeInsert.do", method = RequestMethod.GET)
	public String tradeInsertForm(HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		String sessionAuthority = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		sessionAuthority = (String) session.getAttribute("SessionAuthority");
		if (sessionId != null) {
			if (sessionAuthority.equals("Y") || sessionAuthority.equals("Admin")) {
				return "trade/tradeInsert";
			} else {
				return "authorityCheck";
			}
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/tradeInsert.do", method = RequestMethod.POST)
	public String tradeInsert(@RequestParam("file") MultipartFile file,
			@RequestParam(name = "boardType") String boardType, HttpSession session, HttpServletRequest request,
			BoardVO boardVo) throws Exception {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			String type = "";
			if (boardType.equals("판매")) {
				type = "S";
			} else if (boardType.equals("구매")) {
				type = "B";
			}

			String fileRealName = file.getOriginalFilename();
			long size = file.getSize();

			String fileExtension = "";

			if (fileRealName != "") {
				fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			}

			String uploadFoler = "C:\\Users\\HP\\git\\SHJ_Project\\SHJ_Project\\src\\main\\webapp\\resource\\upload";

			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];

			boardVo.setMemberId(sessionId);
			boardVo.setPicture(uniqueName + fileExtension);
			boardVo.setBoardStatus(type);
			service.insertBoard(boardVo);

			File saveFile = new File(uploadFoler + "\\" + uniqueName + fileExtension); // 적용 후
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:tradeList.do";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/tradeList.do")
	public String tradeListForm(BoardVO boardVo, Model model) throws Exception {
		int total = service.totalBoard(boardVo);

		int totalPage = (int) Math.ceil((double) total / 8);
		int pageList = boardVo.getPageList();
		int viewPage = boardVo.getViewPage();

		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 8;
		int endIndex = 8;

		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);
		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
		
		if(boardVo.getSearchCondition()==null) {
			boardVo.setSearchCondition("TITLE");
		}
		if(boardVo.getSearchKeyword()==null) {
			boardVo.setSearchKeyword("");
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("boardList", service.listBoard(boardVo));
		return "trade/tradeList";
	}

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("카테고리", "ITEMTYPE");		
		return conditionMap;
	}
	
	@RequestMapping(value = "/selectDetailTrade.do", method = RequestMethod.GET)
	public String selectDetailTradeForm(int boardNo, Model model, String memberId) throws Exception {
		double stars = serviceM.totalStars(memberId);
		System.out.println(stars);
		model.addAttribute("selectDetailTrade", service.selectDetailTrade(boardNo));
		model.addAttribute("totalStars", stars);
		return "trade/selectDetailTrade";
	}

	@RequestMapping(value = "/modifyInsert.do", method = RequestMethod.GET)
	public String modifyInsertForm(@ModelAttribute("selectDetailTrade") BoardVO boardVo, String memberId, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId.equals(memberId)) {
			model.addAttribute("selectDetailTrade", service.selectDetailTrade(boardVo.getBoardNo()));
			return "trade/modifyInsert";
		} else {
			return "loginCheck";
		}
	}

	@RequestMapping(value = "/modifyInsert.do", method = RequestMethod.POST)
	public String modifyInsert(@RequestParam("file") MultipartFile file,
			@RequestParam(name = "boardType") String boardType, HttpSession session, HttpServletRequest request,
			BoardVO boardVo) throws Exception {

		String type = "";
		if (boardType.equals("판매")) {
			type = "S";
		} else if (boardType.equals("구매")) {
			type = "B";
		}

		String fileRealName = file.getOriginalFilename();
		long size = file.getSize();

		String fileExtension = "";

		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionId");

		if (fileRealName != "") {
			fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFoler = "C:\\Users\\HP\\git\\SHJ_Project\\SHJ_Project\\src\\main\\webapp\\resource\\upload";

			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];

			boardVo.setMemberId(memberId);
			boardVo.setPicture(uniqueName + fileExtension);
			boardVo.setBoardStatus(type);
			service.modifyTradeInPicture(boardVo);

			File saveFile = new File(uploadFoler + "\\" + uniqueName + fileExtension); // 적용 후
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			boardVo.setMemberId(memberId);
			service.modifyTradeNoPicture(boardVo);
		}
		return "redirect:tradeList.do";
	}

	// *************************************************************************

	@ResponseBody
	@RequestMapping(value = "/buyBoard.do", method = RequestMethod.POST)
	public String buyBoardForm(HttpSession session, HttpServletRequest request, BuyBoardVO buyBoardVo,
			@RequestParam(name = "buyBoardNo") int buyBoardNo) throws Exception {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		String data = "";
		if (sessionId != null) {
			service.insertBuyboard(buyBoardVo);
			int boardNo = buyBoardNo;
			service.modifyStatus(boardNo);
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}

	@RequestMapping(value = "/myTrade.do", method = RequestMethod.GET)
	public String myTradeSellForm(HttpSession session, HttpServletRequest request, Model model, BoardVO boardVo)
			throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionId");
		if (memberId != null) {
			boardVo.setMemberId(memberId);
			boardVo.setBuyId(memberId);
			model.addAttribute("myTradeSell", service.myTradeSell(boardVo));
			model.addAttribute("myTradeBuy", service.myTradeBuy(boardVo));
			return "member/myTrade";
		} else {
			return "loginCheck";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/tradeSend.do", method = RequestMethod.POST)
	public String tradeSend(int boardNo) throws Exception {
		String data = "";
		service.tradeSend(boardNo);
		data = "ok";
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/tradeReceive.do", method = RequestMethod.POST)
	public String tradeReceive(int boardNo) throws Exception {
		String data = "";
		service.tradeReceive(boardNo);
		service.tradeStatusW(boardNo);
		data = "ok";
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/tradeDelete.do", method = RequestMethod.POST)
	public String tradeDelete(int boardNo) throws Exception {
		String data = "";
		service.tradeDelete(boardNo);
		data = "ok";
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/tradeCancle.do", method = RequestMethod.POST)
	public String tradeCancle(int boardNo) throws Exception {
		String data = "";
		service.tradeCancle(boardNo);
		service.tradeCancleD(boardNo);
		data = "ok";
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/reviewStatusCheck.do", method = RequestMethod.GET)
	public String reviewStatusCheck(int buyBoardNo, String buyMemberId, HttpSession session) throws Exception {
		String data = "";
		int result = service.reviewStatusCheck(buyBoardNo);
		if (result == 1) {
			session.setAttribute("BuyMemberId", buyMemberId);
			session.setAttribute("BuyBoardNo", buyBoardNo);
			data = "ok";
		} else {
			data = "no";
		}
		return data;
	}

	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.GET)
	public String reviewInsertForm() {
		return "trade/reviewInsert";
	}

	@ResponseBody
	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.POST)
	public String reviewInsert(ReviewBoardVO reviewBoardVo, HttpSession session) throws Exception {
		String data = "";
		service.reviewInsert(reviewBoardVo);
		service.tradeStatusE(reviewBoardVo.getBuyBoardNo());
		session.removeAttribute("BuyMemberId");
		session.removeAttribute("BuyBoardNo");
		data = "ok";
		return data;
	}

	@RequestMapping(value = "/reviewView.do", method = RequestMethod.GET)
	public String reviewViewForm(@RequestParam(name = "memberId") String sellId, Model model,
			ReviewBoardVO reviewBoardVo) throws Exception {
		reviewBoardVo.setSellId(sellId);
//		int total = service.totalReviewBoard(reviewBoardVo);
		List<ReviewBoardVO> list = service.reviewView(reviewBoardVo);

//		int totalPage = (int) Math.ceil((double) total / 10);
//		int pageList = reviewBoardVo.getPageList();
//		int viewPage = reviewBoardVo.getViewPage();
//
//		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
//		int lastPage = firstPage + pageList - 1;
//		if (lastPage > totalPage) {
//			lastPage = totalPage;
//		}
//		int startIndex = (viewPage - 1) * 10;
//		int endIndex = 10;
//
//		reviewBoardVo.setStartIndex(startIndex);
//		reviewBoardVo.setEndIndex(endIndex);
//		reviewBoardVo.setPageList(pageList);
//		reviewBoardVo.setFirstPage(firstPage);
//		reviewBoardVo.setLastPage(lastPage);
//
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("pageList", pageList);
//		model.addAttribute("firstPage", firstPage);
//		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("sellId", sellId);
		model.addAttribute("reviewList", list);

		return "trade/reviewView";
	}

	@RequestMapping(value = "/dangerMember.do", method = RequestMethod.GET)
	public String dangerMemberForm(@RequestParam(name = "boardNo") int boardNo,
			@RequestParam(name = "memberId") String memberId, @RequestParam(name = "title") String title, Model model,
			HttpSession session, HttpServletRequest request) {
		String sessionId = "";
		session = request.getSession();
		sessionId = (String) session.getAttribute("SessionId");
		if (sessionId != null) {
			model.addAttribute("reportBoardNo", boardNo);
			model.addAttribute("reportMemberId", memberId);
			model.addAttribute("reportTitle", title);
			return "member/reportMember";
		} else {
			return "loginCheck";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/dangerMember.do", method = RequestMethod.POST)
	public String dangerMember(ReportBoardVO reportBoardVo) throws Exception {
		String data = "";
		service.reportInsert(reportBoardVo);
		data = "ok";
		return data;
	}
}
