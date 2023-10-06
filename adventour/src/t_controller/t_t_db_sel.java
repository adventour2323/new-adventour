package t_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.guide_gs;
import getset.tourlist_gs;
import t_mybatis.t_g_sel_con;
import t_mybatis.t_t_sel_con;

public class t_t_db_sel implements t_con_interface {
	
	static t_t_db_sel t_list = new t_t_db_sel ();
	public static t_t_db_sel t_select() {
        return t_list ;
    }
	
	@Override
	public String t_interf(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		
		t_t_sel_con ts = t_t_sel_con.instance();
		List<tourlist_gs> list = ts.t_sel();
		rq.setAttribute("list", list);
		
		
		return null;
	}

}
