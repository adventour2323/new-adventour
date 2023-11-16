$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
	
  

		  
		  //위치지도
	window.initMap = function () {
		  var lat_info = $(".hh_lat").val();
		  var lng_info = $(".hh_lng").val(); 
		  
		  const map = new google.maps.Map(document.getElementById("map"), {
		    center: { lat: parseFloat(lat_info), lng: parseFloat(lng_info) }, 
		    zoom: 15, 
		  });
		  
		  new google.maps.Marker({
		    position: { lat: parseFloat(lat_info), lng: parseFloat(lng_info) },
		    label: "선택위치",
		    map: map
		  });
		};

		initMap();
		

////	    // 왼쪽 검색창에 날짜 선택
//	    $.datepicker.setDefaults({
//	        dateFormat: 'yy-mm-dd',
//	        prevText: '이전 달',
//	        nextText: '다음 달',
//	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
//	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
//	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
//	        showMonthAfterYear: true,
//	        yearSuffix: '년'
//	    });
//
//	    $(function () {
//	        $('.datepicker').datepicker();
//	    });
//  
//	    // 검색시 날짜 비교 및 안내 메시지 표시
//	    $('form[name="info_to_reserv"]').on('submit', function(event) {
//	        var today = new Date(); // 현재 날짜를 가져옵니다.
//	        var currentDate = getCurrentDate(today);
//	        var h_indate = $('#sch_indate').val();
//	        var h_outdate = $('#sch_outdate').val();
//
//	        if (h_indate < currentDate || h_outdate < currentDate) {
//	            alert("과거 날짜는 선택할 수 없습니다. 날짜를 다시 확인하세요.");
//	            event.preventDefault(); // 폼 제출을 중단합니다.
//	        } else if (h_indate > h_outdate) {
//	            alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다. 날짜를 다시 확인하세요.");
//	            event.preventDefault(); // 폼 제출을 중단합니다.
//	        }
//	    });
//
//	    // 현재의 이전 날짜를 선택하지 못하도록 설정
//	    function getCurrentDate(today) {
//	        var year = today.getFullYear();
//	        var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
//	        var day = today.getDate();
//	        return year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
//	    }
//  	

 // 숫자에 콤마 찍기
	var elements = document.querySelectorAll(".h_room_price");

	if (elements) {
	  elements.forEach(function(element) {

	    var text = element.textContent;


	    var formattedText = addCommasToNumber(text);


	    element.textContent = formattedText;
	  });
	}
	


	// 세 자리마다 콤마를 추가하는 함수
	function addCommasToNumber(numberString) {
	  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
/// 모달창
	const modal = document.querySelector(".modal");
	const img1 = document.querySelector(".h_info_title_pho1");
	const img2 = document.querySelector(".h_info_title_pho2");
	const img3 = document.querySelector(".h_info_title_pho3");
	const img4 = document.querySelector(".h_info_title_pho4");
	const img5 = document.querySelector(".h_info_title_pho5");
	const img6 = document.querySelector(".h_info_title_pho6");
	const img7 = document.querySelector(".h_info_title_pho7");
	const modal_img = document.querySelector(".modal_content");
	const span = document.querySelector(".close");

	img1.addEventListener('click', ()=>{
	  modalDisplay("block");
	  modal_img.src = img1.src;
	});
	img2.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img2.src;
		});
	img3.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img3.src;
		});
	img4.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img4.src;
		});
	img5.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img5.src;
		});
	img6.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img6.src;
		});
	img7.addEventListener('click', ()=>{
		  modalDisplay("block");
		  modal_img.src = img7.src;
		});
	
	span.addEventListener('click', ()=>{
	  modalDisplay("none");
	});
	modal.addEventListener('click', ()=>{
	  modalDisplay("none");
	});
	function modalDisplay(text){
	  modal.style.display = text;
	}
	  /*왼쪽 검색창 날짜 픽 */

	//날짜계산	
	$(document).ready(function() { 
        const schIndate = document.getElementById("sch_indate");
        const schOutdate = document.getElementById("sch_outdate");
        const nightTime = document.querySelector("#night_time");
        
        function updateNightTime() {
          const checkinDate = new Date(schIndate.value);
          const checkoutDate = new Date(schOutdate.value);
          
          if (!isNaN(checkinDate) && !isNaN(checkoutDate)) {
            const timeDifference = checkoutDate - checkinDate;
            const nightCount = Math.floor(timeDifference / (1000 * 3600 * 24)); // 소수점 이하를 제거하여 정수로 변환

            if (nightCount >= 1) {
              nightTime.value = `${nightCount}`;
            } else {
              nightTime.value = "체크아웃 - 체크인";
            }
          } else {
            nightTime.value = ""; 
          }
        }
        
        updateNightTime();
    });
	

	// 검색창 버튼
	$(".h_info_search_btn").click(function(e) {

	  // 입력된 검색어 가져오기
	  var name_eng = $(".h_info_search_nameeng").val();
	  var indate = $("#sch_indate").val();
	  var outdate = $("#sch_outdate").val();
	  var peo = $(".sch_peo").val();

	  // 날짜를 Date 객체로 변환
	  var checkInDate = new Date(indate);
	  var checkOutDate = new Date(outdate);

	  // 두 날짜 사이의 밤 수 계산
	  var timeDifference = checkOutDate - checkInDate;
	  var night_time = timeDifference / (1000 * 60 * 60 * 24); // 1일은 24시간 x 60분 x 60초 x 1000밀리초

	  if (!name_eng || !indate || !outdate || !peo) {
	    alert("검색 정보를 입력 후 검색해주세요.");
	  } else {
	    $.ajax({
	      type: "GET",
	      url: "hotel_info_SCH.jsp", // 검색 결과를 처리할 JSP 페이지 URL
	      data: {
	        h_name_eng: name_eng,
	        h_indate: indate,
	        h_outdate: outdate,
	        h_roompeo: peo,
	        night_time: night_time // 밤 수를 서버로 전송
	      },
	      success: function(data) {
	        $("#info_SCH").html(data);
	      },
	      error: function() {
	        alert("일치하는 검색어가 없습니다.");
	      }
	    });
	  };
	});

	
/*----------------룸정보 이미슬라이더------------------------*/
    $(document).ready(function() {
    	    const slides = $('.slide'); // 슬라이드 이미지 요소들
    	    const prevButton = $('#prevButton'); // 이전 버튼
    	    const nextButton = $('#nextButton'); // 다음 버튼
    	    let currentIndex = 0; // 현재 슬라이드의 인덱스

    	    // 초기에 첫 번째 슬라이드 이미지만 보이도록 설정
    	    slides.eq(currentIndex).show();

    	    // 다음 슬라이드로 이동
    	    nextButton.click(function() {
    	        // 현재 슬라이드 숨기기
    	        slides.eq(currentIndex).hide();

    	        // 다음 슬라이드로 이동 (순환 처리)
    	        currentIndex = (currentIndex + 1) % slides.length;

    	        // 다음 슬라이드 표시
    	        slides.eq(currentIndex).show();
    	    });

    	    // 이전 슬라이드로 이동
    	    prevButton.click(function() {
    	        // 현재 슬라이드 숨기기
    	        slides.eq(currentIndex).hide();

    	        // 이전 슬라이드로 이동 (순환 처리)
    	        currentIndex = (currentIndex - 1 + slides.length) % slides.length;

    	        // 이전 슬라이드 표시
    	        slides.eq(currentIndex).show();
    	    });
    	});

/*-------------------리뷰 글자수 세기------------------------*/	

    const textarea = document.getElementById('reviewContents');
    const charCount = document.getElementById('charCount');

    textarea.addEventListener('input', function() {
      const text = this.value;
      const length = text.length;
      charCount.textContent = length + " / 255"; // 여기에서 최대 글자 수인 255로 설정
    });	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});