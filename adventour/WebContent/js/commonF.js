//로그인 쿠키

function getCookie(name) {
    // 쿠키 문자열을 세미콜론으로 분리하여 각 쿠키를 배열로 변환합니다.
    var cookies = document.cookie.split("; ");
    
    for (var i = 0; i < cookies.length; i++) {
        // 쿠키 문자열을 KEY와 VALUE로 분리합니다.
        var cookie = cookies[i].split("=");
        var key = cookie[0];
        var value = cookie[1];
        
        // 찾고자 하는 쿠키의 KEY가 맞는지 확인합니다.
        if (key === name) {
            return decodeURIComponent(value); // 값을 디코딩하여 반환합니다.
        }
    }
    
    return null; // 찾고자 하는 쿠키가 없을 경우 null을 반환합니다.
}