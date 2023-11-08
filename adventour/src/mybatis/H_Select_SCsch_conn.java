package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.H_getset;

public class H_Select_SCsch_conn {

    static H_Select_SCsch_conn sch_navi_Conn = new H_Select_SCsch_conn();

    public static H_Select_SCsch_conn instance() {
        return sch_navi_Conn;
    }

    SqlSessionFactory dbconnect = DB_conn.getSqlSession();

    public List<H_getset> h_scsch(String country_ko, String city_ko, String h_indate, String h_outdate, String h_room_bed, int h_roompeo1,
            int sch_minpri, int sch_maxpri) {
    	


        System.out.println("연결확인" + city_ko);

        SqlSession ret_dbconn = dbconnect.openSession();

        H_getset schsearch_list2 = new H_getset();
        schsearch_list2.setCountry_ko(country_ko);
        schsearch_list2.setCity_ko(city_ko);
        schsearch_list2.setH_indate(h_indate);
        schsearch_list2.setH_outdate(h_outdate);
        schsearch_list2.setH_roompeo1(h_roompeo1);
        schsearch_list2.setSch_minpri(sch_minpri);
        schsearch_list2.setSch_maxpri(sch_maxpri);
        schsearch_list2.setH_room_bed(h_room_bed);

        System.out.println("연결 2");
        System.out.println(country_ko);
        System.out.println(city_ko);
        System.out.println(h_indate);
        System.out.println(h_outdate);
        System.out.println(h_roompeo1);
        System.out.println(sch_minpri);
        System.out.println(sch_maxpri);
        System.out.println(h_room_bed);
        System.out.println("연결 2 끝");

        List<H_getset> scsearch_list = ret_dbconn.selectList("select_sc", schsearch_list2);

            for (H_getset item2 : scsearch_list) {
            	System.out.println("넘어온 정보 확인");
                System.out.println(item2.getCountry_eng());
                System.out.println(item2.getCity_eng());
            }
        
        ret_dbconn.close();
       return scsearch_list;
    }
}
