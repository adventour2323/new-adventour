package t_mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import adventour.t_getset;
import getset.tourlist_gs;


public class t_t_sel_con {

	static t_t_sel_con tour_sel = new t_t_sel_con ();
	
	public static t_t_sel_con instance() {
		return tour_sel;
	}
		
	
	SqlSessionFactory db_con = t_db_con.getSqlSession();
	
	public List<tourlist_gs> t_sel() {
		SqlSession s = db_con.openSession();
		
		List<tourlist_gs> list = s.selectList("tour_list");
	
		s.close();
		return list;
	}
}
