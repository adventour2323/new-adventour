$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");


	  // 초기에 선택된 요소를 저장할 변수
    var selectedElement = null;

    // 초기에 #like_tour를 선택된 상태로 설정
    selectedElement = $('#like_tour');
    selectedElement.css({
        'background-color': 'rgb(117, 165, 236, 0.6)',
        'border': '1px solid'
    });

    $('#like_tour').on('click', function() {
        // 현재 클릭된 요소에 스타일을 적용
        $(this).css({
            'background-color': 'rgb(117, 165, 236, 0.6)',
            'border': '1px solid'
        });

        // 이전에 선택된 요소가 있다면 해당 요소의 스타일을 제거
        if (selectedElement && selectedElement.attr('id') !== 'like_tour') {
            selectedElement.css({
                'background-color': '',
                'border': ''
            });
        }

        // 현재 클릭된 요소를 선택된 요소로 설정
        selectedElement = $(this);
    });

    $('#like_hotel').on('click', function() {
        // 현재 클릭된 요소에 스타일을 적용
        $(this).css({
            'background-color': 'rgb(117, 165, 236, 0.6)',
            'border': '1px solid'
        });

        // 이전에 선택된 요소가 있다면 해당 요소의 스타일을 제거
        if (selectedElement && selectedElement.attr('id') !== 'like_hotel') {
            selectedElement.css({
                'background-color': '',
                'border': ''
            });
        }

        // 현재 클릭된 요소를 선택된 요소로 설정
        selectedElement = $(this);
    });

    var m_id = $(".sess_id").val();
    
    alert("확인용 123"+m_id);
    $('#like_hotel').on('click', function() {    
    $.ajax({
	      type: "GET",
	      url: "mypage_like.jsp",
	      data: {
	    	  m_id :m_id
	      },
	      success: function(data) {
	        $("#like_ul").html(data);
	      },
	      error: function() {
	        alert("ajax오류 확인 필요.");
	      }
	    });
	
    });	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

});
