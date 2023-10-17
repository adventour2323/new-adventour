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
	  
	
	  function setCookie(name, value, days) {
	      var expires = "";
	      if (days) {
	          var date = new Date();
	          date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	          expires = "; expires=" + date.toUTCString();
	      }
	      document.cookie = name + "=" + value + expires + "; path=/";
	  }

	  function getCookie(name) {
	      var nameEQ = name + "=";
	      var cookies = document.cookie.split(';');
	      for (var i = 0; i < cookies.length; i++) {
	          var cookie = cookies[i];
	          while (cookie.charAt(0) == ' ') {
	              cookie = cookie.substring(1, cookie.length);
	          }
	          if (cookie.indexOf(nameEQ) == 0) {
	              return cookie.substring(nameEQ.length, cookie.length);
	          }
	      }
	      return null;
	  }

	  function saveFormValues() {
	      var schCountry = document.querySelector(".sch_country").value;
	      var schCity = document.querySelector(".sch_city").value;
	      var schIndate = document.querySelector("#sch_indate").value;
	      var schOutdate = document.querySelector("#sch_outdate").value;
	      var schAdult = document.querySelector(".sch_adult").value;
	      var schMinpri = document.querySelector(".sch_minpri").value;
	      var schMaxpri = document.querySelector(".sch_maxpri").value;

	      setCookie("schCountry", schCountry, 30); // 저장 기간은 일수로 지정할 수 있습니다.
	      setCookie("schCity", schCity, 30);
	      setCookie("schIndate", schIndate, 30);
	      setCookie("schOutdate", schOutdate, 30);
	      setCookie("schAdult", schAdult, 30);
	      setCookie("schMinpri", schMinpri, 30);
	      setCookie("schMaxpri", schMaxpri, 30);
	  }

	  // 페이지가 로드될 때 쿠키에서 값을 불러옵니다.
	
	      document.querySelector(".sch_country").value = getCookie("schCountry") || "";
	      document.querySelector(".sch_city").value = getCookie("schCity") || "";
	      document.querySelector("#sch_indate").value = getCookie("schIndate") || "";
	      document.querySelector("#sch_outdate").value = getCookie("schOutdate") || "";
	      document.querySelector(".sch_adult").value = getCookie("schAdult") || "";
	      document.querySelector(".sch_minpri").value = getCookie("schMinpri") || "";
	      document.querySelector(".sch_maxpri").value = getCookie("schMaxpri") || "";
	  
	      
	      // "sch_btn" 버튼을 클릭했을 때 쿠키를 JSP 페이지로 전달
	      $(".sch_btn").on("click", function() {
	        var schCountry = getCookie("schCountry") || "";
	        var schCity = getCookie("schCity") || "";
	        var schIndate = getCookie("schIndate") || "";
	        var schOutdate = getCookie("schOutdate") || "";
	        var schAdult = getCookie("schAdult") || "";
	        var schMinpri = getCookie("schMinpri") || "";
	        var schMaxpri = getCookie("schMaxpri") || "";

	        // 쿼리 매개변수를 포함한 URL을 만듭니다.
	        var jspPageUrl = "hotel_sc2.jsp";
	        var queryParams = "schCountry=" + schCountry +
	                          "&schCity=" + schCity +
	                          "&schIndate=" + schIndate +
	                          "&schOutdate=" + schOutdate +
	                          "&schAdult=" + schAdult +
	                          "&schMinpri=" + schMinpri +
	                          "&schMaxpri=" + schMaxpri;

	        // JSP 페이지 URL에 쿼리 매개변수를 추가합니다.
	        jspPageUrl += "?" + queryParams;

	        // 쿠키 값을 포함한 URL로 리디렉션합니다.
	        window.location.href = jspPageUrl;

	      });
});