package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DB_conn {//계정 연결해서 가져오는 

	private static SqlSessionFactory sqlSession; //SqlSessionFactory -마이바티스 사용시 데이터베이스 연결을 위해 클래스

	public static SqlSessionFactory getSqlSession() {//getSqlSession바꿔도 되는 이름이다
		return sqlSession; //아래의 정보가 들어있음
	}

	static { //static을 사용하는 것은 계속사용 하기위해 - 싱글톤 패턴울 위해서
		try {//디비를 연결할것이기 때문에 필수 
			String resource = "mybatis/dbinfo_batis.xml";//xml파일 경로 - 패키지는 무조건 - 데이터베이스 정보가 있는 xml
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
