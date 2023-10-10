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
//

  
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
    $(this).css("transform", "translate(-30px, -30px)");
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
 


});
