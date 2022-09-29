package shj.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import shj.project.service.BoardService;
import shj.project.service.BoardVO;
import shj.project.service.BuyBoardVO;
import shj.project.service.ReportBoardVO;
import shj.project.service.ReviewBoardVO;
import shj.project.service.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardDAOMybatis")
	private BoardDAO dao;

	@Override
	public void insertBoard(BoardVO boardVo) throws Exception {
		dao.insertBoard(boardVo);
	}

	@Override
	public List<BoardVO> listBoard(BoardVO boardVo) throws Exception {		
		return dao.listBoard(boardVo);
	}

	@Override
	public BoardVO selectDetailTrade(int boardNo) throws Exception {
		return dao.selectDetailTrade(boardNo);
	}

	@Override
	public int totalBoard(BoardVO boardVo) throws Exception {
		int result = dao.totalBoard(boardVo);
		return result;
	}
	
	@Override
	public void modifyStatus(int boardNo) throws Exception {
		dao.modifyStatus(boardNo);
	}
	
	@Override
	public void tradeSend(int boardNo) throws Exception {
		dao.tradeSend(boardNo);
	}
	
	@Override
	public void tradeReceive(int boardNo) throws Exception {
		dao.tradeReceive(boardNo);
	}
	
	@Override
	public void tradeDelete(int boardNo) throws Exception {
		dao.tradeDelete(boardNo);
	}

	@Override
	public void tradeCancle(int boardNo) throws Exception {
		dao.tradeCancle(boardNo);
	}

	@Override
	public void modifyTradeInPicture(BoardVO boardVo) throws Exception {
		dao.modifyTradeInPicture(boardVo);
	}

	@Override
	public void modifyTradeNoPicture(BoardVO boardVo) throws Exception {
		dao.modifyTradeNoPicture(boardVo);
	}

	
	//***********************************************************************

	@Override
	public void insertBuyboard(BuyBoardVO buyBoardVo) throws Exception {
		dao.insertBuyboard(buyBoardVo);
	}

	@Override
	public void tradeCancleD(int boardNo) throws Exception {
		dao.tradeCancleD(boardNo);
	}
	
	@Override
	public void tradeStatusW(int buyBoardNo) throws Exception {
		dao.tradeStatusW(buyBoardNo);
	}

	@Override
	public void tradeStatusE(int buyBoardNo) throws Exception {
		dao.tradeStatusE(buyBoardNo);
	}

	@Override
	public int totalBuyBoard(BuyBoardVO buyBoardVo) throws Exception {
		int result = dao.totalBuyBoard(buyBoardVo);
		return result;
	}
	
	//***********************************************************************
	
	@Override
	public List<BoardVO> myTradeSell(BoardVO boardVo) throws Exception {		
		return dao.myTradeSell(boardVo);
	}

	@Override
	public int totalMyTrade(String memberId) throws Exception {
		int result = dao.totalMyTrade(memberId);
		return result;
	}

	@Override
	public List<BoardVO> myTradeBuy(BoardVO boardVo) throws Exception {
		return dao.myTradeBuy(boardVo);
	}

	@Override
	public int totalMyTradeBuy(String buyId) throws Exception {
		int result = dao.totalMyTradeBuy(buyId);
		return result;
	}
	
	//***********************************************************************

	@Override
	public int reviewStatusCheck(int buyBoardNo) throws Exception {
		int result = dao.reviewStatusCheck(buyBoardNo);
		return result;
	}

	@Override
	public void reviewInsert(ReviewBoardVO reviewBoardVo) throws Exception {
		dao.reviewInsert(reviewBoardVo);
	}

	@Override
	public List<ReviewBoardVO> reviewView(ReviewBoardVO reviewBoardVo) throws Exception {
		return dao.reviewView(reviewBoardVo);
	}

	@Override
	public int totalReviewBoard(ReviewBoardVO reviewBoardVo) throws Exception {
		int result = dao.totalReviewBoard(reviewBoardVo);
		return result;
	}
	
	//***********************************************************************

	@Override
	public void reportInsert(ReportBoardVO reportBoardVo) throws Exception {
		dao.reportInsert(reportBoardVo);
	}

	@Override
	public int totalReport(ReportBoardVO reportBoardVo) throws Exception {
		int result = dao.totalReport(reportBoardVo);
		return result;
	}
	
	// ***********************************************************************
	
	@Override
	public List<BoardVO> listboardAdmin(BoardVO boardVo) throws Exception {
		return dao.listboardAdmin(boardVo);
	}

	@Override
	public List<BuyBoardVO> listBuyBoardAdmin(BuyBoardVO buyBoardVo) throws Exception {
		return dao.listBuyBoardAdmin(buyBoardVo);
	}

	@Override
	public int totalReview(ReviewBoardVO reviewBoardVo) throws Exception {
		int result = dao.totalReview(reviewBoardVo);
		return result;
	}

	@Override
	public List<ReviewBoardVO> listReviewBoardAdmin(ReviewBoardVO reviewBoardVo) throws Exception {
		return dao.listReviewBoardAdmin(reviewBoardVo);
	}

	@Override
	public List<ReportBoardVO> listReportBoardAdmin(ReportBoardVO reportBoardVo) throws Exception {
		return dao.listReportBoardAdmin(reportBoardVo);
	}

}
