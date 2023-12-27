package kr.or.ddit.middle.dao.reservation;

import java.util.List;

import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;
import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PaymentVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;

public interface IReservationDao {
	
	
	/**
	 * 호텔정보
	 * @param a_code
	 * @return
	 */
	public AccommodationVO accomInfo(String a_code);
	
	/**
	 * 선택객실정보
	 * @param r_code
	 * @return
	 */
	public RoomVO roomInfo(String r_code);
	
	
	
	
	/**
	 * 
	 * 예약 insert 메소드
	 * 
	 * 예약내용을 입력하고 예약 버튼을 누르면  버튼을 누르면 예약내용을 db에 insert해주는 기능
	 * 
	 * @param vo : 예약 내역
	 * @return 성공하면 1 실패하면 0
	 */
	public int resInsert(ReservationVO vo);
	
	/** 
	 * 
	 * 환불 insert 메소드
	 * 
	 * @param pay_no : 환불정보를 가진 param
	 * @return 성공하면 1 실패하면 0
	 */
	public int refundInsert(String pay_no);

	
	/**
	 * 예약상태 변경 메서드
	 * 
	 * 환불하기를 누르면 해당 예약코드의 예약 상태를 예약취소로 변경시켜줌
	 * @param res_code : 해당 res_code를 저장하여 param으로 넘긴다.
	 * @return 성공시 1 , 실패시 0
	 */
	public int resStatusUpdate(String res_code);
	
	
	
	/**
	 * 
	 * 회원 보유 쿠폰 조회
	 * 
	 * 예약할때 id값에 해당하는 회원이 보유하고있는 쿠폰을 selected 하여 사용할수 있게 조회해주는 메서드
	 * 
	 * @param id : 세션에 저장되어있는 id값
	 * @return 사용가능한보유쿠폰의 code값을 List에 담아서 반환
	 */
	
	public List<String> cphCheck(String id);
	
	
	/**
	 * 회원 마일리지 조회
	 * 
	 * 세션값에 저장되어있는 id에 해당하는 mileage 가져오기
	 * 
	 * @param id : 세션값에 저장되어있는 id
	 * @return milege값 return
	 */
	public int memPosMileage(String id);
	
		
	/**
	 * 
	 * 사용한 쿠폰의 사용상태를 쿠폰보유자 테이블에서 변경하는 update메서드
	 * 
	 * 해당쿠폰 조회를 통해서 할인을 적용한상태에서 결제버튼을 눌럿을때
	 * 실행되어 그 쿠폰의 사용여부를 바꿔주는 기능
	 * 
	 * @param vo : 세션에 저장된 id
	 * @return 성공시 1 , 실패시0
	 */
	public int memCpdelete(Cp_HavingVO vo);

	/**
	 * 
	 * 마일리지 insert
	 * 
	 * @param mVO
	 * @return
	 */
	public int milInsert(MileageVO mVO);
	
	
	/**
	 * 
	 * 관리자 회원목록 출력 
	 * 
	 * 관리자계정에서 모든 회원을 조회하여 출력해준다.
	 * 
	 * @return List<PaymentVO>에 게시글 정보와 작성자의 정보까지 반환해준다.
	 */
	List<PaymentVO> adminPayCheck();
	
	/**
	 * 
	 * 관리자 매출조회
	 * 
	 * @return month, total_sales 반환
	 */
	public List<PaymentVO> adminSalesCheck();
}

