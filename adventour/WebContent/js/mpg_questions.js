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
    
    var t_QnA_li = $('.t_qna_all').eq(0);
    var b_QnA_li = $('.b_qna_all').eq(0);
    var h_QnA_li = $('.h_qna_all').eq(0);
    var s_QnA_li = $('.s_qna_all').eq(0);
    var o_QnA_liP = $('.oP_qna_all').eq(0);
    var c_QnA_lis = $('.cs_qna_all').eq(0);
  
    /*투어 탭 클릭했을 경우 투어 관련 문의 리스트만 나옴.*/
    secLTab_t.click(function () {       
        t_QnA_li.show();
        b_QnA_li.hide();
        h_QnA_li.hide();
        s_QnA_li.hide();
        oP_QnA_li.hide();
        cs_QnA_li.hide();
    });
    
    /*버스 탭 클릭했을 경우 버스 관련 문의 리스트만 나옴.*/
    secLTab_b.click(function () {       
    	b_QnA_li.show();
    	t_QnA_li.hide();
    	h_QnA_li.hide();
    	s_QnA_li.hide();
    	oP_QnA_li.hide();
    	cs_QnA_li.hide();
    });
    
    /*호텔 탭 클릭했을 경우 호텔 관련 문의 리스트만 나옴.*/
    secLTab_h.click(function () {       
    	h_QnA_li.show();
    	t_QnA_li.hide();
    	b_QnA_li.hide();
    	s_QnA_li.hide();
    	oP_QnA_li.hide();
    	cs_QnA_li.hide();
    });
    
    /*shop 탭 클릭했을 경우 shop 관련 문의 리스트만 나옴.*/
    secLTab_s.click(function () {       
    	s_QnA_li.show();
    	t_QnA_li.hide();
    	b_QnA_li.hide();
    	h_QnA_li.hide();
    	oP_QnA_li.hide();
    	cs_QnA_li.hide();
    });
    
    /*주문/결제 탭 클릭했을 경우 주문/결제 관련 문의 리스트만 나옴.*/
    secLTab_oP.click(function () {       
    	oP_QnA_li.show();
    	t_QnA_li.hide();
    	b_QnA_li.hide();
    	h_QnA_li.hide();
    	s_QnA_li.hide();
    	cs_QnA_li.hide();
    });
    
    /*회원서비스 탭 클릭했을 경우 회원 서비스 관련 문의 리스트만 나옴.*/
    secLTab_cs.click(function () {       
    	cs_QnA_li.show();
    	t_QnA_li.hide();
    	b_QnA_li.hide();
    	h_QnA_li.hide();
    	s_QnA_li.hide();
    	oP_QnA_li.hide();
    });
    
    /**/
    sndBtn.onclick = QInfoSendF

});

//var formInputs = $(document.qna_info).find('input,textarea,select');

//문의 등록 Ajax: mpg_questions_save.jsp와 연동
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
//function loadMyQna(){
//	
//	$.ajax({
//		url: 'mpg_questions_select.jsp',
//		type: 'POST',
//		dataType: 'text',
//		data: "m_id=qkqh4848",
//		success: function(data) {
//			try{
//				var myqnaCkB = $('#myqnaCkB');
//				myqnaCkB.empty();
//				var result = JSON.parse(data.trim());
//				for(var i in result){
////					myqnaCkB.append($('<option>', {
////						value: row.engNm,
////						text: row.korNm
////					}));
//					myqnaCkB.append($('<label><input type="checkbox" title="" value="" name="">'+result[i].q_title+'</label><p>답변완료</p>'));
//				}
//			}catch(error){
////				error
//			}
//		},
//		error: function(error) {
//			console.error('Request error:', error);
//		}
//	});
//	
//}



function loadMyQna(){
	
	$.ajax({
		url: 'mpg_questions_select.jsp',
		type: 'POST',
		dataType: 'text',
		data: "m_id=qkqh4848",
		success: function(data) {
			try{
				var myqnaCkB = $('#myqnaCkB');
				var qnaDtB = $('.qna_dtail_box');
				myqnaCkB.empty();
				qnaDtB.empty();
				var result = JSON.parse(data.trim());
				for(var i in result){
//					myqnaCkB.append($('<option>', {
//						value: row.engNm,
//						text: row.korNm
//					}));
					myqnaCkB.append($('<label><input type="checkbox" title="" value="" name="">'+result[i].q_title+'</label><p>답변완료</p>'));
					var myQ = myqnaCkB.append($('<label><input type="checkbox" title="" value="" name="">'+result[i].q_title+'</label><p>답변완료</p>'));
					/*var qtitle= $("#db_Pul_Title");*/
					myQ.onclick =  myQ
					if(myQ){
						qnaDtB.append($('<div class="qna_dtail_box"><div class="qna_dtail_box_band"><div class="myquestion"><h4 class=""><span id="db_Pul_Title">'+result[i].q_title+'</span></h4><h4 class="">'+result[i].q_cntt+'</h4><h6>작성시간 : '+result[i].q_date+'</h6></div>'));
					}
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