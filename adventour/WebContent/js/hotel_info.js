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
  	
  	


});