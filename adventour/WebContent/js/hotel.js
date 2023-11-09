$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
//	var id = session.getAttribute("id"); // 세션에서 "id" 값을 가져옵니다.
//
//    if (id) {
//        // "id" 값이 존재하면 header_login.jsp를 로드합니다.
//        $("#header").load("header_login.jsp");
//    } else {
//        // "id" 값이 존재하지 않으면 header.html을 로드합니다.
//        $("#header").load("header.html");
//    }
//
//    // 항상 footer.html을 로드합니다.
//    $("#footer").load("footer.html");
//
//----------------------------------------메인 검색창 select--------------------
	//셀렉박스 나라별 옵션 설정
	$('.h_mainde').on('change', function() {
        var country = $(this).val();
        var citySelect = $('.h_maincity');
        
        // 모든 옵션을 보이게 설정
        citySelect.find('option').show();
        
        // 선택 가능한 도시 옵션만 보이도록 설정
        if (country === 'uk') {
            citySelect.find('option').not('[value="london"], [value="liverpool"], [value="edinburgh"]').hide();
        } else if (country === 'italy') {
            citySelect.find('option').not('[value="rome"], [value="venice"], [value="milano"]').hide();
        } else if (country === 'france') {
            citySelect.find('option').not('[value="paris"], [value="marseille"], [value="monaco"]').hide();
        } else if (country === 'spain') {
            citySelect.find('option').not('[value="madrid"], [value="barcelona"], [value="sevilla"]').hide();
        } else if (country === 'all') {
            citySelect.find('option').not('[value="all"]').hide();
        }
    });
	
	$('.h_maincity').on('change', function() {
        var city = $(this).val();
        var countrySelect = $('.h_mainde');
        
        // 모든 옵션을 보이게 설정
        countrySelect.find('option').show();
        
        // 선택 가능한 도시 옵션만 보이도록 설정
        if (city === 'london' || city === 'liverpool' ||city === 'edinburgh') {
        	countrySelect.find('option').not('[value="uk"]').hide();
        } else if (country === 'rome' || country === 'venice'|| country === 'milano') {
        	countrySelect.find('option').not('[value="italy"]').hide();
        } else if (city === 'paris'||city === 'marseille'||city === 'monaco') {
        	countrySelect.find('option').not('[value="france"]').hide();
        } else if (city === 'madrid'||city === 'barcelona'||city === 'sevilla') {
        	countrySelect.find('option').not('[value="spain"]').hide();
        } else if (city === 'all') {
        	countrySelect.find('option').not('[value="all"]').hide();
        }
    });
	
	
	// 각 달별로 날짜 select
	
	$('.h_indateM').on('change', function() {
	    var MM = $(this).val();
	    

	    
	    if (MM === '1' || MM === '3' || MM === '5' || MM === '7' || MM === '8' || MM === '10'|| MM === '12') {
	        for (var i = 1; i < 32; i++) {
	            $('.h_indateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    } else if (MM === '2') {
	        for (var i = 1; i < 29; i++) {
	            $('.h_indateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    } else if (MM === '4' || MM === '6' || MM === '9' || MM === '11') {
	        for (var i = 1; i < 31; i++) {
	            $('.h_indateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    }
	});
	
	$('.h_outdateM').on('change', function() {
	    var MM = $(this).val();
	    

	    
	    if (MM === '1' || MM === '3' || MM === '5' || MM === '7' || MM === '8' || MM === '10'  || MM === '12') {
	        for (var i = 1; i < 32; i++) {
	            $('.h_outdateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    } else if (MM === '2') {
	        for (var i = 1; i < 29; i++) {
	            $('.h_outdateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    } else if (MM === '4' || MM === '6' || MM === '9' || MM === '11') {
	        for (var i = 1; i < 31; i++) {
	            $('.h_outdateD').append('<option value="' + i + '">' + i + '</option>');
	        }
	    }
	});
  
  
 //----------------------------------------top10 슬라이드--------------
 new Swiper('.awards .swiper', {
  // direction: 'horizontal',

  loop: true,
  spaceBetween: 15,
  slidesPerView: 5,
  navigation: {
    prevEl: '.awards .swiper-prev',
    nextEl: '.awards .swiper-next'
  }
});
////// top1 -10 에니메이션  
// 움직임을 주고자 하는 이미지들의 클래스 이름을 배열로 저장
var imageClasses = [".top1", ".top2", ".top3", ".top4", ".top5", ".top6", ".top7", ".top8", ".top9", ".top10"];

imageClasses.forEach(function(className) { //마우스오버
  $(className).hover(function(){
    $('.imageClasses').css('filter','brightness(0.5)');
    $(this).css("transform", "translate(-7px, -7px)");
    $(this).css("transition", "transform 0.2s ease-in-out");
  
  }, function(){
    $('.imageClasses').css('filter','brightness(1)');
    $(this).css("transform", "none");
    $(this).css("transition", "transform 0.2s ease-in-out");

  });
});




////------------------------------------------지역으로 고르기------------
//영국
  $('.h_recityimg1').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
    $('.h_recityimg1').css('filter','brightness(0.5)'); //이미지의 색이 어두워지고
  });

  $('.h_recityimg1').on('mouseleave', function() { //이미지위에 마우스가 없으면
    $('.h_recityimg1').css('filter','brightness(1)'); // 밝기는 돌아온다
  });




  //이탈리아

  $('.h_recityimg2').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
    $('.h_recityimg2').css('filter','brightness(0.5)'); //이미지의 색이 어두워지고
  });

  $('.h_recityimg2').on('mouseleave', function() { //이미지위에 마우스가 없으면
    $('.h_recityimg2').css('filter','brightness(1)'); // 밝기는 돌아온다
  });



  //프랑스
 
  $('.h_recityimg3').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
    $('.h_recityimg3').css('filter','brightness(0.5)'); //이미지의 색이 어두워지고
  });
  $('.h_recityimg3').on('mouseleave', function() { //이미지위에 마우스가 없으면

    $('.h_recityimg3').css('filter','brightness(1)'); // 밝기는 돌아온다
  });
  //스페인
  $('.h_recityimg4').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
    $('.h_recityimg4').css('filter','brightness(0.5)'); //이미지의 색이 어두워지고
  });
  $('.h_recityimg4').on('mouseleave', function() { //이미지위에 마우스가 없으면

    $('.h_recityimg4').css('filter','brightness(1)'); // 밝기는 돌아온다
  });


 /*지역 선택 메뉴 슬라이드*/
 $(".schtop").hide();
 

 $('.moveh').on('mouseenter click', function() {
 
   $(".schtop").slideDown("fast");
 });
 
 $('.schtop').on('mouseleave', function() {
 
   $(".schtop").slideUp("fast");
 });
 
//현재의 이전 날짜를 선택하지 못하도록 설정
 function getCurrentDate() {
     var today = new Date();
     var year = today.getFullYear();
     var month = today.getMonth() + 1; // 월은 0부터 시작하므로 +1
     var day = today.getDate();
     return new Date(year, month - 1, day); // Date 객체로 반환
 }

 // 검색시 날짜 비교 및 안내 메시지 표시

 $('form[name="h_main_sch_form"]').on('submit', function(event) {
	    var currentDate = getCurrentDate();
	    var mh_indate = new Date($('.h_indateY').val(), $('.h_indateM').val() - 1, $('.h_indateD').val()); 
	    var mh_outdate = new Date($('.h_outdateY').val(), $('.h_outdateM').val() - 1, $('.h_outdateD').val()); 

	    if (mh_indate < currentDate || mh_outdate < currentDate) {
	        alert("과거 날짜는 선택할 수 없습니다. 날짜를 다시 확인하세요.");
	        event.preventDefault(); // 폼 제출 차단
	    } else if (mh_indate > mh_outdate) {
	        alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다. 날짜를 다시 확인하세요.");
	        event.preventDefault(); // 폼 제출 차단
	    }  
 });

//숫자에 콤마 찍기
	var elements = document.querySelectorAll(".pack_pri");

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
