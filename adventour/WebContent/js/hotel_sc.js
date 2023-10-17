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
// 숫자에 콤마 찍기
	var elements = document.querySelectorAll(".h_tiprice");

	if (elements) {
	  elements.forEach(function(element) {
	    // 요소에서 텍스트 내용을 가져옵니다.
	    var text = element.textContent;

	    // 콤마를 추가할 숫자 형식의 문자열을 만듭니다.
	    var formattedText = addCommasToNumber(text);

	    // 포맷된 문자열로 요소의 내용을 대체합니다.
	    element.textContent = formattedText;
	  });
	}

	// 세 자리마다 콤마를 추가하는 함수를 정의합니다.
	function addCommasToNumber(numberString) {
	  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
//검색창에 조건 걸기	
	  function checkAndSearch() {
		    var minpri = parseInt(document.querySelector(".sch_minpri").value);
		    var maxpri = parseInt(document.querySelector(".sch_maxpri").value);

		    // sch_minpri와 sch_maxpri의 값이 유효한 숫자인지 확인
		    if (isNaN(minpri) || isNaN(maxpri)) {

		      alert("금액을 다시 확인하세요.");
		    } else {
		      // sch_minpri가 sch_maxpri보다 큰 경우 검색하기
		      if (minpri > maxpri) {
		        alert("최소 요금이 최대요금 보다 큽니다. 다시 확인하세요.");
		      } 

		      }
		    }
//	  //현재의 이전 날짜를 선택하지 못하도록 설절
//	  function getCurrentDate() {
//	      var today = new Date();
//	      var year = today.getFullYear();
//	      var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
//	      var day = today.getDate();
//	      return year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
//	  }
//
//	  // 검색시 날짜 비교 및 안내 메시지 표시
//	  $('form[name="h_main_sch_form"]').on('submit', function(event) {
//	      var currentDate = getCurrentDate();
//	      var h_indate = $('#sch_indate').val() ;
//	      var h_outdate = $('#sch_outdate').val() ;
//
//	      if (h_indate < currentDate || h_outdate < currentDate) {
//	          alert("과거 날짜는 선택할 수 없습니다. 날짜를 다시 확인하세요.");
//	          event.preventDefault(); // 폼 제출을 중단합니다.
//	      } else if (h_indate > h_outdate) {
//	          alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다. 날짜를 다시 확인하세요.");
//	          event.preventDefault(); // 폼 제출을 중단합니다.
//	      }
//	  });

	
});