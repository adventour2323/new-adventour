$(document).ready(function() {
  // ----------------메뉴 클릭시 색 변경    
  $('.movet').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(20, 3, 78)');
  
  });

  $('.movet').on('mouseleave', function() {
    $(this).css('color', 'rgb(2,48,2)');
    $(this).css('background-color', '');

  });
  $('.moveh').on('mouseenter click', function() {
    $(this).css('color', 'white');
   
    $(this).css('background-color', 'rgb(20, 3, 78)');
  
  });

  $('.moveh').on('mouseleave', function() {
    $(this).css('color', 'rgb(2,48,2)');
    $(this).css('background-color', '');

  });
  $('.moves').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(20, 3, 78)');
   
  });

  $('.moves').on('mouseleave', function() {
    $(this).css('color', 'rgb(20, 3, 78)');
    $(this).css('background-color', '');

  });
  $('.moveb').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(20, 3, 78)');
  
  });

  $('.moveb').on('mouseleave', function() {
    $(this).css('color', 'rgb(20, 3, 78)');
    $(this).css('background-color', '');

  })
  $('.movem').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(20, 3, 78)');
  
  });

  $('.movem').on('mouseleave', function() {
    $(this).css('color', 'rgb(20, 3, 78)');
    $(this).css('background-color', '');

  })

  //슬라이드다운 메뉴
  /*지역 선택 메뉴 슬라이드*/
  $(".schtop").hide();
 

$('.moveb').on('mouseenter click', function() {

  $(".schtop").slideDown("fast");
});

$('.schtop').on('mouseleave', function() {

  $(".schtop").slideUp("fast");
});

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

function clock() {
  var Target = document.getElementById("clock");
  var time = new Date();

  var year = time.getYear();
  var month = time.getMonth();
  var date = time.getDate();
  var day = time.getDay();
  var week = ['일', '월', '화', '수', '목', '금', '토'];

  var hours = time.getHours();
  var minutes = time.getMinutes();
 

  Target.innerText = 
  `${year+1900}년${month + 1}월 ${date}일 ${week[day]}요일 ` +
  `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes}` : minutes}`;
      
}
clock();
setInterval(clock, 60000); // 1초마다 실행

//테이블에 마우스 올리면
$('tr').hover(
        function() {
          $(this).addClass('highlighted'); // 마우스를 올렸을 때 클래스 추가
        },
        function() {
          $(this).removeClass('highlighted'); // 마우스를 떼면 클래스 제거
        }
      );

//검색창기능 
//검색 버튼 클릭 시 이벤트 핸들러
$(".c_schbtn").click(function() {
  // 검색어를 가져오기
  var searchKeyword = $(".c_sch").val();

  // AJAX 요청
  $.ajax({
    type: "POST", // 또는 "GET" 요청 방식을 선택하세요.
    url: "검색을 처리하는 서버쪽 URL을 입력하세요",
    data: { keyword: searchKeyword }, // 서버로 보낼 데이터
    dataType: "json", // 응답 데이터 타입 (JSON을 사용하는 경우)
    success: function(response) {
      // 검색 결과를 처리하는 함수 호출
      handleSearchResults(response);
    },
    error: function(error) {
      // 에러 처리
      console.error("에러 발생: " + error);
    }
  });
});

// 검색 결과를 처리하는 함수
function handleSearchResults(results) {
  // 결과를 표시할 HTML 요소 선택
  var cListTable = $("#c_list_table");

  // 테이블 초기화
  cListTable.empty();

  // 결과 반복해서 테이블에 추가
  for (var i = 0; i < results.length; i++) {
    var result = results[i];
    var row = "<tr>" +
              "<td>" + result.c_num + "</td>" +
              "<td class='c_list_title1'>" + result.c_title + "</td>" +
              "<td>" + result.m_id + "</td>" +
              "<td>" + result.c_date + "</td>" +
              "<td>" + result.country + "</td>" +
              "<td>" + result.city + "</td>" +
              "</tr>";

    cListTable.append(row);
  }
}



});
