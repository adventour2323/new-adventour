window.onload = function () {
	var mship = document.querySelectorAll("input[required],select[required]");//인풋 셀렉 전체
	var mBtn = document.getElementsByName("msBtn")[0];//회원가입 버튼
	

//	id입력 input에 onKeyup으로 중복체크 이벤트 걸기
	var idTB = document.getElementsByName("g_id")[0];//아이디 텍스트박스
	idTB.onkeyup = idCheckF;
//	idTB.addEventLis,,,
	
	
		
	
//	no_korean 클래스인 input 이벤트로 한글만 입력 안 되도록
	const no_korean = document.querySelectorAll('.no_korean');
	
	for (var i = 0; i < no_korean.length; i++) {
		no_korean[i].addEventListener('input', function(e) {
			// 입력된 값에서 한글만 제거하기
			e.target.value = e.target.value.replace(/[가-힣ㄱ-ㅎㅏ-ㅣ]/g, '');
		});
	}
	
	
//	비밀번호 확인 온 키업 이벤트. 비밀번호 동일하게 입력됐는지 확인.
	var pw_cked = document.querySelectorAll("input[type=password]")[1];
	
	pw_cked.onkeyup=function () {
		var pw = document.querySelectorAll("input[type=password]")[0];
		var rPw = document.querySelectorAll("input[type=password]")[1];
		var result = document.getElementById("result");
		if (pw.value == rPw.value) {
			result.style.color ="green";
			result.innerHTML = "입력한 비밀번호가 동일합니다.";
		} else {
			result.style.color ="tomato";
			result.innerHTML = "비밀번호를 다시 입력해주세요.";
		}
	}
	
	
//	pnum_check 클래스인 input이벤트로 숫자만 입력되도록
	const numberInputs = document.querySelectorAll('.pnum_check');

	for (var i = 0; i < numberInputs.length; i++) {
	    numberInputs[i].addEventListener('input', function(e) {
	        // 입력된 값에서 숫자만 가져오기
	        e.target.value = e.target.value.replace(/[^0-9]/g, '');
	    });
	}
	
	
//	생년월일 콤보박스 값 세팅
	for (var i = 2023; i > 1920; i--) {
		$('#year').append('<option value="' + i + '">' + i + '</option>');
	}
	for (var i = 1; i < 13; i++) {
		$('#month').append('<option value="' + i + '">' + i + '</option>');
	}
	for (var i = 1; i < 32; i++) {
		$('#day').append('<option value="' + i + '">' + i + '</option>');
	}
	
	
//	모두 동의합니다. 체크박스 클릭 이벤트
	$('input#all_cked').click(function(){
		var checkAll = document.getElementById('all_cked').checked;
		var cks = document.querySelectorAll('.ck_box input[type=checkbox]');
		for(var i=0; i<cks.length; i++){
			if(checkAll == true){
				cks[i].checked = true;
			}else{
				cks[i].checked = false;
			}
		}
		
	});


//	회원가입 버튼 클릭했을 경우
	mBtn.onclick = validation;
	
	
}//window.onload = function()괄호 끝





//가이드 아이디 중복 검사 ajax
var idCheck = false;
function idCheckF() {
  let g_id = $('#g_id').val();
  $.ajax({
      url: 'guide_id_check.jsp', 
      type: 'post',
      data: {"g_id": g_id},
      aSync: false, // ajax 통신이 끝나야 다음줄 if(idCheck){ 가 실행되도록
      success: function (cnt) {
          if (cnt != 1) {
              $('.id_check').html('사용 가능한 아이디입니다.').css('color','green');
              idCheck = true;
          } else {
              $('.id_check').html('이미 사용하고 있는 아이디입니다.').css('color','tomato');
              idCheck = false;
          }
      },
	    error: function(error) {
	        console.error('Request error:', error);
	    }
  });
  if(idCheck){
  	return true;
  }else{
  	return false;
  }
}




//가이드 회원가입 Ajax: g_member.jsp와 연동
function mInfoSendF() {
	var myForm = $('form[name=myForm]');
	$.ajax({
		url: 'g_member.jsp',
		type: 'POST',
		dataType: 'text',
		data: $('form[name=myForm]').serialize(),
		success: function(data) {
			console.log(data);
			
			if(data.indexOf('sucess') > -1){//member_pjs.jsp의 out.println("")중에 sucess가 있다면
				alert("회원가입이 완료되었습니다.");
				window.location.href = 'login_merge_form.jsp';
			}else{
				alert("일시적인 사유로 회원가입이 실패하였습니다.");
			}
		},
		error: function(error) {
			console.error('Request error:', error);
		}
	});
}



//회원가입 유효성 체크
function validation(){
	
	//아이디 중복일 경우 알럿창	
	if(idCheck == false){
		alert('이미 사용 중인 아이디입니다. \n다른 아이디를 입력해주세요.');
		return;
	}
	
	//	비밀번호와 비밀번호확인 밸류가 같지 않을 때 알럿창
	var pw = document.querySelectorAll("input[type=password]")[0];
	var rPw = document.querySelectorAll("input[type=password]")[1];
	
	if(pw.value !== rPw.value){
		alert('비밀번호를 동일하게 입력해주세요.');
		return;
	}
	
	
	
//	필수 값 널인지 체크
	var valiRequireds = true;
	
	//	var myForm = document.myForm;
	$(document.myForm).find('input').each(function(){
	    if(this.required){
	        if(this.value == ''){
	        	valiRequireds = false;
	        	alert(this.title + '값은 필수입니다.');
	        	return false;
	        }
	    }
	});
	if(valiRequireds){//필수값에 널값이 없어요(회원가입 ajax로 보냄)
		mInfoSendF();
		return true;
	}else {//필수값에 널값이 있어요(회원가입 ajax로 보내지 못하고 리턴)
		return false;
	}	
}//validation()끝




