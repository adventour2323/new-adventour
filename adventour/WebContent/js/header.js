//슬라이드다운 메뉴
  /*지역 선택 메뉴 슬라이드*/
$(document).ready(function() {

    // 나라, 도시, 카테고리 등등 정보. 나중에 파일 또는 디비에서 가져올 예정
    // 순서 보장을 위해 object.array가 아니라 object.object 사용
    // 길이를 알기 위해서 Object.keys(obj).length 사용
  // ----------------메뉴 클릭시 색 변경    s
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
  $('.movec').on('mouseenter click', function() {
	    $(this).css('color', 'white');
	    $(this).css('background-color', 'rgb(20, 3, 78)');
	  
	  });

	  $('.movec').on('mouseleave', function() {
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

	  });
	  //사진 검색창 버튼 

	  $('.b_maintbtn').on('mouseenter click', function() {
		  
		    $(this).css('background-color', 'yellow');
		  
		  });

		  $('.b_maintbtn').on('mouseleave', function() {
		
		    $(this).css('background-color', 'white');

		  });

	  
	  
  //슬라이드다운 메뉴
  /*지역 선택 메뉴 슬라이드*/
  $(".schtop").hide();
 

$('.moveb').on('mouseenter click', function() {

  $(".schtop").slideDown("fast");
});

$('.schtop').on('mouseleave', function() {

  $(".schtop").slideUp("fast");
});
});
