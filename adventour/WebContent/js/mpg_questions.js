/*mpg_questions.js*/

$(document).ready(function() {
	//	헤더랑 푸터 담은 mpg_nvbox.html 로드
    $("#mpg_nvbox").load("mpg_nvbox.html");
    var sndBtn = document.getElementsByName("sndBtn")[0];//문의하기 보내기 버튼
    
    //첫번 째 탭기능 변수 선언
    var frstLtab1 = $('.frstLTab p').eq(0);
    var frstLtab2 = $('.frstLTab p').eq(1);
    var frstLtab3 = $('.frstLTab p').eq(2);
    var secLCtg1 = $('.my_qna').eq(0);//문의 내역 클릭하면 보이는 카테고리.
    var secLCtg2 = $('.sec_lne_ctgry').eq(0);//자주묻는 질문 클릭하면 보이는 카테고리.
    var secLCtg3 = $('.write').eq(0);//문의하기 클릭하면 보이는 카테고리.
    
//    첫번 째 탭기능 디폴트
    secLCtg1.hide();
    secLCtg3.hide();
    
    frstLtab1.click(function () {    	
    	loadMyQna();
    	
    	secLCtg1.show();
    	secLCtg2.hide();
        secLCtg3.hide();
    });
    frstLtab2.click(function () {    	
    	secLCtg2.show();
    	secLCtg1.hide();
    	secLCtg3.hide();
    });
    frstLtab3.click(function () {    	
    	secLCtg3.show();
    	secLCtg1.hide();
    	secLCtg2.hide();
    });
    
  //두번 째 탭기능 변수 선언   
    var sec_lne_ctgry = $('sec_lne_ctgry');  
    var secLTab_t = $('.secLTab').eq(0);
    var secLTab_b = $('.secLTab').eq(1);
    var secLTab_h = $('.secLTab').eq(2);
    var secLTab_s = $('.secLTab').eq(3);
    var secLTab_oP = $('.secLTab').eq(4);
    var secLTab_cs = $('.secLTab').eq(5);
   
    sndBtn.onclick = QInfoSendF

});

//var formInputs = $(document.qna_info).find('input,textarea,select');

//회원가입 Ajax: member_pjs.jsp와 연동
function QInfoSendF() {
	var qna_info = $('form[name=qna_info]');
	$.ajax({
		url: 'mpg_questions_save.jsp',
		type: 'POST',
		dataType: 'text',
		data: $('form[name=qna_info]').serialize()+"&m_id=qkqh4848",
		success: function(data) {
			
			if(data > 0){//member_pjs.jsp의 out.println("")중에 sucess가 있다면
				alert("문의 등록이 완료되었습니다..");
//				formInputs.each(function(){
				$(document.qna_info).find('input,textarea,select').each(function(){
				   this.value = ''; 
				});
//				window.location.href = 'mpg_questions.html.jsp';
			}else{
				alert("일시적인 사유로 문의 등록이 실패하였습니다.");
			}
		},
		error: function(error) {
			console.error('Request error:', error);
		}
	});
}
function loadMyQna(){
	
	$.ajax({
		url: 'mpg_questions_select.jsp',
		type: 'POST',
		dataType: 'text',
		data: "m_id=qkqh4848",
		success: function(data) {
			try{
				var myqnaCkB = $('#myqnaCkB');
				myqnaCkB.empty();
				var result = JSON.parse(data.trim());
				for(var i in result){
//					myqnaCkB.append($('<option>', {
//						value: row.engNm,
//						text: row.korNm
//					}));
					myqnaCkB.append($('<label><input type="checkbox" title="" value="" name="">'+result[i].q_title+'</label><p>답변완료</p>'));
				}
			}catch(error){
//				error
			}
		},
		error: function(error) {
			console.error('Request error:', error);
		}
	});
	
	
	
	
}