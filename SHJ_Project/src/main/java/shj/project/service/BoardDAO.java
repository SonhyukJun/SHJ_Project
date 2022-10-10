package shj.project.service;

import java.util.List;

public interface BoardDAO {
	
	void insertBoard(BoardVO boardVo) throws Exception;
	
	List<BoardVO> listBoard(BoardVO boardVo) throws Exception;
	
	BoardVO selectDetailTrade(int boardNo) throws Exception;
	
	int totalBoard(BoardVO boardVo) throws Exception;
	
	void modifyStatus(int boardNo) throws Exception;
	
	void tradeSend(int boardNo) throws Exception;
	
	void tradeReceive(int boardNo) throws Exception;
	
	void tradeCancle(int boardNo) throws Exception;
	
	void tradeDelete(int boardNo) throws Exception;
	
	void modifyTradeInPicture(BoardVO boardVo) throws Exception;
	
	void modifyTradeNoPicture(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard1(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard2(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard3(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard4(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard5(BoardVO boardVo) throws Exception;
	
	BoardVO latelyBoard6(BoardVO boardVo) throws Exception;

	//***********************************************************************
	
	void insertBuyboard(BuyBoardVO buyBoardVo) throws Exception;
	
	void tradeCancleD(int boardNo) throws Exception;
	
	void tradeStatusW(int buyBoardNo) throws Exception;
	
	void tradeStatusE(int buyBoardNo) throws Exception;
	
	int totalBuyBoard(BuyBoardVO buyBoardVo) throws Exception;
	
	//***********************************************************************
	
	List<BoardVO> myTradeSell(BoardVO boardVo) throws Exception;
	
	int totalMyTrade(String memberId) throws Exception;
	
	List<BoardVO> myTradeBuy(BoardVO boardVo) throws Exception;
	
	int totalMyTradeBuy(String buyId) throws Exception;
	
	//***********************************************************************
	
	int reviewStatusCheck(int buyBoardNo) throws Exception;
	
	void reviewInsert(ReviewBoardVO reviewBoardVo) throws Exception;
	
	List<ReviewBoardVO> reviewView(ReviewBoardVO reviewBoardVo) throws Exception;
	
	int totalReviewBoard(ReviewBoardVO reviewBoardVo) throws Exception;
	
	int totalReview(ReviewBoardVO reviewBoardVo) throws Exception;
	
	List<ReviewBoardVO> myReview(ReviewBoardVO reviewBoardVo) throws Exception;
	
	//***********************************************************************
	
	void reportInsert(ReportBoardVO reportBoardVo) throws Exception;
	
	int totalReport(ReportBoardVO reportBoardVo) throws Exception;
	
	//***********************************************************************
	
	List<BoardVO> listboardAdmin(BoardVO boardVo) throws Exception;
	
	List<BuyBoardVO> listBuyBoardAdmin(BuyBoardVO buyBoardVo) throws Exception;
	
	List<ReviewBoardVO> listReviewBoardAdmin(ReviewBoardVO reviewBoardVo) throws Exception;
	
	List<ReportBoardVO> listReportBoardAdmin(ReportBoardVO reportBoardVo) throws Exception;
	
	//***********************************************************************
	
	void qnaInsert(QnaBoardVO qnaBoardVo) throws Exception;
	
	List<QnaBoardVO> myQnaList(QnaBoardVO qnaBoardVo) throws Exception;
	
	QnaBoardVO myQna(int qnaBoardNo) throws Exception;
	
	void qnaModify(QnaBoardVO qnaBoardVo) throws Exception;
	
	void qnaDelete(QnaBoardVO qnaBoardVo) throws Exception;
	
	List<QnaBoardVO> qnaList(QnaBoardVO qnaBoardVo) throws Exception;
	
	QnaBoardVO userQna(int qnaBoardNo) throws Exception;
	
	void replyQna(int qnaBoardNo) throws Exception;
	
	void replyQnaDelete(int qnaBoardNo) throws Exception;

	//***********************************************************************
	
	void replyInsert(ReplyQnaBoardVO replyQnaBoardVo) throws Exception;
	
	ReplyQnaBoardVO replyView(int qnaBoardNo) throws Exception;
	
	void replyModify(ReplyQnaBoardVO replyQnaBoardVo) throws Exception;
	
	void replyDelete(int qnaBoardNo) throws Exception;
}