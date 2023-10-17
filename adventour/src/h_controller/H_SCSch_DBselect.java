package h_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;
import mybatis.H_Select_SCsch_conn;

public class H_SCSch_DBselect implements h_conn_interface { //데이터베이스
    static H_SCSch_DBselect h_interface = new H_SCSch_DBselect();

    public static H_SCSch_DBselect im_inter() {
        return h_interface;
    }

    @Override
    public String showdata(HttpServletRequest re, HttpServletResponse rs) throws Exception {
        H_Select_SCsch_conn sin_interface = H_Select_SCsch_conn.instance();
        
        re.setCharacterEncoding("UTF-8");
        rs.setCharacterEncoding("UTF-8");
        

        String scsearch = re.getParameter("uname");
        String country_ko = re.getParameter("sch_country");
        String city_ko = re.getParameter("sch_city");
        String h_indate = re.getParameter("sch_indate");
        String h_outdate = re.getParameter("sch_outdate");
        String h_room_bed = re.getParameter("h_type");
        String h_roompeo = re.getParameter("sch_adult");
        String sch_minpri1 = re.getParameter("sch_minpri");
        String sch_maxpri1 = re.getParameter("sch_maxpri");
        
        
    
        int h_roompeo1 = Integer.parseInt(h_roompeo);

        int sch_minpri = 0;
        int sch_maxpri = 1000000;

        if (sch_minpri1 != null && !sch_minpri1.isEmpty()) {
            try {
                sch_minpri = Integer.parseInt(sch_minpri1);
            } catch (NumberFormatException e) {
                // sch_minpri가 숫자로 변환할 수 없는 경우 처리
                // 예: 숫자가 아닌 문자열이 들어온 경우
            }
        }

        if (sch_maxpri1 != null && !sch_maxpri1.isEmpty()) {
            try {
                sch_maxpri = Integer.parseInt(sch_maxpri1);
            } catch (NumberFormatException e) {
                // sch_maxpri가 숫자로 변환할 수 없는 경우 처리
                // 예: 숫자가 아닌 문자열이 들어온 경우
            }
        }

        System.out.println("연결 1");
        System.out.println(country_ko);
        System.out.println(city_ko);
        System.out.println(h_indate);
        System.out.println(h_outdate);
        System.out.println(h_room_bed);
        System.out.println(h_roompeo1);
        System.out.println(sch_minpri1);
        System.out.println(sch_maxpri1);
        

        System.out.println("연결 1 끝");
 
        List<H_getset> scsearch_list = sin_interface.h_scsch(country_ko, city_ko, h_indate, h_outdate,  h_room_bed , h_roompeo1, sch_minpri, sch_maxpri);  //select 결과 가져오기 위해 작성
        re.setAttribute("scsearch_list", scsearch_list);
        return null;
    }
}
