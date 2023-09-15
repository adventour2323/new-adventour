//슬라이드다운 메뉴
  /*지역 선택 메뉴 슬라이드*/
  $(".schtop").hide();
 

$('.moveb').on('mouseenter click', function() {

  $(".schtop").slideDown("fast");
});

$('.schtop').on('mouseleave', function() {

  $(".schtop").slideUp("fast");
});
