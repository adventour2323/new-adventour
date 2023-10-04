package t_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adventour.g_getset;
import t_mybatis.t_g_sel_con;

public class t_g_db_sel implements t_con_interface {
	
	static t_g_db_sel g_sel = new t_g_db_sel ();
	public static t_g_db_sel g_select() {
        return g_sel;
    }

	@Override
	public String t_interf(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		
		t_g_sel_con ts = t_g_sel_con.instan();
		
		List<g_getset> list = ts.g_sel();
		
		rq.setAttribute("list", list);
		return null;
	}
	
	
}
