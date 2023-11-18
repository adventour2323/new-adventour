$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header.html");
	$("#footer").load("footer.html");


	// 초기에 선택된 요소를 저장할 변수
	var selectedElement = null;

	$('#like_tour').on('click', function() {
	    // 현재 클릭된 요소에 스타일을 적용
	    $(this).css({
	        'background-color': 'rgb(117, 165, 236)',
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
	        'background-color': 'rgb(117, 165, 236)',
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

});
