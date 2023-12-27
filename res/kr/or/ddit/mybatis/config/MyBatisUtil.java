package kr.or.ddit.mybatis.config;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {			//큰쿼 힘내라 우리모두 힘내자
	private static SqlSessionFactory sqlSessionFactory;

	static {

		Reader rd = null;
		try {
			rd = Resources.getResourceAsReader("kr/or/ddit/mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rd != null)
				try {
					rd.close();
				} catch (Exception e) {
				}
		}
	}

	public static SqlSession getSqlSession() {
		SqlSession session = sqlSessionFactory.openSession();

		return session;
	}

}
