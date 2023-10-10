$(document).ready(function() {

	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");


//테이블에 마우스 올리면


	$('.c_list_table td').on('mouseenter click', function() {
		  $(this).parents('tr').css('background-color', '#D9E5FF');
		});

	$('.c_list_table td').on('mouseleave', function() {
		  $(this).parents('tr').css('background-color', '');
		});

	// 검색 버튼 클릭 시 AJAX 요청을 보냅니다.
    $(".c_schbtn").click(function(e) {
      e.preventDefault(); // 폼의 기본 동작 방지

      // 입력된 검색어 가져오기
      var searchText = $(".c_sch").val();

      // AJAX 요청 보내기
      $.ajax({
        type: "GET",
        url: "c_listsearch.jsp", // 검색 결과를 처리할 JSP 페이지 URL
        data: { c_sch: searchText }, // 검색어를 서버로 전송
        success: function(data) {
          // 서버에서 받은 HTML 데이터를 결과 테이블의 tbody에 추가
          $("#c_list_table tbody").html(data);
        },
        error: function() {
          alert("검색 중 오류가 발생했습니다.");
        }
      });
    });
    
});



