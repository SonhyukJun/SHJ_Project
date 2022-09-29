package shj.project.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import shj.project.service.BoardDAO;
import shj.project.service.BoardVO;
import shj.project.service.BuyBoardVO;
import shj.project.service.ReportBoardVO;
import shj.project.service.ReviewBoardVO;

@Repository("boardDAOMybatis")
public class BoardDAOMybatis extends EgovAbstractMapper implements BoardDAO {

	@Override
	public void insertBoard(BoardVO boardVo) throws Exception {
		insert("insertBoard", boardVo);
	}

	@Override
	public List<BoardVO> listBoard(BoardVO boardVo) throws Exception {		
		return selectList("listBoard", boardVo);
	}

	@Override
	public BoardVO selectDetailTrade(int boardNo) throws Exception {
		return selectOne("selectDetailTrade", boardNo);
	}

	@Override
	public int totalBoard(BoardVO boardVo) throws Exception {
		int result = selectOne("totalBoard", boardVo);
		return result;
	}
	
	@Override
	public void modifyStatus(int boardNo) throws Exception {
		update("modifyStatus", boardNo);
	}
	
	@Override
	public void tradeSend(int boardNo) throws Exception {
		update("tradeSend", boardNo);
	}
	
	@Override
	public void tradeReceive(int boardNo) throws Exception {
		update("tradeReceive", boardNo);
	}

	@Override
	public void tradeCancle(int boardNo) throws Exception {
		update("tradeCancle", boardNo);
	}
	
	@Override
	public void tradeDelete(int boardNo) throws Exception {
		delete("tradeDelete", boardNo);
	}
	
	@Override
	public void modifyTradeInPicture(BoardVO boardVo) throws Exception {
		update("modifyTradeInPicture", boardVo);
	}

	@Override
	public void modifyTradeNoPicture(BoardVO boardVo) throws Exception {
		update("modifyTradeNoPicture", boardVo);
	}

	
	//***********************************************************************
	
	@Override
	public void insertBuyboard(BuyBoardVO buyBoardVo) throws Exception {
		insert("insertBuyBoard", buyBoardVo);		
	}
	
	@Override
	public void tradeCancleD(int boardNo) throws Exception {
		delete("tradeCancleD", boardNo);		
	}
	
	@Override
	public void tradeStatusW(int buyBoardNo) throws Exception {
		update("tradeStatusW", buyBoardNo);
	}
	
	@Override
	public void tradeStatusE(int buyBoardNo) throws Exception {
		update("tradeStatusE", buyBoardNo);
	}	

	@Override
	public int totalBuyBoard(BuyBoardVO buyBoardVo) throws Exception {
		int result = selectOne("totalBuyBoard", buyBoardVo);
		return result;
	}
	
	//***********************************************************************
	
	@Override
	public List<BoardVO> myTradeSell(BoardVO boardVo) throws Exception {
		return selectList("myTradeSell", boardVo);
	}

	@Override
	public int totalMyTrade(String memberId) throws Exception {
		int result = selectOne("totalMyTrade", memberId);
		return result;
	}

	@Override
	public List<BoardVO> myTradeBuy(BoardVO boardVo) throws Exception {		
		return selectList("myTradeBuy", boardVo);
	}

	@Override
	public int totalMyTradeBuy(String buyId) throws Exception {
		int result = selectOne("totalMyTradeBuy", buyId);
		return result;
	}

	//***********************************************************************
	
	@Override
	public int reviewStatusCheck(int buyBoardNo) throws Exception {
		int result = selectOne("reviewStatusCheck", buyBoardNo);
		return result;
	}

	@Override
	public void reviewInsert(ReviewBoardVO reviewBoardVo) throws Exception {
		insert("reviewInsert", reviewBoardVo);
	}

	@Override
	public List<ReviewBoardVO> reviewView(ReviewBoardVO reviewBoardVo) throws Exception {
		return selectList("reviewView", reviewBoardVo);
	}

	@Override
	public int totalReviewBoard(ReviewBoardVO reviewBoardVo) throws Exception {
		int result = selectOne("totalReviewBoard", reviewBoardVo);
		return result;
	}
	
	@Override
	public int totalReview(ReviewBoardVO reviewBoardVo) throws Exception {
		int result = selectOne("totalReview", reviewBoardVo);
		return result;
	}

	
	//***********************************************************************

	@Override
	public void reportInsert(ReportBoardVO reportBoardVo) throws Exception {
		insert("reportInsert", reportBoardVo);
	}
	
	@Override
	public int totalReport(ReportBoardVO reportBoardVo) throws Exception {
		int result = selectOne("totalReport", reportBoardVo);
		return result;		
	}

	// ***********************************************************************
	
	@Override
	public List<BoardVO> listboardAdmin(BoardVO boardVo) throws Exception {
		return selectList("listboardAdmin", boardVo);
	}

	@Override
	public List<BuyBoardVO> listBuyBoardAdmin(BuyBoardVO buyBoardVo) throws Exception {
		return selectList("listBuyBoardAdmin", buyBoardVo);
	}

	@Override
	public List<ReviewBoardVO> listReviewBoardAdmin(ReviewBoardVO reviewBoardVo) throws Exception {
		return selectList("listReviewBoardAdmin", reviewBoardVo);
	}

	@Override
	public List<ReportBoardVO> listReportBoardAdmin(ReportBoardVO reportBoardVo) throws Exception {
		return selectList("listReportBoardAdmin", reportBoardVo);
	}

}
