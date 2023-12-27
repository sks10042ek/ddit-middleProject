package kr.or.ddit.middle.service.reservation;

import java.util.List;

import kr.or.ddit.middle.dao.reservation.ReservationDaoImpl;
import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PaymentVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;

public class ReservationServiceImpl implements IReservationService{
	
	private static ReservationServiceImpl service;

	private ReservationDaoImpl dao;

	private ReservationServiceImpl() {
		dao = ReservationDaoImpl.getInstance();
	}
	public static ReservationServiceImpl getInstance() {
		if (service == null)
			service = new ReservationServiceImpl();
		return service;
	}
	
	@Override
	public int resInsert(ReservationVO vo) {
		// TODO Auto-generated method stub
		return dao.resInsert(vo);
	}

	@Override
	public int payInsert(PaymentVO pVO) {
		// TODO Auto-generated method stub
		return dao.payInsert(pVO);
	}
	
	@Override
	public int refundInsert(String pay_no) {
		// TODO Auto-generated method stub
		return dao.refundInsert(pay_no);
	}

	@Override
	public int resStatusUpdate(String res_code) {
		// TODO Auto-generated method stub
		return dao.resStatusUpdate(res_code);
	}

	@Override
	public List<String> cphCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memPosMileage(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memCpdelete(Cp_HavingVO vo) {
		// TODO Auto-generated method stub
		return dao.memCpdelete(vo);
	}
	@Override
	public AccommodationVO accomInfo(String a_code) {
		// TODO Auto-generated method stub
		return dao.accomInfo(a_code);
	}
	@Override
	public RoomVO roomInfo(String r_code) {
		// TODO Auto-generated method stub
		return dao.roomInfo(r_code);
	}
	@Override
	public int milInsert(MileageVO mVO) {
		// TODO Auto-generated method stub
		return dao.milInsert(mVO);
	}
	@Override
	public List<PaymentVO> adminPayCheck() {
		return dao.adminPayCheck();
	}
	@Override
	public List<PaymentVO> adminSalesCheck() {
		// TODO Auto-generated method stub
		return dao.adminSalesCheck();
	}
	

}
