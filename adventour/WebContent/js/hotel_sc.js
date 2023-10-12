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
	
	
	$(".h_mapbtn").click(function() {
		$.ajax({
			url : "data.json", // 어디로 갈거니? // 갈 때 데이터
			type : "get", // 타입은 뭘 쓸거니?
			datatype : "json",
			success : function(data) { // 갔다온 다음 결과값
			//	alert('seccuss');	// 나오면 파일을 찾았다는 것
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 데이터를 확인하고 싶을 때.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 

				$.each(data, function(index, item) { // 데이터 =item
					$("#demo").append(index + " "); // index가 끝날때까지 
					$("#demo").append(item.name + " ");
					$("#demo").append(item.age + " ");
					$("#demo").append(item.address + " ");
					$("#demo").append(item.phone + "<br>");
				});
			},
			error : function() {
				alert('error');			
			}
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});