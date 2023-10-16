package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import getset.H_getset;

public class H_Select_SCsch_conn {

    static H_Select_SCsch_conn mainConn = new H_Select_SCsch_conn();

    public static H_Select_SCsch_conn instance() {
        return mainConn;
    }

    SqlSessionFactory dbconnect = DB_conn.getSqlSession();

    public List<H_getset> h_scsch(String country_ko, String city_ko, String h_indate, String h_outdate, String h_roompeo,
            int sch_minpri, int sch_maxpri, String h_roomtype) {

        System.out.println(city_ko);

        SqlSession ret_dbconn = dbconnect.openSession();

        H_getset schsearch_list2 = new H_getset();
        schsearch_list2.setCountry_ko(country_ko);
        schsearch_list2.setCity_ko(city_ko);
        schsearch_list2.setH_indate(h_indate);
        schsearch_list2.setH_outdate(h_outdate);
        schsearch_list2.setH_roompeo(h_roompeo);
        schsearch_list2.setSch_minpri(sch_minpri);
        schsearch_list2.setSch_maxpri(sch_maxpri);
        schsearch_list2.setH_outdateM(h_roomtype);

        System.out.println("연결 2");
        System.out.println(country_ko);
        System.out.println(city_ko);
        System.out.println(h_indate);
        System.out.println(h_outdate);
        System.out.println(h_roompeo);
        System.out.println(sch_minpri);
        System.out.println(sch_maxpri);
        System.out.println(h_roomtype);
        System.out.println("연결 2 끝");

        List<H_getset> scsearch_list = null; // 예외가 발생할 경우를 대비해 초기화합니다.

        try {
            scsearch_list = ret_dbconn.selectList("select_sc_search", schsearch_list2);

            for (H_getset item : scsearch_list) {
                System.out.println(item.getCountry_eng());
                System.out.println(item.getCity_eng());
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 정보 출력
        } finally {
            ret_dbconn.close();
        }

        return scsearch_list;
    }
}
