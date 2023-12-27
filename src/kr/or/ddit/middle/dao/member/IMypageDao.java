package kr.or.ddit.middle.dao.member;

import java.util.List;

import kr.or.ddit.middle.vo.Info_CouponVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;

public interface IMypageDao {

	/**
	 * 
	 * 마이페이지-> wishList 조회 메서드 
	 * 
	 * 세션에 들어있는 id값을  매서드에 param으로 보내서  wishList 조회에 필요한 데이터를 View_PhotoVO에 담아서 출력해준다.
	 * 
	 * @param id : 세션에 저장되어있는 id값 
	 * @return 마이페이지의 wishLsit 조회에서 화면에 보여줄 숙박업체와 사진명 return
	 */
	public  List<View_PhotoVO> wishListCheck(String id);
	
	/**
	 * 
	 * 마이페이지 -> 예약내역 조회 메서드
	 * 
	 * 세션에 들어있는 id값을 메서드에 param으로 보내서 예약내역 조회에 필요한 데이터를 Search_AccomVO에 담아서 출력해준다.
	 * 
	 * @param id : 세션에 저장되어 있는 id값
	 * @return : 예약내역 리스트 return (체크인날짜, 체크인시간, 숙소이름, 위치, 숙박기간, 예약상태)
	 */
	public List<Info_ReservVO> resInfoCheck(String id);
	
	/**
	 * 
	 * 마이페이지 -> 쿠폰조회 메서드
	 * 
	 * 세션에 들어있는 id값을 메서드에 param으로 보내서 존재하는 coupon을 Info_CouponVO에 담아서 출력해준다.
	 * 
	 * @param id : 세션에 저장되어 있는 id값
	 * @return 쿠폰정보 return
	 */
	public List<Info_CouponVO> couponCheck(String id);
	
	
	/**
	 * 
	 * 마이페이지 -> 쿠폰전체조회 메서드
	 * 
	 * 세션에 들어있는 id값을 메서드에 param으로 보내서 존재하는 coupon을 Info_CouponVO에 담아서 출력해준다.
	 * 
	 * @param id : 세션에 저장되어 있는 id값
	 * @return 쿠폰정보 return
	 */
	public List<Info_CouponVO> couponTotalCheck(String id);
	
	
	/**
	 * 
	 * 하트 버튼을 누르면 먼저 wishList에 해당 하트를 클릭한 a_code가 위시리스트에 존재하는지 조회해본다.
	 * 해당 메서드의 반환값이 0이 나오면 insert 1이나오면  delete를 실행하면된다.
	 * 
	 * @param vo : mem_id과 a_code-> 위시리스트 정보
	 * @return 1이면 성공, 0이면 실패 -> 1이면 delete , 0이면 insert
	 */
	public int wishListCheck(WishListVO vo);
	
	/**
	 * 위시리스트 삭제 메서드
	 * 
	 * 하트를 눌러 위시리스트를 조회했을때 해당 a_code(숙박업체코드)가 위시리스에 존재하면 해당 a_code의 위시리스트 삭제기능
	 * 
	 * @param vo : a_code와 mem_id
	 * @return 성공시 1, 실패시 0 반환
	 */
	public int wishListDelete(WishListVO vo);
	
	/**
	 * 
	 * 위시리스트 등록 메서드
	 * 
	 * 하트를 눌러 위시리스트를 조회했을때 해당 a_code(숙박업체코드)가 위시리스에 존재하지않으면 해당 a_code의 위시리스트 등록기능
	 * 
	 * @param vo :a_code와 mem_id
	 * @return 성공시 1, 실패시 0 반환
	 */
	public int wishListInsert(WishListVO vo);
	
	/**
	 * 예약 상세 내역 조회
	 * 
	 * 
	 * 
	 * @param Info_ReservVO로 값을 받음 res_code와 id를 받아옴
	 * @return Info_ReservVO 리턴
	 */
	public Info_ReservVO resDetailCheck(Info_ReservVO vo);
	
	/**
	 * 
	 * 마일리지 전체 정보 조회
	 * 
	 * 세션에 저장되어있는 id값을 param에 넘겨서 id에 해당하는 mileage 정보조회
	 * 
	 * @param id 세션에 저장되어있는 id값
	 * @return List<Info_MileageVO>에 값을 담아 return 
	 */
	public List<MileageVO> mileageInfo(String id);
	
	/**
	 *  
	 *  마일리지 잔액 조회
	 * @param id
	 * @return
	 */
	public String mileageTotal(String id);
	
}
