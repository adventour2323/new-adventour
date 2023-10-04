package t_mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import adventour.t_getset;

public class t_t_sel_con {
	
static t_t_sel_con t_t_s = new t_t_sel_con ();
	
	public static t_t_sel_con instance() {
		return t_t_s;
	}
	
	SqlSessionFactory db_con = t_db_con.getSqlSession();
	
	public List<t_getset> g_sel() {
		
		SqlSession s = db_con.openSession();
		List<t_getset> list = s.selectList("tour_list");
		s.close();
		
		return list;
	}

}
