$(document).ready(function() {




//테이블에 마우스 올리면


	$('.c_list_table td').on('mouseenter click', function() {
		  $(this).parents('tr').css('background-color', '#D9E5FF');
		});

	$('.c_list_table td').on('mouseleave', function() {
		  $(this).parents('tr').css('background-color', '');
		});

//검색창기능 
	  // 검색 버튼 클릭 시 이벤트 핸들러
    $(".c_schbtn").click(function() {
        // 검색어를 가져오기
        var searchKeyword = $(".c_sch").val();

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "c_listsearch.jsp", // 검색 결과를 처리하는 JSP 파일 경로
            data: { keyword: searchKeyword }, // 서버로 보낼 데이터
            dataType: "html", // HTML을 사용하는 경우
            success: function(response) {
                // 검색 결과를 표시할 div 태그 선택
                var searchResultsDiv = $("#searchResultsDiv");

                // 검색 결과 표시
                searchResultsDiv.html(response);
            },
            error: function(error) {
                // 에러 처리
                console.error("에러 발생: " + error);
            }
        });
    });
    
    
    
});



