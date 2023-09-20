
$(document).ready(function() {
	"use strict";
	 /*나라, 도시, 카테고리 등등 정보. 나중에 파일 또는 디비에서 가져올 예정
	 순서 보장을 위해 object.array가 아니라 object.object 사용
	 길이를 알기 위해서 Object.keys(obj).length 사용*/
	
	// 특정 페이지에서 해당 이벤트 핸들러 무시
	if (window.location.pathname.indexOf("hotel.html") === -1) {
	    $('.moveh').on('mouseenter click', function() {
	        $(this).css('color', 'white');
	        $(this).css('background-color', 'rgb(20, 3, 78)');
	    });

	    $('.moveh').on('mouseleave', function() {
	        $(this).css('color', 'rgb(20, 3, 78)');
	        $(this).css('background-color', '');
	    });
	}
	 
	 /*----------------메뉴 클릭시 색 변경  */
	/*투어*/
	$('.movet').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.movet').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)');
	$(this).css('background-color', '');
	});
	
	/*버스*/
	$('.moveb').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.moveb').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)');
	$(this).css('background-color', '');
	});
		
	/*호텔*/
	$('.moveh').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.moveh').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)'); 
	$(this).css('background-color', '');
	});
	
	/*쇼핑*/
	$('.moves').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.moves').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)');
	$(this).css('background-color', '');
	});
	
	/*게시판*/
	$('.movec').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.movec').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)');
	$(this).css('background-color', '');
	});
	
	/*문의사항*/
	$('.movem').on('mouseenter click', function() {
	$(this).css('color', 'white');
	$(this).css('background-color', 'rgb(20, 3, 78)');
	});
	
	$('.movem').on('mouseleave', function() {
	$(this).css('color', 'rgb(20, 3, 78)');
	$(this).css('background-color', '');
	});
	



	//슬라이드다운 메뉴
	/*지역 선택 메뉴 슬라이드*/
	$(".schtop").hide();
	
	/*투어*/
	$('.movet').on('mouseenter click', function() {
	$(".schtop").slideDown("fast");
	});
	
	/*버스*/
	$('.moveb').on('mouseenter click', function() {
	$(".schtop").slideDown("fast");
	});
	
	/*호텔*/
	$('.moveh').on('mouseenter click', function() {
	$(".schtop").slideDown("fast");
	});
	
	/*쇼핑*/
	$('.moves').on('mouseenter click', function() {
	$(".schtop").slideDown("fast");
	});
	
	/*슬라이드 업.*/
	$('.schtop').on('mouseleave', function() {
	$(".schtop").slideUp("fast");
	});


});
