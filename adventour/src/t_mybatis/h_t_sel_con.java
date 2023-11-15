package t_mybatis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.tourlist_gs;
import t_controller.t_con_interface;

public class h_t_sel_con implements t_con_interface {

	@Override
	public String t_interf(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	static h_t_sel_con main_home = new h_t_sel_con ();
	
	public static h_t_sel_con instance() {
		return main_home;
	}
		
	
	SqlSessionFactory db_con = t_db_con.getSqlSession();
	
	public List<tourlist_gs> t_sel() {
		SqlSession s = db_con.openSession();
		
		List<tourlist_gs> list = s.selectList("homepage");
	
		s.close();
		return list;
	}
}

