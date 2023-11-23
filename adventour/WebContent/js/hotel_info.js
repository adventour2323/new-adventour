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
		    zoom: 10, 
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
	

    // 이미지 요소 선택
    const imgElements = [
        document.querySelector(".h_info_title_pho1"),
        document.querySelector(".h_info_title_pho2"),
        document.querySelector(".h_info_title_pho3"),
        document.querySelector(".h_info_title_pho4"),
        document.querySelector(".h_info_title_pho5"),
        document.querySelector(".h_info_title_pho6"),
        document.querySelector(".h_info_title_pho7")
    ];

    const modal = document.querySelector(".modal");
    const modal_img = document.querySelector(".modal_content");
    const span = document.querySelector(".close");
    let currentImageIndex = 0; // 현재 이미지 인덱스

    // 이미지 클릭 이벤트 핸들러
    imgElements.forEach((imgElement, index) => {
        imgElement.addEventListener('click', () => {
            modal.style.display = "block";
            modal_img.src = imgElement.src;
            currentImageIndex = index; // 현재 이미지 인덱스 설정
        });
    });

    // 이전 이미지 버튼 클릭 시
    $('#prevImage').click(() => {
        currentImageIndex = (currentImageIndex - 1 + imgElements.length) % imgElements.length;
        modal_img.src = imgElements[currentImageIndex].src;
    });

    // 다음 이미지 버튼 클릭 시
    $('#nextImage').click(() => {
        currentImageIndex = (currentImageIndex + 1) % imgElements.length;
        modal_img.src = imgElements[currentImageIndex].src;
    });

    // 모달 닫기 버튼 클릭 시
    $('.close').on('click', function() {
        modal.style.display = "none";
    });

    // 모달 외부 클릭 시 모달 닫기
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
		
	
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