<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link rel="stylesheet" href="../../choisojin/css/header.css" />
<script src="../../choisojin/js/header.js"></script>
<script src="../../choisojin/js/search.js"></script>
</head>
<body>
	<!-- HEADER -->
	<div id="header-placeholder"></div>
<div class="inner">
<div class="jumbotron">
	<div class="container">
    	<h1 class="display-3">회원가입</h1>
    </div>
</div>
<div class="container">
	<form action="addMember" method="post">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input name="id" class="form-group" placeholder="ID" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="password" class="form-group" placeholder="PASSWORD" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input name="name" class="form-group" placeholder="NAME" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="form-check form-check-inline">
				<input type="radio" value="남자" name="gender" class="form-check-input" checked>
				<label class="from-check-label">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="radio" value="여자" name="gender" class="form-check-input">
				<label class="from-check-label">여자</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">생일</label>
			<div class="col-sm-3">
						<input type=date name="birthday" >
				<!-- <input name="birthhyy" maxlength="4" size="6" class="form-group" placeholder="년(4자)" required>
				<input name="birthhmm" maxlength="2" size="4" class="form-group" placeholder="월" required>
				<input name="birthhdd" maxlength="2" size="4" class="form-group" placeholder="일" required> -->
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input name="mail1" maxlength="50" required>@
				<select name="mail2">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-5">
				<select name="phone1" required>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">012</option>
				</select>
				-<input name="phone2" maxlength="4" size="4"required>
				-<input name="phone3" maxlength="4" size="4"required>
			</div>
		</div>
		<div class="form-group row">
			<!-- <label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input name="zipcode" id="zipcode" class="from-control" placeholder="우편번호">
				<input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
			
			
			</div>-->
			<label class="col-sm-2">주소입력</label>
			<div class="col-sm-3">
				<input name="address" id="address" class="from-control" placeholder="직접입">
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록">
				<input type="reset" class="btn btn-warning" value="취소">
			</div>
		</div>
	</form>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 


                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }



 
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
            
     

                var guideTextBox = document.getElementById("guide");

                
                
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</form>
</body>
</html>