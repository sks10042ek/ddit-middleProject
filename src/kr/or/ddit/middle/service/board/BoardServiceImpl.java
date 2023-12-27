package kr.or.ddit.middle.service.board;

import java.util.List;

import kr.or.ddit.middle.dao.board.BoardDaoImpl;
import kr.or.ddit.middle.vo.BoardVO;
import kr.or.ddit.middle.vo.Chat_HisVO;
import kr.or.ddit.middle.vo.ComentVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.View_BoardVO;
import kr.or.ddit.middle.vo.View_GrBoardVO;

public class BoardServiceImpl implements IBoardService {
	
	private static BoardServiceImpl service;

	private BoardDaoImpl dao;

	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}

	public static BoardServiceImpl getInstance() {
		if (service == null)
			service = new BoardServiceImpl();
		return service;
	}
	
	@Override
	public int BoardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.BoardInsert(vo);
	}

	@Override
	public List<View_BoardVO> noticeCheck() {
		// TODO Auto-generated method stub
		return dao.noticeCheck();
	}

	@Override
	public int noticeDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(vo);
	}

	@Override
	public int selectNoticeUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeUpdate(vo);
	}

	@Override
	public List<View_BoardVO> inquiryCheck() {
		// TODO Auto-generated method stub
		return dao.inquiryCheck();
	}

	@Override
	public int inquiryUpdate(View_BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.inquiryUpdate(vo);
	}

	@Override
	public int inquiryDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.inquiryDelete(vo);
	}

	@Override
	public int commentInsert(ComentVO vo) {
		// TODO Auto-generated method stub
		return dao.commentInsert(vo);
	}

	@Override
	public List<ComentVO> commentCheck(String bo_code) {
		// TODO Auto-generated method stub
		return dao.commentCheck(bo_code);
	}

	@Override
	public List<View_BoardVO> eventCheck() {
		// TODO Auto-generated method stub
		return dao.eventCheck();
	}

	@Override
	public int eventUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.eventUpdate(vo);
	}

	@Override
	public int eventDelete(String bo_code) {
		// TODO Auto-generated method stub
		return dao.eventDelete(bo_code);
	}

	@Override
	public int gbInsert(GroupBuyingVO vo) {
		// TODO Auto-generated method stub
		return dao.gbInsert(vo);
	}

	@Override
	public List<View_GrBoardVO> gbCheck() {
		// TODO Auto-generated method stub
		return dao.gbCheck();
	}

	@Override
	public int gbUpdate(GroupBuyingVO vo) {
		// TODO Auto-generated method stub
		return dao.gbUpdate(vo);
	}

	@Override
	public int gbDelete(String id) {
		// TODO Auto-generated method stub
		return dao.gbDelete(id);
	}

	@Override
	public Chat_HisVO gbChatHis(String chat_code) {
		// TODO Auto-generated method stub
		return dao.gbChatHis(chat_code);
	}

	@Override
	public int gbChatInsert(Chat_HisVO vo) {
		// TODO Auto-generated method stub
		return dao.gbChatInsert(vo);
	}

	@Override
	public int gbchatDelete(Chat_HisVO vo) {
		// TODO Auto-generated method stub
		return dao.gbchatDelete(vo);
	}

	@Override
	public List<View_BoardVO> hoMarketCheck() {
		// TODO Auto-generated method stub
		return dao.hoMarketCheck();
	}

	@Override
	public int hoMarketUpdate(View_BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.inquiryUpdate(vo);
	}

	@Override
	public int hoMarketDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.hoMarketDelete(vo);
		
	}

	@Override
	public View_BoardVO noticeDetail(String bo_code) {
		// TODO Auto-generated method stub
		return dao.noticeDetail(bo_code);
	}

	@Override
	public View_BoardVO inquiryDetail(String bo_code) {
		// TODO Auto-generated method stub
		return dao.inquiryDetail(bo_code);
	}

	@Override
	public int CommentUpdate(ComentVO vo) {
		// TODO Auto-generated method stub
		return dao.CommentUpdate(vo);
	}

	@Override
	public int CommentDelete(String code) {
		// TODO Auto-generated method stub
		return dao.CommentDelete(code);
	}

	@Override
	public List<View_BoardVO> adminBoardCheck() {
		// TODO Auto-generated method stub
		return dao.adminBoardCheck();
	}

	@Override
	public int rCouponCheck(String id) {
		// TODO Auto-generated method stub
		return dao.rCouponCheck(id);
	}

}
