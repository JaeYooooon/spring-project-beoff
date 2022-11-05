let naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "DbzwwEENGcOfafKllPDp", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: "http://localhost:8081/user/naverOK", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true
	}
);

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			const name = naverLogin.user.getName(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			const phonenum = naverLogin.user.getMobile();
			const email = naverLogin.user.getEmail();
			
			console.log(naverLogin.user.name);
			console.log(naverLogin.user.id);
			
			if( name == undefined || name == null) {
				alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
			if( phonenum == undefined || phonenum == null) {
				alert("휴대폰 번호는 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
			if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}

	});
});


