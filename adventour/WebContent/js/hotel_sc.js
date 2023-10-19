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
	// 검색시 날짜 비교 및 안내 메시지 표시
	  $('form[name="schnav_form"]').on('submit', function(event) {
	      var today = new Date(); // 현재 날짜를 가져옵니다.
	      var currentDate = getCurrentDate(today);
	      var h_indate = $('#sch_indate').val();
	      var h_outdate = $('#sch_outdate').val();

	      if (h_indate < currentDate || h_outdate < currentDate) {
	          alert("과거 날짜는 선택할 수 없습니다. 날짜를 다시 확인하세요.");
	          event.preventDefault(); // 폼 제출을 중단합니다.
	      } else if (h_indate > h_outdate) {
	          alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다. 날짜를 다시 확인하세요.");
	          event.preventDefault(); // 폼 제출을 중단합니다.
	      }
	  });

	  // 현재의 이전 날짜를 선택하지 못하도록 설정
	  function getCurrentDate(today) {
	      var year = today.getFullYear();
	      var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
	      var day = today.getDate();
	      return year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
	  }

	  
///////////////////검색창 쿠키 값 	  
//	  
//	// 특정 이름, 값 및 만료일을 가진 쿠키를 설정하는 함수
//	  function setCookie(name, value, days) {
//	      var expires = "";
//	      if (days) {
//	          var date = new Date();
//	          date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
//	          expires = "; expires=" + date.toUTCString();
//	      }
//	      document.cookie = name + "=" + value + expires + "; path=/";
//	  }
//
//	  // 이름에 해당하는 쿠키의 값을 가져오는 함수
//	  function getCookie(name) {
//	      var nameEQ = name + "=";
//	      var cookies = document.cookie.split(';');
//	      for (var i = 0; i < cookies.length; i++) {
//	          var cookie = cookies[i];
//	          while (cookie.charAt(0) == ' ') {
//	              cookie = cookie.substring(1, cookie.length);
//	          }
//	          if (cookie.indexOf(nameEQ) == 0) {
//	              return cookie.substring(nameEQ.length, cookie.length);
//	          }
//	      }
//	      return null;
//	  }
//
//	  // 쿠키로부터 검색 필드를 채우는 함수
//	  function populateSearchFieldsFromCookies() {
//	      var sch_country = getCookie("sch_country");
//	      var sch_city = getCookie("sch_city");
//	      var sch_indate = getCookie("sch_indate");
//	      var sch_outdate = getCookie("sch_outdate");
//	      var sch_adult = getCookie("sch_adult");
//	      var sch_minpri = getCookie("sch_minpri");
//	      var sch_maxpri = getCookie("sch_maxpri");
//	      var h_type = getCookie("h_type");
//
//	      if (sch_country) {
//	          document.getElementsByName("sch_country")[0].value = sch_country;
//	      }
//	      if (sch_city) {
//	          document.getElementsByName("sch_city")[0].value = sch_city;
//	      }
//	      if (sch_indate) {
//	          document.getElementById("sch_indate").value = sch_indate;
//	      }
//	      if (sch_outdate) {
//	          document.getElementById("sch_outdate").value = sch_outdate;
//	      }
//	      if (sch_adult) {
//	          document.getElementsByName("sch_adult")[0].value = sch_adult;
//	      }
//	      if (sch_minpri) {
//	          document.getElementsByName("sch_minpri")[0].value = sch_minpri;
//	      }
//	      if (sch_maxpri) {
//	          document.getElementsByName("sch_maxpri")[0].value = sch_maxpri;
//	      }
//	      if (h_type) {
//	          document.querySelector('input[name="h_type"][value="' + h_type + '"]').checked = true;
//	      }
//	  }
//
//	  // 페이지가 로드될 때 쿠키로부터 검색 필드를 채우는 함수를 호출합니다.
//	  window.onload = function() {
//	      populateSearchFieldsFromCookies();
//	  };
//
//	  // 폼 제출 이벤트 리스너를 추가하여 검색 값들을 쿠키에 저장합니다.
//	  document.forms["schnav_form"].addEventListener("submit", function() {
//	      setCookie("sch_country", document.getElementsByName("sch_country")[0].value, 365);
//	      setCookie("sch_city", document.getElementsByName("sch_city")[0].value, 365);
//	      setCookie("sch_indate", document.getElementById("sch_indate").value, 365);
//	      setCookie("sch_outdate", document.getElementById("sch_outdate").value, 365);
//	      setCookie("sch_adult", document.getElementsByName("sch_adult")[0].value, 365);
//	      setCookie("sch_minpri", document.getElementsByName("sch_minpri")[0].value, 365);
//	      setCookie("sch_maxpri", document.getElementsByName("sch_maxpri")[0].value, 365);
//	      setCookie("h_type", document.querySelector('input[name="h_type"]:checked').value, 365);
//	  });
//	  
	
	
});