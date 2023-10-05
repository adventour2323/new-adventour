package t_mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import adventour.g_getset;
import t_mybatis.t_db_con;

public class t_g_sel_con {
	
	static t_g_sel_con t_m_s = new t_g_sel_con ();
	
	public static t_g_sel_con instance() {
		return t_m_s;
	}
		
	SqlSessionFactory db_con = t_db_con.getSqlSession();
	
	
	public List<g_getset> g_sel() {
		SqlSession s = db_con.openSession();
		
		List<g_getset> list = s.selectList("guide_list");
	
		s.close();
		return list;
	}
}
