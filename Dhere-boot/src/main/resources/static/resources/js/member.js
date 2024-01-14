function findZipcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ""; // 주소 변수
      var extraAddr = ""; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.roadAddress;
        // addr = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === "R") {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== "" && data.apartment === "Y") {
          extraAddr +=
            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== "") {
          extraAddr = " (" + extraAddr + ")";
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        addr += extraAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      $("#zipcode").val(data.zonecode);
      $("#address1").val(addr);
      // 커서를 상세주소 필드로 이동한다.
      $("#address2").focus();
    },
  }).open();
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById("preview").src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById("preview").src = "";
  }
}

function emailCheck() {
  const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  let email = $("#email").val();
  $("#isIdCheck").val("false");
  console.log($("#isIdCheck").val());
  if (!pattern.test(email)) {
    $("#label1").show();
    $("#label1").css("color", "red").text("이메일 형식이 올바르지 않습니다.");
  } else {
    $("#label1").hide();
  }
}

function passCheck() {
  let pass = $("#pass1").val();
  $("#isPassCheck").val("false");
  console.log($("#isPassCheck").val());
  $("#label2").css("color", "red").text("비밀번호 중복확인을  실시해 주세요.");
}

function nickNameCheck() {
  let nickname = $("#nickname").val();
  $("#nicknameCheck").val("false");
  console.log($("#nicknameCheck").val());
  $("#label4").text("");
}

$(function () {
  $("#btnZipcode").on("click", findZipcode);
});

// DOM이 준비되면-----------로그아웃

$(function () {
  $("#memberUpdateForm").on("submit", function () {
    // 비밀번호 확인했는지 체크
    if (!$("#btnPassCheck").prop("disabled")) {
      alert("먼저 비밀번호 확인을 해주세요");
      return false;
    }
    return joinFormCheck();
  });
});

$(function () {
  let email;
  let password;

  let code2;

  $("#btnSendPhone").on("click", function () {
    let phoneNum = $("#phone").val();
    let phoneRule = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
    console.log(phoneRule.test(phoneNum));

    if (phoneRule.test(phoneNum)) {
      $("#label3").hide();
      $("#authenCheck").show();
      alert("해당 번호로 인증번호를 전송하였습니다.");

      $.ajax({
        type: "POST", // post 형식으로 발송
        url: "authenNumCheck", // controller 위치
        data: { phoneNum: phoneNum }, // 전송할 ㅔ이터값
        dataType: "json",
        success: function (data) {
          code2 = data; // 성공하면 데이터저장
          console.log(code2);
        },
        error: function (xhr, statusText, err) {
          console.error("error …");
        },
      });
    } else {
      $("#label3").css("color", "red").text("휴대폰 번호가 올바르지 않습니다.");
    }
  });

  //휴대폰 인증번호 대조
  $("#authenNumBtn").click(function () {
    if ($("#authenNum").val() == code2) {
      // 위에서 저장한값을 ㅣ교함
      $("#label4").css("color", "white").text("인증에 성공하였습니다.");
      $("#authenNumCheck").val("true");
      console.log($("#authenNumCheck").val());
    } else {
      $("#label4").css("color", "red").text("인증에 실패하였습니다.");
    }
  });

  //회원가입 아이디 중복검사
  $("#btnOverlapEmail").on("click", function () {
    var id = $("#email").val();
    if (id == "" || id.length == 0) {
      $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
      return false;
    }
    var idCheck = $("#isIdCheck").val();

    const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    if (!pattern.test(id)) {
      $("#isIdCheck").val("false");
      $("#label1").show();
      $("#label1").css("color", "red").text("이메일 형식이 올바르지 않습니다.");
    } else {
      //Ajax로 전송
      $.ajax({
        url: "joinCheck",
        data: { id: id },
        type: "POST",
        dataType: "json",
        success: function (resData) {
          console.log(resData.result);
          console.log(resData);
          if (resData.result) {
            $("#label1").show();
            $("#label1").css("color", "white").text("사용 가능한 ID 입니다.");
            $("#isIdCheck").val("true");
            console.log($("#isIdCheck").val());
            console.log(id);
            email = $("#email").val();
          } else {
            $("#label1").show();
            $("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
            $("userId").val("");
          }
        },
        error: function (xhr, statusText, err) {
          console.error("error …");
        },
      });
    }
  });

  $("#btnOverlapPass").on("click", function () {
    var pass1 = $("#pass1").val();
    var pass2 = $("#pass2").val();
    if (pass1 == pass2) {
      $("#label2").css("color", "white").text("비밀번호가 일치합니다.");
      $("#isPassCheck").val("true");
      console.log($("#isPassCheck").val());
      password = $("#pass1").val();

      return false;
    } else {
      $("#label2").css("color", "red").text("비밀번호가 일치하지 않습니다.");
    }
  });

  //회원가입 닉네임 중복검사
  $("#btnOverlapNickName").on("click", function () {
    var nickname = $("#nickname").val();
    if (nickname == "" || nickname.length == 0) {
      $("#label4")
        .css("color", "red")
        .text("공백은 닉네임으로 사용할 수 없습니다.");
      return false;
    }

    $.ajax({
      url: "nicknameCheck",
      data: { nickname: nickname },
      type: "POST",
      dataType: "json",
      success: function (resData) {
        console.log(resData.result);
        console.log(resData);
        if (resData.result) {
          $("#label5").css("color", "white").text("사용 가능한 닉네임 입니다.");
          $("#nicknameCheck").val("true");
          console.log($("#nicknameCheck").val());

          email = $("#email").val();
        } else {
          $("#label5").css("color", "red").text("중복된 닉네임 입니다.");
        }
      },
      error: function (xhr, statusText, err) {
        console.error("error …");
      },
    });
  });

  $("#joinForm").on("submit", function () {
    let regExp = /^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$/gi;

    if ($("#email").val().length <= 0) {
      alert("이메일을 입력해 주세요.");

      return false;
    }
    if ($("#pass1").val().length <= 0) {
      alert("비밀번호를 입력해 주세요.");

      return false;
    }
    if ($("#name").val().length <= 0) {
      alert("이름을 입력해 주세요.");

      return false;
    }
    if ($("#nickname").val().length <= 0) {
      alert("닉네임을 입력해 주세요.");

      return false;
    }
    if ($("#zipcode").val().length <= 0) {
      alert("우편번호를 입력해 주세요.");

      return false;
    }
    if ($("#address1").val().length <= 0) {
      alert("주소를 입력해 주세요.");

      return false;
    }
    if ($("#address2").val().length <= 0) {
      alert("주소를 입력해 주세요.");

      return false;
    }
    if (regExp.test($("#job").val())) {
      alert("직업을 입력해 주세요.");

      return false;
    }
    if ($("#phone").val().length <= 0) {
      alert("연락처를 입력해 주세요.");

      return false;
    }
    if ($("#isIdCheck").val() === "false") {
      alert("아이디 중복검사를 실시해 주세요");
      return false;
    }
    if ($("#isPassCheck").val() === "false") {
      alert("비밀번호를 확인해주세요.");
      return false;
    }

    if ($("#nicknameCheck").val() === "false") {
      alert("닉네임을 확인해주세요.");
      return false;
    }

    if ($("#authenNumCheck").val() === "false") {
      alert("휴대폰 인증을 실시해주세요.");
      return false;
    }
    console.log($("#authenNumCheck").val());

    alert("회원가입이 완료되었습니다.");
  });
});

$(function () {
  $("#newPassBtn").click(function () {
    var newPass1 = $("#newPass1").val();
    var newPass2 = $("#newPass2").val();

    if (newPass1.length <= 0) {
      alert("새 비밀번호가 입력되지 않았습니다. 입력해주세요");
      return false;
    } else if (newPass1 == newPass2) {
      $("#newPassLabel").css("color", "black").text("비밀번호가 일치합니다.");
      return false;
    } else {
      $("#newPassLabel")
        .css("color", "red")
        .text("비밀번호가 일치하지 않습니다.");
      return false;
    }
  });
});

//비밀번호, 이름, 닉네임, 주소, 연락
$(function () {
  $("#mypageUpdateResult").on("submit", function () {
    if ($("#newPass1").val().length <= 0) {
      alert("비밀번호를 입력해주세요");
      $("#newPass1").focus();
      return false;
    }
    if ($("#newPass2").val().length <= 0) {
      alert("비밀번호를 입력해주세요");
      $("#newPass2").focus();
      return false;
    }
    if ($("#name").val().length <= 0) {
      alert("이름을 입력해주세요");
      $("#name").focus();
      return false;
    }
    if ($("#nickname").val().length <= 0) {
      alert("닉네임을 입력해주세요");
      $("#nickname").focus();
      return false;
    }
    if ($("#zipcode").val().length <= 0) {
      alert("주소를 입력해주세요");
      $("#zipcode").focus();
      return false;
    }
    if ($("#address2").val().length <= 0) {
      alert("주소를 입력해주세요");
      $("#address2").focus();
      return false;
    }
    if ($("#phone").val().length <= 0) {
      alert("전화번호를 입력해주세요");
      $("#phone").focus();
      return false;
    }
  });
});

document.getElementById("submitBtn").addEventListener("click", function (e) {
  var phoneNumber = document.getElementById("phone").value;

  var numericRegex = /^[0-9]{11}/;

  if (!numericRegex.test(phoneNumber)) {
    alert("연락처에는 숫자만 입력해주세요.");
    e.preventDefault();
  }
});
