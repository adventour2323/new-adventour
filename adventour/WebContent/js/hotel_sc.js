$(document).ready(function() {
    // 헤더와 푸터 로드
    $("#header").load("header.html");
    $("#footer").load("footer.html");

	//셀렉박스 나라별 옵션 설정
	$('.sch_country').on('change', function() {
        var country = $(this).val();
        var citySelect = $('.sch_city');
        
        // 모든 옵션을 보이게 설정
        citySelect.find('option').show();
        
        // 선택 가능한 도시 옵션만 보이도록 설정
        if (country === 'uk') {
            citySelect.find('option').not('[value="london"], [value="liverpool"], [value="edinburgh"]').hide();
        } else if (country === 'italy') {
            citySelect.find('option').not('[value="rome"], [value="venice"], [value="milano"]').hide();
        } else if (country === 'france') {
            citySelect.find('option').not('[value="paris"], [value="marseille"], [value="monaco"]').hide();
        } else if (country === 'spain') {
            citySelect.find('option').not('[value="madrid"], [value="barcelona"], [value="sevilla"]').hide();
        } else if (country === 'all') {
            citySelect.find('option').not('[value="all"]').hide();
        }
    });
	
	$('.sch_country').on('change', function() {
        var city = $(this).val();
        var countrySelect = $('.h_mainde');
        
        // 모든 옵션을 보이게 설정
        countrySelect.find('option').show();
        
        // 선택 가능한 도시 옵션만 보이도록 설정
        if (city === 'london' || city === 'liverpool' ||city === 'edinburgh') {
        	countrySelect.find('option').not('[value="uk"]').hide();
        } else if (country === 'rome' || country === 'venice'|| country === 'milano') {
        	countrySelect.find('option').not('[value="italy"]').hide();
        } else if (city === 'paris'||city === 'marseille'||city === 'monaco') {
        	countrySelect.find('option').not('[value="france"]').hide();
        } else if (city === 'madrid'||city === 'barcelona'||city === 'sevilla') {
        	countrySelect.find('option').not('[value="spain"]').hide();
        } else if (city === 'all') {
        	countrySelect.find('option').not('[value="all"]').hide();
        }
    });
	

    // 왼쪽 검색창에 날짜 선택
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function () {
        $('.datepicker').datepicker();
    });

    // 숫자에 콤마 찍기
    var elements = document.querySelectorAll(".h_tiprice");

    if (elements) {
        elements.forEach(function(element) {
            // 요소에서 텍스트 내용을 가져옵니다.
            var text = element.textContent;

            // 콤마를 추가할 숫자 형식의 문자열을 만듭니다.
            var formattedText = addCommasToNumber(text);

            // 포맷된 문자열로 요소의 내용을 대체합니다.
            element.textContent = formattedText;
        });
    }

    // 세 자리마다 콤마를 추가하는 함수를 정의합니다.
    function addCommasToNumber(numberString) {
        return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 검색창에 조건을 설정
    function checkAndSearch() {
        var minpri = parseInt($(".sch_minpri").val());
        var maxpri = parseInt($(".sch_maxpri").val());

        // sch_minpri와 sch_maxpri의 값이 유효한 숫자인지 확인
        if (isNaN(minpri) || isNaN(maxpri)) {
            alert("금액을 다시 확인하세요.");
        } else {
            // sch_minpri가 sch_maxpri보다 큰 경우 검색하기
            if (minpri > maxpri) {
                alert("최소 요금이 최대 요금보다 큽니다. 다시 확인하세요.");
            }
        }
    }

    // 검색시 날짜 비교 및 안내 메시지 표시
    $('form[name="schnav_form"]').on('submit', function(event) {
        var today = new Date(); // 현재 날짜를 가져옵니다.
        var currentDate = getCurrentDate(today);
        var h_indate = $('#sch_indate').val();
        var h_outdate = $('#sch_outdate').val();

        if (h_indate < currentDate || h_outdate < currentDate) {
            alert("과거 날짜는 선택할 수 없습니다. 날짜를 다시 확인하세요.");
            event.preventDefault(); // 폼 제출을 중단합니다.
        } else if (h_indate > h_outdate) {
            alert("체크아웃 날짜는 체크인 날짜 이후여야 합니다. 날짜를 다시 확인하세요.");
            event.preventDefault(); // 폼 제출을 중단합니다.
        }
    });

    // 현재의 이전 날짜를 선택하지 못하도록 설정
    function getCurrentDate(today) {
        var year = today.getFullYear();
        var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
        var day = today.getDate();
        return year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
    }
    

});