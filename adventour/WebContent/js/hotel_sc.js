$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");




 /* 하트누르면 색변환*/
 
    let isRed = false;
  
  $('.beheart').on('click', function() {
    if (isRed) {
      $(this).css('color', 'black');
      isRed = false;
    } else {
      $(this).css('color', 'red');
      isRed = true;
    }
    
  });
  
  
  
/*왼쪽 검색창 날짜 픽 */
  $.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});
	
//왼쪽 검색창 도전...
//	$(".sch_btn").click(function(e) {
//		  e.preventDefault(); // 폼의 기본 동작 방지
//
//		  // 입력된 검색어 및 검색 조건 가져오기
//		  var sc_country = $(".sch_country").val();
//		  var sc_city = $(".sch_city").val();
//		  var sc_indate = $("#sch_indate").val();
//		  var sc_outdate = $("#sch_outdate").val();
//		  var sc_adult = $(".sch_adult").val();
//		  var sc_minpri = $(".sch_minpri").val();
//		  var sc_maxpri = $(".sch_maxpri").val();
//		  var sc_twin = $(".h_twin").val();
//		  var sc_double = $(".h_double").val();
//		  var sc_queen = $(".h_queen").val();
//
//		  // AJAX 요청 보내기
//		  $.ajax({
//		    type: "GET",
//		    url: "hotel_sc.jsp",
//		    data: {
//		      c_sch_country: sc_country,
//		      c_sch_city: sc_city,
//		      c_sch_indate: sc_indate,
//		      c_sch_outdate: sc_outdate,
//		      c_sch_adult: sc_adult,
//		      c_sch_minpri: sc_minpri,
//		      c_sch_maxpri: sc_maxpri,
//		      c_sch_twin: sc_twin,
//		      c_sch_double: sc_double,
//		      c_sch_queen: sc_queen
//		    },
//		    success: function(data) {
//		      // 서버에서 받은 HTML 데이터를 결과 테이블의 tbody에 추가
//		    	  $(".scdform").html(data);
//		    },
//		    error: function() {
//		      alert("검색 중 오류가 발생했습니다.");
//		    }
//		  });
//		});
//	

	
});