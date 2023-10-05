$(document).ready(function() {
//	header 
	$("#header").load("header.html");
	$("#footer").load("footer.html");
  // ----------------메뉴 클릭시 색 변경    
  $('.menu1').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(117, 165, 236)');
  
  });

  $('.menu1').on('mouseleave', function() {
    $(this).css('color', 'rgb(2,48,2)');
    $(this).css('background-color', '');

  });
  $('.menu2').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(117, 165, 236)');
  
  });

  $('.menu2').on('mouseleave', function() {
    $(this).css('color', 'rgb(2,48,2)');
    $(this).css('background-color', '');

  });
  $('.menu4').on('mouseenter click', function() {
    $(this).css('color', 'white');
    $(this).css('background-color', 'rgb(117, 165, 236)');
  
  });

  $('.menu4').on('mouseleave', function() {
    $(this).css('color', 'rgb(2,48,2)');
    $(this).css('background-color', '');

  });
  $('.hbtitle').on('mouseenter click', function() {
    $(this).css('color', 'rgb(117, 165, 236)');
  });

  $('.hbtitle').on('mouseleave', function() {
    $(this).css('color', '');
  });
  $(document).ready(function() {
  let isRed = false;
//
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

  
//  
  /* 하트누르면 색변환*/
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



});




