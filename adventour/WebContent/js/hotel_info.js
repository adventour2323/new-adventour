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
	//날짜계산	
    $("#sch_indate, #sch_outdate").on("change", function() {
        const schIndate = document.getElementById("sch_indate");
        const schOutdate = document.getElementById("sch_outdate");
        const nightTime = document.querySelector(".night_time");
        
        function updateNightTime() {
          const checkinDate = new Date(schIndate.value);
          const checkoutDate = new Date(schOutdate.value);
          
          if (!isNaN(checkinDate) && !isNaN(checkoutDate)) {
            const timeDifference = checkoutDate - checkinDate;
            const nightCount = timeDifference / (1000 * 3600 * 24); 

            if (nightCount >= 1) {
              nightTime.value = `${nightCount}박`;
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
      var peo= $(".sch_peo").val();

      // AJAX 요청 보내기
      $.ajax({
        type: "GET",
        url: "hotel_info_SCH.jsp", // 검색 결과를 처리할 JSP 페이지 URL
        data: { h_name_eng:name_eng,
        	    h_indate: indate,
        	    h_outdate: outdate,
        	    h_roompeo:peo}, // 검색어를 서버로 전송
        success: function(data) {
       
          $("#info_SCH").html(data);
        },
        error: function() {
          alert("일치하는 검색어가 없습니다.");
        }
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