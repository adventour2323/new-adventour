$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");


//셀렉박스 나라별 옵션 설정
$('.c_country').on('change', function() {
  var country = $(this).val();
  var citySelect = $('.c_city');
  
  // 모든 옵션을 보이게 설정
  citySelect.find('option').show();
  
  // 선택 가능한 도시 옵션만 보이도록 설정
  if (country === 'uk') {
    citySelect.find('option').not('[value="lond"], [value="liv"], [value="eden"]').hide();
  } else if (country === 'ity') {
    citySelect.find('option').not('[value="roma"], [value="vene"], [value="mila"]').hide();
  } else if (country === 'fra') {
    citySelect.find('option').not('[value="paris"], [value="mars"], [value="mona"]').hide();
  } else if (country === 'spa') {
    citySelect.find('option').not('[value="mard"], [value="barc"], [value="sev"]').hide();
  }
});

//function clock() {
//  var Target = document.getElementById("clock");
//  var time = new Date();
//
//  var year = time.getYear();
//  var month = time.getMonth();
//  var date = time.getDate();
//  var day = time.getDay();
//  var week = ['일', '월', '화', '수', '목', '금', '토'];
//
//  var hours = time.getHours();
//  var minutes = time.getMinutes();
// 
//
//  Target.innerText = 
//  `${year+1900}년${month + 1}월 ${date}일 ${week[day]}요일 ` +
//  `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes}` : minutes}`;
//      
//}
clock();
setInterval(clock, 60000); // 1초마다 실행

function clock() {
	  var Target = document.getElementById("clock");
	  var time = new Date();

	  var year = time.getFullYear();
	  var month = time.getMonth() + 1; // 월을 1을 더해서 정상적인 월로 변환
	  var date = time.getDate();
	  var day = time.getDay();
	  var week = ['일', '월', '화', '수', '목', '금', '토'];

	  var hours = time.getHours();
	  var minutes = time.getMinutes();

	  // 날짜와 시간을 정규적인 형식으로 표시
	  Target.innerText =
	    `${year}년 ${month}월 ${date}일 ${week[day]}요일 ` +
	    `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes}` : minutes}`;
	}

	clock();
	setInterval(clock, 60000); // 1분마다 실행
 

 

});
