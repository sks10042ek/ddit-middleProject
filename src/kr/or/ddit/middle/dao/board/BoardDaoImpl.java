package kr.or.ddit.middle.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import kr.or.ddit.mybatis.config.MyBatisUtil;

import kr.or.ddit.middle.vo.BoardVO;
import kr.or.ddit.middle.vo.Chat_HisVO;
import kr.or.ddit.middle.vo.ComentVO;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.View_BoardVO;
import kr.or.ddit.middle.vo.View_GrBoardVO;

public class BoardDaoImpl implements IBoardDao {
	
	private static BoardDaoImpl dao;

	private BoardDaoImpl() {
	}

	public static BoardDaoImpl getInstance() {
		if (dao == null)
			dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public int BoardInsert(BoardVO vo) {
		 SqlSession session = null;
	      int cnt = 0;
	      
	      try {
	         session = MyBatisUtil.getSqlSession();
	         cnt = session.insert("Board.BoardInsert", vo);
	         
	         if(cnt>0) session.commit();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return cnt;
	}

	@Override
	public List<View_BoardVO> noticeCheck() {
		
		SqlSession session = null;
	      List<View_BoardVO> boardList = null;
	      try {
	         session = MyBatisUtil.getSqlSession();
	         boardList = session.selectList("Board.noticeCheck");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return boardList;
	}

	@Override
	public int noticeDelete(BoardVO vo) {
		 SqlSession session = null;
		    int cnt =0;
		    
		    try {

		       session = MyBatisUtil.getSqlSession();
		       cnt = session.delete("Board.noticeDelete", vo);
		       
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
	public int selectNoticeUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<View_BoardVO> inquiryCheck() {
		SqlSession session = null;
	      List<View_BoardVO> inquiryList = null;
	      try {
	         session = MyBatisUtil.getSqlSession();
	         inquiryList = session.selectList("Board.inquiryCheck");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return inquiryList;
	}

	@Override
	public int inquiryUpdate(View_BoardVO vo) {
		 SqlSession session = null;
		 int cnt = 0;
		 
	     try {
	         session = MyBatisUtil.getSqlSession();
	         cnt = session.update("Board.inquiryUpdate", vo);
	         
	         if(cnt>0) {
	        	 session.commit();
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
		return cnt;
	}

	@Override
	public int inquiryDelete(BoardVO vo) {
		 SqlSession session = null;
		    int cnt =0;
		    
		    try {

		       session = MyBatisUtil.getSqlSession();
		       cnt = session.delete("Board.inquiryDelete", vo);
		       
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
	public int commentInsert(ComentVO vo) {
		SqlSession session = null;
	    int cnt =0;
	    
	    try {

	       session = MyBatisUtil.getSqlSession();
	       cnt = session.delete("Board.commentInsert", vo);
	       
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
	public List<ComentVO> commentCheck(String bo_code) {
		SqlSession session = null;
	      List<ComentVO> list = null;
	      try {
	         session = MyBatisUtil.getSqlSession();
	         list = session.selectList("Board.commentCheck",bo_code);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	@Override
	public List<View_BoardVO> eventCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int eventUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eventDelete(String bo_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int gbInsert(GroupBuyingVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<View_GrBoardVO> gbCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int gbUpdate(GroupBuyingVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int gbDelete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Chat_HisVO gbChatHis(String chat_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int gbChatInsert(Chat_HisVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int gbchatDelete(Chat_HisVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<View_BoardVO> hoMarketCheck() {
		SqlSession session = null;
		List<View_BoardVO> list = null;
	      try {
	         session = MyBatisUtil.getSqlSession();
	         list = session.selectList("Board.hoMarketCheck");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	@Override
	public int hoMarketUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hoMarketDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View_BoardVO noticeDetail(String bo_code) {
		
		SqlSession session = null;
	     View_BoardVO boardVO = new View_BoardVO();
	      try {
	         session = MyBatisUtil.getSqlSession();
	         boardVO = session.selectOne("Board.noticeDetail",bo_code);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return boardVO;
	}

	public View_BoardVO inquiryDetail(String bo_code) {
		
		SqlSession session = null;
	     View_BoardVO boardVO = new View_BoardVO();
	      try {
	         session = MyBatisUtil.getSqlSession();
	         boardVO = session.selectOne("Board.inquiryDetail",bo_code);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return boardVO;
	}

	@Override
	public int CommentUpdate(ComentVO vo) {
		SqlSession session = null;
	    int cnt =0;
	    
	    try {

	       session = MyBatisUtil.getSqlSession();
	       cnt = session.update("Board.CommentUpdate", vo);
	       
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
	public int CommentDelete(String code) {
		SqlSession session = null;
	    int cnt =0;
	    
	    try {

	       session = MyBatisUtil.getSqlSession();
	       cnt = session.delete("Board.CommentDelete", code);
	       
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
	public List<View_BoardVO> adminBoardCheck() {
		SqlSession session = null;
		List<View_BoardVO> list = null;
	      try {
	         session = MyBatisUtil.getSqlSession();
	         list = session.selectList("Board.adminBoardCheck");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	public int rCouponCheck(String id) {
		SqlSession session = null;
	    int cnt =0;
	    
	    try {

	       session = MyBatisUtil.getSqlSession();
	       cnt = session.selectOne("Board.rCouponCheck", id);
	       
	    } catch (Exception e) {
	       e.printStackTrace();
	    } finally {
	       if (session != null)
	          session.close();
	    }

	    return cnt;
	}


}
