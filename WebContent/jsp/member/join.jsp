<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
/* lib */
.form1 {
    margin-top: 2rem!important;
}
.form1 .form-row {
    flex-grow: 1!important;
    margin-bottom: .5rem!important;
}
</style>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<style>

.form1 .form-row>.label {
	
}
.form1 .form-row>.input {
	position: relative!important;

}
.form1 .form-row>.input>input,.form1 .form-row>.input>textarea {

}
.form1 .form-row>.input>select {
    padding: 10px;
}
.form1 .form-row>.input>textarea {
    height: 500px;
}
.form1 form-row> .logo {
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

<div class="write-form-box con">
	<form action="doJoin" method="POST" class="write-form form1">
		<div class="form-row ">
		<i class="far fa-angry"></i>
			<div class="label">아이디</div>
			<div class="input">
				<input name ="loginID"type="text" placeholder=" 아이디를 입력해주세요." />
			</div>
		</div>
		<div class="form-row glow">
			<div class="label">비밀번호</div>
			<div class="input">
				<input name="password" type="text" placeholder="비밀번호를 입력해주세요." />
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
				<input name="email" type="text" placeholder="이메일을 입력해주세요." />
			</div>
		</div>
		<div class="form-row land">
			<div class="label">닉네임</div>
			<div class="input">
				<input name="nickname" type="text" placeholder="닉네임을 입력해주세요." />
			</div>
		</div>
		<div class="form-row tw">
			<div class="label">비밀번호 확인</div>
			<div class="input">	
				<input name="ConfirmPassword" type="text" placeholder="비밀번호를 확인해주세요." />
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