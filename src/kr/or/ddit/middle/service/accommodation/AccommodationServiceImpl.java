package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.dao.accommodation.AccommodationDaoImpl;
import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.Search_AccomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;

public class AccommodationServiceImpl implements IAccommodationService {

	private static AccommodationServiceImpl service;

	private AccommodationDaoImpl dao;

	private AccommodationServiceImpl() {
		dao = AccommodationDaoImpl.getInstance();
	}

	public static IAccommodationService getInstance() {
		if (service == null)
			service = new AccommodationServiceImpl();
		return service;
	}

	public static AccommodationServiceImpl getService() {
		return service;
	}

	public static void setService(AccommodationServiceImpl service) {
		AccommodationServiceImpl.service = service;
	}

	public AccommodationDaoImpl getDao() {
		return dao;
	}

	public void setDao(AccommodationDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public String acMainPhoto(String id) {

		return dao.acMainPhoto(id);
	}

	@Override
	public List<String> acMultiplePhoto(String id) {

		return dao.acMultiplePhoto(id);
	}

	@Override
	public Info_ReservVO resDetailCheck(Info_ReservVO vo) {

		return dao.resDetailCheck(vo);
	}

	@Override
	public List<Search_AccomVO> acSearch(Search_AccomVO vo) {

		return dao.acSearch(vo);
	}

	@Override
	public List<Search_AccomVO> acSearchFilter(Search_AccomVO vo) {

		return dao.acSearchFilter(vo);
	}

	@Override
	public List<Search_AccomVO> acCheck(String type) {

		return dao.acCheck(type);
	}

	@Override
	public List<Search_AccomVO> acCheckFilter(String type) {

		return dao.acCheckFilter(type);
	}

	@Override
	public List<String> filterList(List<String> list) {

		return dao.filterList(list);
	}

	@Override
	public List<GroupBuyingVO> GBDetailList(String code) {
		// TODO Auto-generated method stub
		return dao.GBDetailList(code);
	}

	@Override
	public List<GroupBuyingVO> GBList() {
		// TODO Auto-generated method stub
		return dao.GBList();
	}

	@Override
	public List<Search_AccomVO> accomListCheck(Search_AccomVO sa) {
		// TODO Auto-generated method stub
		return dao.accomListCheck(sa);
	}

	@Override
	public List<RoomVO> roomDetail(String a_code) {
		// TODO Auto-generated method stub
		return dao.roomDetail(a_code);
	}

	@Override
	public AccommodationVO accomDetail(String a_code) {
		// TODO Auto-generated method stub
		return dao.accomDetail(a_code);
	}

	@Override
	public List<View_PhotoVO> accomPhotoCheck(String aCode) {
		// TODO Auto-generated method stub
		return dao.accomPhotoCheck(aCode);
	}

	@Override
	public List<View_PhotoVO> roomPhotoCheck(String rCode) {
		// TODO Auto-generated method stub
		return dao.roomPhotoCheck(rCode);
	}

	@Override
	public List<Info_ReservVO> totalListCheck(Info_ReservVO vo) {
		// TODO Auto-generated method stub
		return dao.totalListCheck(vo);
	}

	@Override
	public List<Search_AccomVO> totalAcCheck(Search_AccomVO vo) {
		// TODO Auto-generated method stub
		return dao.totalAcCheck(vo);
	}

	@Override
	public List<Search_AccomVO> totalUserListCheck(Search_AccomVO vo) {
		// TODO Auto-generated method stub
		return dao.totalUserListCheck(vo);
	}
	
	
	@Override
	public List<ReservationVO> CheckInOutFilter(ReservationVO rv) {
		// TODO Auto-generated method stub
		return dao.CheckInOutFilter(rv);
	}


	@Override
	public List<RoomVO> searchRoom(RoomVO rv) {
		// TODO Auto-generated method stub
		return  dao.searchRoom(rv);
	}

	@Override
	public int invenCountRoom(RoomVO rv) {
		// TODO Auto-generated method stub
		return  dao.invenCountRoom(rv);
	}

	@Override
	public List<Search_AccomVO> getAccommodationList(List<Search_AccomVO> vo) {
		// TODO Auto-generated method stub
		return dao.getAccommodationList(vo);
	}

	@Override
	public int invenCountRoomNType(RoomVO rv) {
		// TODO Auto-generated method stub
		return dao.invenCountRoomNType(rv);
	}

	@Override
	public List<Search_AccomVO> acServiceCheck(Search_AccomVO sa) {
		// TODO Auto-generated method stub
		return dao.acServiceCheck(sa);
	}

	@Override
	public List<Search_AccomVO> acServiceCheckMem(Search_AccomVO sa) {
		// TODO Auto-generated method stub
		return dao.acServiceCheckMem(sa);
	}

	@Override
	public List<Search_AccomVO> acCheckMem(Search_AccomVO sa) {
		// TODO Auto-generated method stub
		return dao.acCheckMem(sa);
	}

	@Override
	public int wishInsert(WishListVO wv) {
		// TODO Auto-generated method stub
		return dao.wishInsert(wv);
	}

	@Override
	public int wishDelete(WishListVO wv) {
		// TODO Auto-generated method stub
		return dao.wishDelete(wv);
	}
	
	@Override
	public List<AccommodationVO> adminAccCheck() {
		return dao.adminAccCheck();
	}

	@Override
	public int acInsert(AccommodationVO vo) {
		// TODO Auto-generated method stub
		return dao.acInsert(vo);
	}

	@Override
	public String aCodeCheck() {
		// TODO Auto-generated method stub
		return dao.aCodeCheck();
	}

	@Override
	public String revCodeCheck() {
		// TODO Auto-generated method stub
		return dao.revCodeCheck();
	}

}
