package shj.project.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import shj.project.service.BoardDAO;
import shj.project.service.BoardVO;
import shj.project.service.BuyBoardVO;
import shj.project.service.QnaBoardVO;
import shj.project.service.ReplyQnaBoardVO;
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

	@Override
	public BoardVO latelyBoard1(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard1", boardVo);
	}

	@Override
	public BoardVO latelyBoard2(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard2", boardVo);
	}

	@Override
	public BoardVO latelyBoard3(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard3", boardVo);
	}

	@Override
	public BoardVO latelyBoard4(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard4", boardVo);
	}

	@Override
	public BoardVO latelyBoard5(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard5", boardVo);
	}

	@Override
	public BoardVO latelyBoard6(BoardVO boardVo) throws Exception {
		return selectOne("latelyBoard6", boardVo);
	}

	// ***********************************************************************

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

	// ***********************************************************************

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

	// ***********************************************************************

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
	
	@Override
	public List<ReviewBoardVO> myReview(ReviewBoardVO reviewBoardVo) throws Exception {
		return selectList("myReview", reviewBoardVo);
	}

	// ***********************************************************************

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

	// ***********************************************************************
	
	@Override
	public void qnaInsert(QnaBoardVO qnaBoardVo) throws Exception {
		insert("qnaInsert", qnaBoardVo);
	}

	@Override
	public List<QnaBoardVO> myQnaList(QnaBoardVO qnaBoardVo) throws Exception {
		return selectList("myQnaList", qnaBoardVo);
	}

	@Override
	public QnaBoardVO myQna(int qnaBoardNo) throws Exception {		
		return selectOne("myQna", qnaBoardNo);
	}

	@Override
	public void qnaModify(QnaBoardVO qnaBoardVo) throws Exception {
		update("qnaModify", qnaBoardVo);
	}

	@Override
	public void qnaDelete(QnaBoardVO qnaBoardVo) throws Exception {
		delete("qnaDelete", qnaBoardVo);
	}

	@Override
	public List<QnaBoardVO> qnaList(QnaBoardVO qnaBoardVo) throws Exception {
		return selectList("qnaList", qnaBoardVo);
	}

	@Override
	public QnaBoardVO userQna(int qnaBoardNo) throws Exception {
		return selectOne("userQna", qnaBoardNo);
	}
	
	@Override
	public void replyQna(int qnaBoardNo) throws Exception {
		update("replyQna", qnaBoardNo);
	}
	
	@Override
	public void replyQnaDelete(int qnaBoardNo) throws Exception {
		update("replyQnaDelete", qnaBoardNo);
	}

	// ***********************************************************************
	
	@Override
	public void replyInsert(ReplyQnaBoardVO replyQnaBoardVo) throws Exception {
		insert("replyInsert", replyQnaBoardVo);
	}

	@Override
	public ReplyQnaBoardVO replyView(int qnaBoardNo) throws Exception {
		return selectOne("replyView", qnaBoardNo);
	}

	@Override
	public void replyModify(ReplyQnaBoardVO replyQnaBoardVo) throws Exception {
		update("replyModify", replyQnaBoardVo);
	}

	@Override
	public void replyDelete(int qnaBoardNo) throws Exception {
		delete("replyDelete", qnaBoardNo);
	}
	
}
