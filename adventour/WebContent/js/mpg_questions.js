/*mpg_questions.js*/

$(document).ready(function() {
	//	헤더랑 푸터 담은 mpg_nvbox.html 로드
    $("#mpg_nvbox").load("mpg_nvbox.html");
    var sndBtn = document.getElementsByName("sndBtn")[0];//문의하기 보내기 버튼
    
    //첫번 째 탭기능 변수 선언
    var frstLtab1 = $('.frstLTab p').eq(0);/*문의 내역*/
    var frstLtab2 = $('.frstLTab p').eq(1);/*자주 묻는 질문*/
    var frstLtab3 = $('.frstLTab p').eq(2);/*문의하기*/
    var secLCtg1 = $('.my_qna').eq(0);//문의 내역 클릭하면 보이는 카테고리.
    var secLCtg2 = $('.sec_lne_ctgry').eq(0);//자주묻는 질문 클릭하면 보이는 카테고리.
    var secLCtg3 = $('.write').eq(0);//문의하기 클릭하면 보이는 카테고리.
    
    
//    첫번 째 탭기능 디폴트
    secLCtg1.hide();
    secLCtg3.hide();

    /*문의 내역 탭 클릭 시*/
    frstLtab1.click(function () {       
       loadMyQna();
       secLCtg1.show();
       secLCtg2.hide();
       secLCtg3.hide();
    });
    /*자주묻는 질문 탭 클릭 시*/
    frstLtab2.click(function () {       
       secLCtg2.show();
       secLCtg1.hide();
       secLCtg3.hide();
    });
    /*문의 하기 탭 클릭 시*/
    frstLtab3.click(function () {       
       secLCtg3.show();
       secLCtg1.hide();
       secLCtg2.hide();
    });
    
  //두번 째 탭기능 변수 선언 
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
    var oP_QnA_li = $('.oP_qna_all').eq(0);
    var cs_QnA_li = $('.cs_qna_all').eq(0);
  
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

/*문의 내역 클릭할 경우 문의한 내역들 로드되는 펑션*/
function loadMyQna(){
	
	$.ajax({
		url: 'mpg_questions_select.jsp',
		type: 'POST',
		dataType: 'text',
		data: "m_id=qkqh4848",
		success: function(data) {
			try{
				var myqnaCkB = $('#myqnaCkB');
				var divStr_Tt= $('#db_Pul_Title');
				var divStr_Cnt= $('#db_Pul_cntt');
				var divStr_Tm= $('#write_time');
				myqnaCkB.empty();
//				divStr_Tt.empty();
//				divStr_Cnt.empty();
//				divStr_Tm.empty();
				
				var result = JSON.parse(data.trim());
				for(var i in result){
//					myqnaCkB.append($('<option>', {
//						value: row.engNm,
//						text: row.korNm
//					}));
					myqnaCkB.append($('<span id="myqnaCkB_'+result[i].q_title+'">'+result[i].q_title+'<span>'));
//					var myQ = myqnaCkB.children('label').eq(i);
					var myQ = myqnaCkB.find('span').eq(i);
					
//					var로하면 안 댐
//					var divStr = '<div class="qna_dtail_box"><div class="qna_dtail_box_band"><div class="myquestion"><h4 class=""><span id="db_Pul_Title">'+result[i].q_title+'</span></h4><h4 class="">'+result[i].q_cntt+'</h4><h6>작성시간 : '+result[i].q_date+'</h6></div>'; 
					let divStr_t= '<span id="db_Pul_Title_'+result[i].q_title+'">'+result[i].q_title+'</span>';
					let divStr_c= '<span id="db_Pul_cntt_'+result[i].q_cntt+'">'+result[i].q_cntt+'</span>';
					let divStr_tm= '<span id="write_time_'+result[i].q_date+'">작성시간 : '+result[i].q_date+'</span>'; 
					
					if(myQ){
						myQ.click(function(){
							divStr_Tt.empty();
							divStr_Cnt.empty();
							divStr_Tm.empty();
//							qnaDtB.append($('<div class="qna_dtail_box"><div class="qna_dtail_box_band"><div class="myquestion"><h4 class=""><span id="db_Pul_Title">'+result[i].q_title+'</span></h4><h4 class="">'+result[i].q_cntt+'</h4><h6>작성시간 : '+result[i].q_date+'</h6></div>'));
							divStr_Tt.append($(divStr_t));
							divStr_Cnt.append($(divStr_c));
							divStr_Tm.append($(divStr_tm));
						})
					}
				}
			}catch(e){
				console.error(e);
//				error
			}
		},
		error: function(error) {
			console.error('Request error:', error);
		}
	});
	
}