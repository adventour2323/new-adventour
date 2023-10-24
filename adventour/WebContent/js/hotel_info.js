$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");
	
	document.addEventListener('DOMContentLoaded', function() {
		  const hotelInfoElement = document.querySelector('.db_h_hotel_info');
		  if (hotelInfoElement) {
		    const originalText = hotelInfoElement.innerHTML;
		    const modifiedText = originalText.replace(/\n/g, '<br>'); // \n을 <br>로 대체
		    hotelInfoElement.innerHTML = modifiedText; // 처리된 내용을 다시 HTML에 삽입
		  }
		});

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
  	
// 몇박 인지 계산해줌 
  	
    // 요소들을 가져옵니다.
    const schIndate = document.getElementById("sch_indate");
    const schOutdate = document.getElementById("sch_outdate");
    const nightTime = document.querySelector(".night_time");

    // 입력 값이 변경될 때 박수를 계산하기 위한 이벤트 리스너를 추가합니다.
    schIndate.addEventListener("input", updateNightTime);
    schOutdate.addEventListener("input", updateNightTime);

    function updateNightTime() {
      const checkinDate = new Date(schIndate.value);
      const checkoutDate = new Date(schOutdate.value);

      if (!isNaN(checkinDate) && !isNaN(checkoutDate)) {
        const timeDifference = checkoutDate - checkinDate;
        const nightCount = timeDifference / (1000 * 3600 * 24); // 박 수 계산

        if (nightCount >= 1) {
          nightTime.value = `${nightCount}박`;
        } else {
          nightTime.value = "체크아웃 - 체크인";
        }
      }
    }
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

	//검색창
	
	// JavaScript를 사용하여 클릭 이벤트를 처리합니다.
	document.querySelector("#searchLink").addEventListener("click", function() {
	    var indateValue = document.getElementById("sch_indate").value;
	    var outdateValue = document.getElementById("sch_outdate").value;
	    var hotelName = document.getElementById("h_info_search_name").value;
	    var peoValue = document.getElementById("sch_peo").value; // "person" 파라미터 값 추가

	    var url = "hotelinfosearch.hotel?uname=hinfosearch&hotel=" + hotelName + "&checkin=" + indateValue + "&checkout=" + outdateValue + "&person=" + peoValue;
	    window.location.href = url;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});