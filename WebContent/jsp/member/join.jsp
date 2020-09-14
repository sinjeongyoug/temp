 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<style>

<style>
/* lib */
.form1 {
	margin-top: 2rem !important;
}

.form1 .form-row {
	flex-grow: 1 !important;
	margin-bottom: .5rem !important;
}
</style>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<style>
.form1 .form-row>.label {
	
}

.form1 .form-row>.input {
	position: relative !important;
}

.form1 .form-row>.input>input, .form1 .form-row>.input>textarea {
	
}

.form1 .form-row>.input>select {
	padding: 10px;
}

.form1 .form-row>.input>textarea {
	height: 500px;
}

.form1 form-row>.logo {
	font-size: 3rem;
	padding: 0 10px;
}

@media ( max-width : 700px ) {
	.form1 .form-row {
		display: block;
	}
}
/* cus */
.write-form-box {
	margin-top: 30px;
}
</style>

<script>

	var JoinForm__validLoginId = '';
	function JoinForm__submit(form) {
		form.loginId.value = form.loginId.value.trim();

		
		if (form.loginId.value.length == 0) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		if (form.loginId.value != JoinForm__validLoginId) {
			alert('다른 아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
		
		if (form.loginPw.value.length == 0) {
			alert('로그인 비번을 입력해주세요.');
			form.loginPw.focus();
			return;
			
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		
		
		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('로그인 비번확인이 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			return;
			
		}
		
		form.name.value = form.name.value.trim();
		
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
			
		}
		
		form.nickname.value = form.nickname.value.trim();
		
		if (form.nickname.value.length == 0) {
			alert('별명을 입력해주세요.');
			form.nickname.focus();
			return;
			
		}
		
		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.');
			form.email.focus();
			return;
			
		}
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';
		
		form.submit();
	}

	
	function JoinForm__checkLoginIdDup(input) {
		var form = input.form;
		
		form.loginId.value = form.loginId.value.trim();
		
		if (form.loginId.value.length == 0) {
			return;
			
		}
		
		$.get('getLoginIdDup', {
			loginId : form.loginId.value
		}, function(data) {
			var $message = $(form.loginId).next();

			
			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validLoginId = data.loginId;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validLoginId = '';
			}
		}, 'json');
	}
</script>

<div class="write-form-box con">
	<form action="doJoin" method="POST" class="write-form form1" 
		onsubmit="JoinForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
			<i class="far fa-angry"></i>
			<div class="form-row">
			<div class="label">로그인</div>
			<div class="input">
				<input onkeyup="JoinForm__checkLoginIdDup(this);" name="loginId"
					type="text" placeholder="로그인 아이디를 입력해주세요." />
				<div class="message-msg"></div>
			</div>
		</div>
		<div class="form-row glow">
			<div class="label">비밀번호</div>
			<div class="input">
				<input name=loginPw type="password" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>
		<div class="form-row tw">
			<div class="label">비밀번호 확인</div>
			<div class="input">
				<input name="loginPwConfirm" type="password"
					placeholder="비밀번호를 확인해주세요." />
			</div>
		</div>
		<div class="form-row title">
			<div class="label">이름</div>
			<div class="input">
				<input name="name" type="text" placeholder="이름을 입력해주세요." />
			</div>
		</div>
		<div class="form-row land">
			<div class="label">이메일</div>
			<div class="input">
				<input name="email" type="email" placeholder="이메일을 입력해주세요." />
			</div>
		</div>
		<div class="form-row nicnames">
			<div class="label">닉네임</div>
			<div class="input">
				<input name="nickname" type="text" placeholder="닉네임을 입력해주세요." />
			</div>
		</div>
		<div class="form-row" style="text-align: center;">
			<div class="btn-group" data-toggle="buttons">
				<label class="btn btb-primory active">
					<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
				</label>
				<label class="btn btb-primory">
					<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
				</label>
			</div>
		</div>
		<div class="form-row">
			<div class="input">
				<input type="submit" value="회원가입" /> <a href="list"></a>
			</div>
		</div>
	</form>
</div>

<%@ include file="/jsp/part/foot.jspf"%>