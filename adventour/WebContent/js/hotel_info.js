$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");




 /* 하트누르면 색변환*/
  $(document).ready(function() {
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
	var elements = document.querySelectorAll(".h_room_price");

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


});