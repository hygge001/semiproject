// 모달 열기
function openModal() {
	var modal = document.getElementById('myModal');
	modal.style.display = 'block';
	setTimeout(function() {
		modal.style.transform = 'translateX(0)'; // 왼쪽에서 나타나도록 이동
	}, 100);
}

// 모달 닫기
function closeModal() {
	var modal = document.getElementById('myModal');
	modal.style.transform = 'translateX(-100%)'; // 왼쪽으로 이동하여 사라지도록 함
	setTimeout(function() {
		modal.style.display = 'none';
	}, 300); 
}


//var returnUrl;
//returnUrl = window.location.href; // 현재 URL 저장

//로그인 윈도우창 열기
function openLoginWindow() {
	window.open("login", "_blank", "width=600,height=600,scrollbars=yes");
}


function openAddMember() {
	window.opener.location.href ="addMember";
	window.close();
}

