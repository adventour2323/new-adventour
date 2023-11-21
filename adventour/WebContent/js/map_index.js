// 전역 변수를 사용하여 맵 객체를 저장합니다
let map;

// 지정된 위도 및 경도로 맵을 설정하는 함수를 정의합니다
function initMap(lat, lng) {
    if (lat && lng) {
        // 만약 lat 및 lng 값이 존재한다면, 맵을 설정합니다
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: lat, lng: lng }, // 전달된 lat 및 lng 값을 사용하여 중심을 설정합니다
            zoom: 20 , // 줌 레벨을 설정합니다
        });

        // 전달된 lat 및 lng를 기반으로 마커를 추가합니다
        new google.maps.Marker({
            position: { lat: lat, lng: lng },
            label: "선택 호텔", // 레이블을 사용자 정의할 수 있습니다
            map: map, // 해당 맵에 마커를 추가합니다
        });
    } else {
        // 만약 lat 및 lng 값이 존재하지 않는 경우, 메시지를 표시합니다
        const mapElement = document.getElementById("map");
        mapElement.innerHTML = " '지도보기'를 누르면  <br> 위치가 표시 됩니다.";
        

        // 메시지 스타일링 (필요에 따라 조정합니다)
        mapElement.style.display = "flex"; // 필요한 경우 레이아웃을 조정합니다
        mapElement.style.alignItems = "center"; // 수직 정렬을 조절합니다
        mapElement.style.justifyContent = "center"; // 수평 정렬을 조절합니다
        mapElement.style.fontSize = "18px"; // 글꼴 크기를 조절합니다
        mapElement.style.fontweight = "bold"; // 글꼴 크기를 조절합니다
        mapElement.style.color = "red"; // 텍스트 색상을 변경합니다
    }
}

// 사용자 정의 좌표로 지도를 표시하는 함수를 정의합니다
function showMap(lat, lng) {
    initMap(lat, lng);
}
///////////////////////////////////h_sc 지도보기 클릭 끝///////////////////////



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	