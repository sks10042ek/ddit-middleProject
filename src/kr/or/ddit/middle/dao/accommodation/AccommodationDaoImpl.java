package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.Search_AccomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class AccommodationDaoImpl implements IAccommodationDao {

	private static AccommodationDaoImpl dao;

	private AccommodationDaoImpl() {
	}

	public static AccommodationDaoImpl getInstance() {
		if (dao == null)
			dao = new AccommodationDaoImpl(); 
		return dao;
	}

	@Override
	public String acMainPhoto(String id) {

		SqlSession session = null;
		String mainPhoto = "";

		try {

			session = MyBatisUtil.getSqlSession();
			mainPhoto = session.selectOne("", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return mainPhoto;
	}

	@Override
	public List<String> acMultiplePhoto(String id) {

		SqlSession session = null;
		List<String> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accommodation.roomPhotoCheck", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public Info_ReservVO resDetailCheck(Info_ReservVO vo) {

		SqlSession session = null;
		Info_ReservVO resVo = null;
		System.out.println(vo.getMem_id());
		System.out.println(vo.getRes_code());
		
		try {

			session = MyBatisUtil.getSqlSession();
			resVo = session.selectOne("Member.resDetailCheck", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return resVo;
	}

	@Override
	public List<Search_AccomVO> acSearch(Search_AccomVO vo) {

		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<Search_AccomVO> acSearchFilter(Search_AccomVO vo) {

		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<Search_AccomVO> acCheck(String type) {

		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.acCheck", type);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<Search_AccomVO> acCheckFilter(String type) {

		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("", type);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<String> filterList(List<String> list) {

		SqlSession session = null;
		List<String> flist = null;

		try {

			session = MyBatisUtil.getSqlSession();
			flist = session.selectList("", list);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return flist;
	}

	@Override
	public List<GroupBuyingVO> GBDetailList(String code) {
		SqlSession session = null;
		List<GroupBuyingVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.GBDetailList", code);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<GroupBuyingVO> GBList() {
		SqlSession session = null;
		List<GroupBuyingVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.GBList", list);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	public List<Search_AccomVO> accomListCheck(Search_AccomVO sa) {
		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.accomListCheck", sa);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public AccommodationVO accomDetail(String a_code) {
		SqlSession session = null;
		AccommodationVO aVO = null;

		try {
			session = MyBatisUtil.getSqlSession();
			aVO = session.selectOne("Accom.accomDetail", a_code);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return aVO;
	}

	@Override
	public List<RoomVO> roomDetail(String a_code) {
		SqlSession session = null;
		List<RoomVO> rList = null;

		try {
			session = MyBatisUtil.getSqlSession();
			rList = session.selectList("Accom.roomDetail", a_code);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return rList;
	}

	@Override
	public List<View_PhotoVO> accomPhotoCheck(String aCode) {
		SqlSession session = null;
		List<View_PhotoVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.accomPhotoCheck", aCode);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	@Override
	public List<View_PhotoVO> roomPhotoCheck(String rCode) {
		SqlSession session = null;
		List<View_PhotoVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.roomPhotoCheck", rCode);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	@Override
	public List<Info_ReservVO> totalListCheck(Info_ReservVO vo) {
		SqlSession session = null;
		List<Info_ReservVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.totalListCheck",vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public List<Search_AccomVO> totalAcCheck(Search_AccomVO vo) {
		
		SqlSession session = null;
		List<Search_AccomVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.totalAcCheck",vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
		
	}

	@Override
	public List<Search_AccomVO> totalUserListCheck(Search_AccomVO vo) {
		SqlSession session = null;
		List<Search_AccomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.totalUserListCheck", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	
	public List<ReservationVO> CheckInOutFilter(ReservationVO rv) {
		SqlSession session = null;
		List<ReservationVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Reservation.CheckInOutFilter", rv);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}


	public List<RoomVO> searchRoom(RoomVO rv) {
		SqlSession session = null;
		List<RoomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Reservation.searchRoom", rv);
			System.out.println("제발 한번에 되세용가리");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	public int invenCountRoom(RoomVO rv) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("Reservation.invenCountRoom", rv);
			System.out.println("제발 한번에 되세용가리");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	public List<Search_AccomVO> getAccommodationList(List<Search_AccomVO> vo) {
		SqlSession session = null;
		List<Search_AccomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.getAccommodationList", vo);
			System.out.println("제발 한번에 되세용가리");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	@Override
	public int invenCountRoomNType(RoomVO rv) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("Reservation.invenCountRoomNType", rv);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	public List<Search_AccomVO> acServiceCheck(Search_AccomVO sa) {
		SqlSession session = null;
		List<Search_AccomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.acServiceCheck", sa);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	public List<Search_AccomVO> acServiceCheckMem(Search_AccomVO sa) {
		SqlSession session = null;
		List<Search_AccomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.acServiceCheckMem", sa);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	public List<Search_AccomVO> acCheckMem(Search_AccomVO sa) {
		SqlSession session = null;
		List<Search_AccomVO> List = null;

		try {
			session = MyBatisUtil.getSqlSession();
			List = session.selectList("Accom.acCheckMem", sa);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return List;
	}

	public int wishInsert(WishListVO wv) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Accom.wishListInsert", wv);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	public int wishDelete(WishListVO wv) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Accom.wishListDelete", wv);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	@Override
	public List<AccommodationVO> adminAccCheck() {
		SqlSession session = null;
		List<AccommodationVO> list = null;
		try {
			 session = MyBatisUtil.getSqlSession();
			 list = session.selectList("Accom.adminAccCheck");
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	@Override
	public int acInsert(AccommodationVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Accom.acInsert", vo);
			if(cnt>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	@Override
	public String aCodeCheck() {
		SqlSession session = null;
		String aCode = null;
		try {
			 session = MyBatisUtil.getSqlSession();
			 aCode = session.selectOne("Accom.aCodeCheck");
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if(session != null) session.close();
	      }
	      return aCode;
	}

	@Override
	public String revCodeCheck() {
		SqlSession session = null;
		String revCode = null;
		try {
			 session = MyBatisUtil.getSqlSession();
			 revCode = session.selectOne("Accom.revCodeCheck");
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if(session != null) session.close();
	      }
	      return revCode;
	}
	
	

}

