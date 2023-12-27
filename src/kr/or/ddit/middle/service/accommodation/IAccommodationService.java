package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.Search_AccomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;
	//예약에 관련된 service
public interface IAccommodationService {
	
	
	/**
	 * 
	 * 숙박업체 Main사진 1장 조회하는 메서드
	 * 
	 * 세션에 저장되어 있는 id값을 확인하여 해당하는 main사진 1개만 조회하여 return해준다. 
	 * 
	 * @param id 세션값에 저장되어있는 id값을 받아온다.
	 * @return id값이 존재하면 해당하는 Main사진을 반환하여준다
	 */
	public String acMainPhoto(String id);

	
	
	/**
	 * 
	 * 숙박업체의 여러개의 사진을 조회하는 메서드
	 * 
	 * 세션에 저장되어있는 id값을 확인하여 해당하는 전체사진을 조회하여 List에 담아 리턴해준다 -> daoimpl에서 selectList메서드 사용하길 바래
	 * 
	 * 
	 * @param id 세션값에 저장되어있는 id값을 받아온다.
	 * @return id값이 존재하면 해당하는 사진을 List에담아 여러장을 가져온다. 
	 */
	public List<String> acMultiplePhoto(String id);
	
	/**
	 * 객실정보에서 출력해줄 호텔 정보 리스트
	 * @param a_code
	 * @return
	 */
	public AccommodationVO accomDetail(String a_code);
	
	/**
	 * 
	 * 객실 정보를 가져오는 메소드
	 * 
	 * @param a_code
	 * @return
	 */
	public List<RoomVO> roomDetail(String a_code);
	
	
	/**
	 * 
	 * 예약정보 상세조회 메서드
	 * 
	 * 세션에 저장되어 있는 id값을 param으로 넘겨 받아 예약정보에 관한 정보들을 Info_ReservVO에 담아서 return해주는 메서드
	 * 
	 * @param id : 세션에 저장되어있는 id값
	 * @return  예약 상세정보에 필요한 데이터를 List<Info_ReservVO>에 담아서 return
	 */
	public Info_ReservVO resDetailCheck(Info_ReservVO vo);
	
	/**
	 * 
	 * 숙박업체 검색 메서드[메인화면에서 지역, 인원 , 날짜를 검색하고 들어오면 검색된 결과를 select해주는 메서드]
	 * 
	 * 메인화면에서 정보를 입력받은 데이터를 Search_AccomVO에 담아서 param으로 넘겨준뒤 
	 * 값에 해당 하는 데이터를 List<Search_AccomVO>에 담아서 return 해준다. 
	 * 
	 * @param vo : 메인화면에서 검색으로 입력받은 데이터값
	 * @return vo 값에 해당 하는 데이터를 List<Search_AccomVO>에 담아서 return 해준다
	 */
	public List<Search_AccomVO> acSearch(Search_AccomVO vo);
	
	/**
	 *  
	 *  숙박업체 검색 메서드를 통해서 들어왔고 , 거기서 service별로 필터링된 숙박업체를 조회하는 메서드
	 * 
	 *  숙박업체리스트에서 filter 별로 사용자가 원하는 데이터만 조회할 수 있게 해주는 기능 
	 * 
	 * @param vo 
	 * @return
	 */
	public List<Search_AccomVO> acSearchFilter(Search_AccomVO vo);
	
	
	
	/**
	 * 
	 *  숙박업체 타입에 대한 숙박업체 조회
	 * 
	 *  숙박업체 타입을 param으로 입력받아 숙박업체의 정보를 List<Search_AccomVO>에 담아서 return 하는 기능
	 * 
	 * @param type : 숙박업체의 종류 
	 * @return 숙박업체의 정보를  List<Search_AccomVO>에 담아서 return
	 */
	public List<Search_AccomVO> acCheck(String type);
	
	
	/**
	 * 
	 * 숙박업체 타입에 대한 숙박업체를 통해 들어왔고, 거기서 service별로 필터링된 숙박업체를 조회하는 메서드
	 * 
	 * 숙박업체리스트에서 filter 별로 사용자가 원하는 데이터만 조회할 수 있게 해주는 기능 
	 * 
	 * @param type : 숙박업체의 종류
	 * @return 숙박업체의 정보를 List<Search_AccomVO>에 담아서 return
	 */
	
	public List<Search_AccomVO> acCheckFilter(String type);
	

	/**
	 * 
	 * service filter box를 체크한 값들을 list에 담아서 param으로 넘겨준다.
	 * 
	 *  이 메서드의 목적은 acSearchFilter와 acCheckFilter의 두번째 param값으로 넘겨주기 위한 메서드이다.
	 *  이 메서드를 통해서 동적으로 서비서부분을 mapper에 추가할 것이다.
	 * 
	 * @return : List<String>을 리턴해주어 service filter를 체크한 값들을 return해준다
	 */
	public List<String> filterList(List<String> list);
	
	
	/**
	 *  공동구매 상세조회 페이지
	 * 
	 *  공동구매 코드를 가져와서 해당 공동구매 상세페이지에 관한 모든 데이터를 가져온다.
	 * 
	 * @param code 공동구매 코드
	 * @return List<GroupBuyingVO>에 데이터를 담아서 리턴
	 */
	public List<GroupBuyingVO> GBDetailList(String code);
	
	/**
	 * 공동구매 전체 조회 페이지
	 * 
	 * 
	 * 
	 * @returnList<GroupBuyingVO>에 데이터를 담아서 리턴
	 */
	public List<GroupBuyingVO> GBList();


	/**
	 * 로그인 후 호텔 리스트 출력
	 * 
	 * 
	 * 
	 * @param sa
	 * @return
	 */
	public List<Search_AccomVO> accomListCheck(Search_AccomVO sa);


	/**
	 *  업체 사진 리스트 출력
	 * @param aCode
	 * @return
	 */
	public List<View_PhotoVO> accomPhotoCheck(String aCode);
	
	/**
	 * 
	 * room사진 리스트 출력
	 */
	public List<View_PhotoVO> roomPhotoCheck(String rCode);
	
	/**
	 * 
	 * 전체 숙박업체 리스트 조회
	 * 
	 * @return
	 */
	public List<Info_ReservVO> totalListCheck(Info_ReservVO vo);
	
	/**
	 * 전체 숙박업체 필터조회
	 * 
	 * @return
	 */
	public List<Search_AccomVO> totalAcCheck(Search_AccomVO vo);
	/**
	 * 아이디가 있는 유저의 위시리스트를 포함한 정렬값 보여주기
	 * 
	 * @return
	 */
	public List<Search_AccomVO> totalUserListCheck(Search_AccomVO vo);



	/**
	 * 필터1: 선택된 날짜를 포함하고 있는DB값 출력해 LIST에 받아오기
	 * 
	 * 
	 * @param rv
	 * @return
	 */
	public List<ReservationVO> CheckInOutFilter(ReservationVO rv);


	/**
	 * 필터2: A_CODE에 따른 ROOM 리스트 출력
	 * 
	 * @param acode
	 * @return
	 */
	public List<RoomVO> searchRoom(RoomVO rv);


	/**
	 * 필터3 : r_code 돌리면서 그 r_code에 따른 그다음 예약 일이 몇개있나 출력 후 카운트
	 * 
	 * 
	 * @param rv
	 * @return
	 */
	public int invenCountRoom(RoomVO rv);

	/**
	 * 
	 * 
	 * @return
	 */
	public List<Search_AccomVO> getAccommodationList(List<Search_AccomVO> vo);
	
	/**
	 *  타입을 지정하지 않고 메인 검색으로 들어와서 각각의 room에 해당하는 예약갯수를 알기위한 메서드
	 * 
	 * @param rv 파라미터에 필요한 데이터를 RoomVo에 담아서 제공
	 * @return 해당 날짜에 예약된 숫자
	 */
	public int invenCountRoomNType(RoomVO rv);


	/**
	 * 서비스 필터를 걸어 숙소를 조회하기 위한 메소드 / 로그인x
	 * 
	 * 
	 * @param sa
	 * @return
	 */
	public List<Search_AccomVO> acServiceCheck(Search_AccomVO sa);


	/**
	 * 서비스 필터를 걸어 숙소를 조회하기 위한 메소드  / 로그인o
	 * 
	 * 
	 * 
	 * @param sa
	 * @return
	 */
	public List<Search_AccomVO> acServiceCheckMem(Search_AccomVO sa);


	/**
	 * 서비스 필터를 걸어 숙소를 조회하기 위한 메소드  / 로그인o, 필터 널
	 * 
	 * 
	 * @param sa
	 * @return
	 */
	public List<Search_AccomVO> acCheckMem(Search_AccomVO sa);


	/**
	 * 위시리스트에 자신의 아이디와 a_code를 가져가 insert하는 메소드
	 * 
	 * 
	 * @param wv
	 * @return
	 */
	public int wishInsert(WishListVO wv);


	/**
	 * 위시리스트에 자신의 아이디와 a_code를 가져가 delete하는 메소드
	 * 
	 * 
	 * @param wv
	 * @return
	 */
	public int wishDelete(WishListVO wv);
	
	/**
	 * 
	 * 관리자 숙박업체목록 출력 
	 * 
	 * 관리자계정에서 모든숙박업체를 조회하여 출력해준다.
	 * 
	 * @return List<AccommodationVO>에 게시글 정보와 작성자의 정보까지 반환해준다.
	 */
	
	public List<AccommodationVO> adminAccCheck();
	
	/**
	 * 숙박 업체 등록
	 * @param vo
	 * @return 1이면성공 0이면 실패
	 */
	public int acInsert(AccommodationVO vo);
	
	/**
	 * 가장 최신의 Acode를 가져오기 위한 메소드
	 * 
	 * @return acode값
	 */
	public String aCodeCheck();
	
	
	
	public String revCodeCheck();
	
	
}
