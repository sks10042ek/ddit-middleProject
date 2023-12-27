package kr.or.ddit.middle.service.board;

import java.util.List;

import kr.or.ddit.middle.vo.BoardVO;
import kr.or.ddit.middle.vo.Chat_HisVO;
import kr.or.ddit.middle.vo.ComentVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.View_BoardVO;
import kr.or.ddit.middle.vo.View_GrBoardVO;

public interface IBoardService {
	
	/**
	 * 
	 * 게시판 insert 메서드
	 * 
	 * 게시판에 등록할 정보를 입력받아 BoardVO에 넣어서 param으로 보내어 db에 저장한다.
	 * 
	 * @param vo : BoardVO 데이터
	 * @return 성공시 1  실패시 0
	 */
	public int BoardInsert(BoardVO vo);
	
	/**
	 * 
	 * 공지사항 리스드 조회 메서드
	 * 
	 * 
	 * @return List<View_BoardVO>값을 담아 return 해준다.
	 */
	public List<View_BoardVO> noticeCheck();
	
	/**
	 * 
	 * 공지사항 내용 조회 메서드
	 * @param vo
	 * @return View_BoardVO에 담아  return
	 */
	public View_BoardVO noticeDetail(String bo_code);
	
	
	/**
	 * 
	 * 공지사항 delete 메서드
	 * 
	 * @param id : 관리자 id 값
	 * 
	 * @return 성공시 1 실패시0
 	 */
	public int noticeDelete(BoardVO vo);
	
	/**
	 * 
	 * 공지사항 수정 메서드
	 * 
	 * 
	 * @param vo 공지사항 데이터
	 * @return : 성공시 1 실패시 0
	 */
	public int selectNoticeUpdate(BoardVO vo);
	
	
	
	/**
	 * 
	 * 1:1문의 조회 메서드
	 * 
	 * 
	 * @return List<View_BoardVO>값을 담아 return 해준다.
	 */
	public List<View_BoardVO> inquiryCheck();
	
	
	/**
	 * 
	 * 1:1문의 내용 조회 메서드
	 * @param vo
	 * @return View_BoardVO에 담아  return
	 */
	public View_BoardVO inquiryDetail(String bo_code);

	
	/**
	 * 
	 * 1:1문의 수정 메서드
	 * 
	 * 
	 * @param vo 1:1문의 데이터
	 * @return : 성공시 1 실패시 0
	 */
	public int 	inquiryUpdate(View_BoardVO vo);
	
	/**
	 * 
	 * 1:1 문의 삭제
	 * 
	 * @param vo : vo값을 받아와 해당 메세지를 cp
	 * @return 성공시 1 실패시 0
	 */
	public int inquiryDelete(BoardVO vo);
	
	/**
	 * 
	 * 댓글 등록 메서드
	 * 
	 * @param vo : comment 정보를 Comment에 담아 param으로 넘김
	 * @return 성공시 1 실패시 0
	 */
	public int commentInsert(ComentVO vo);
	
	/**
	 * 댓글 조회 메서드
	 * 
	 * 게시판코드에 해당하는 댓글만 보여주는 기능
	 * 
	 * 
	 * @param bo_code : 게시글 코드를 param에 넣는 기능
	 * @return : bo_code에 해당하는 댓글 return
	 */
	public List<ComentVO> commentCheck(String bo_code);
	
	/**
	 * 
	 * 이벤트 게시판 조회 메서드
	 * 
	 * @return 이벤트 List와 정보 출력
	 */
	public List<View_BoardVO> eventCheck();
	
	/**
	 * 
	 * 이벤트 게시판을 수정하는 메서드
	 * 
	 * 
	 * @param vo : 게시판을 변경할값들 vo
	 * @return 성공시 1 실패시 0
	 */
	public int eventUpdate(BoardVO vo);
	/**
	 * 
	 * 이벤트 게시판 삭제
	 * 
	 * @param bo_code : 해당 게시물 코드
	 * @return 성공시 1 실패시 0
	 */
	public int eventDelete(String bo_code);

	/**
	 * 
	 * 공동구매 등록 메서드
	 * 
	 * @param vo : 공동구매등록할떄 필요한 vo
	 * @return 성공시 1, 실패시0
	 */
	public int gbInsert(GroupBuyingVO vo);

	/**
	 * 
	 * 공동구매 조회 메서드
	 * 
	 * @return List<View_GrBoardVO>에 데이터를 담아 return한다.
	 */
	public List<View_GrBoardVO> gbCheck();
	
	/**
	 * 공동구매 수정 메서드
	 * 
	 * 변경을 원하는 값을 vo에 담아서 넣어주면 변경됨
	 * 
	 * @param vo : 공동구매의 데이터를 받아올 vo
	 * @return : 성공시 1 실패시 0
	 */
	public int gbUpdate(GroupBuyingVO vo);
	/**
	 * 공동구매 삭제
	 * 
	 * @param id 세션에 저장되어있는 id값을 받아 param으로 넘김
	 * @return
	 */
	public int gbDelete(String id);
	
	/**
	 * 
	 * 공동구매 채팅내역 조회 메서드
	 * 
	 * 해당 chat_code를 param으로 넘겨받아 해당 채팅내역파일과 정보를 반환한다. -> chat_code는 공동구매code와 같다. 
	 * -> 공동구매 게시글의 code와 같기때문에 해당 id의 해당 공동구매 게시물에 대한 채팅내역을 동적으로 가져올수있다.
	 * 
	 * @param chat_code : 해당 공동 구매 게시물의 code과 같은 chat_code를 
	 * @return Chat_HistVO에 
	 */
	public Chat_HisVO  gbChatHis(String chat_code);	
	
	/**
	 * 해당 공동구매 게시글의 채팅방입장 링크를 클릭했을때 해당되는 정보를 chat_hisVO에 넣어서 DB에 저장한다.
	 * 
	 * @param vo : id,chat_code,chat_filename -> id는 세션에서 불러오고, chat_code는 공동구매 게시물의 코드와같고, chat_filename은 지정해주어야한다.
	 * @return 성공시1, 실패시0
	 */
	public int gbChatInsert(Chat_HisVO vo);
	
	/**
	 * 
	 * 해당 공동구매 게시글의 나가기 버튼을 누르면 해당id와 chat_code를 확인하여 해당 유저의 채팅내역을 삭제한다.
	 * 
	 * @param vo : id값과 chat_code
	 * @return 성공시1, 실패시0
	 */
	public int gbchatDelete(Chat_HisVO vo);
	
	/**
	 * 
	 * 양도마켓 게시글 출력 
	 * 
	 * 양도마켓의 모든글들 조회하여 출력해준다.
	 * 
	 * @return List<View_BoardVO>에 게시글 정보와 작성자의 정보까지 반환해준다.
	 */
	public List<View_BoardVO> hoMarketCheck();
	
	/**
	 * 
	 *  양도마켓 수정
	 *  
	 *  수정할 데이터를 BoardVO에 담아서 param으로 받아 db에서 update해주는 기능
	 * 
	 * @param vo : Board에서 수정할 데이터
	 * @return 성공시1 실패시0
	 */
	public int hoMarketUpdate(View_BoardVO vo);
	
	
	/**
	 * 
	 *  양도마켓 삭제
	 *  
	 *  삭제할 데이터를 BoardVO에 담아서 param으로 받아 db에서 delete해주는 기능
	 * 
	 * @param vo : Board에서 삭제할 데이터
	 * @return 성공시1 실패시0
	 */
	public int hoMarketDelete(BoardVO vo);

	/**
	 * 댓글 수정
	 * 
	 * @param vo co_code 와 update할 co_content를 ComentVO에 담아서 넘김
	 * @return 성공시 1 실패시 0 
	 */
	public int CommentUpdate(ComentVO vo);
	/**
	 * 댓글 삭제
	 * 
	 * @param code 해당 co_code
	 * @return 성공시1 실패시 0
	 */
	public int CommentDelete(String code);
	
	/**
	 * 
	 * 관리자 게시글 출력 
	 * 
	 * 관리자계정에서 모든 게시판 글들 조회하여 출력해준다.
	 * 
	 * @return List<View_BoardVO>에 게시글 정보와 작성자의 정보까지 반환해준다.
	 */
	public List<View_BoardVO> adminBoardCheck();
	
	/**
	 * 
	 *  룰렛 쿠폰 여부 조회
	 * 
	 * @param id
	 * @return 오늘날짜에 받은내역 있으면 1 없으면 0
	 */
	public int rCouponCheck(String id);
     
}
