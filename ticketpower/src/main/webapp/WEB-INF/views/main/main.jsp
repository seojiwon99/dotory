<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /.parallax full screen background image -->
        <div class="fullscreen landing parallax" style="background-image:url('images/background.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">

            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">

                            <!-- /.logo -->

                            <!-- /.main title -->
                            <h1 class="wow fadeInLeft" style="height: 300px; text-align: center; padding-top:150px; margin-bottom: 50px;">
                                '명작은 그 전개와 결말을 알고서도 다시 찾게 만든다'<br>
                                Ticket Power: 
                            </h1>

                            <!-- /.header paragraph -->
                            <div class="landing-text wow fadeInUp">
                                 <p>티켓파워는 명작이지만 시간에 묻혀 우리에게 잊혀져버린 영화들을 소개합니다.</p>
                                 <p>
									과거를 그리워하는 사람들의 니즈를 만족시키기 위해 80년대에서 2000년대 초반에 개봉한 영화들을 소개하는 곳입니다.
+                           		밀레니엄 이전 시기의 명작 영화들을 감상할 수 있으며 여러분은 이 영화들에 대해 자유롭게 줄거리, 느낀점, 별점들을 제공하고 소통할 수 있습니다.   
								</p>
                            </div>				  
                        </div> 

                        <!-- /.signup form -->
                        <div class="col-md-5">
                            <div class="signup-header wow fadeInUp">
                                <h3 class="form-title text-center">GET STARTED</h3>
                                <form class="form-header" action="memberLogin.do" role="form" method="POST" id="frm">
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="memberId" id="memberId" type="text" placeholder="Your ID" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="memberPw" id="memberPw" type="password" placeholder="Password" required>
                                    </div>
                                    <div class="form-group last">
                                        <input type="submit" class="btn btn-warning btn-block btn-lg" value="로그인" />
                                    </div>
                                    <p class="privacy text-center">계정이 없나요? 다음으로 이동하세요 <a href="memberRegistForm.do">회원가입</a>.</p>
                                </form>
                                <p>${err }</p>
                            </div>				

                        </div>
                    </div>
                </div> 
            </div> 
        </div>
<script type="text/javascript">
document.getElementById("frm").addEventListener("submit",function(e){
	if(document.getElementById("memberId").value == ""){
		e.preventDefault();
		alert("ID를 확인해주세요");
		document.getElementById("memberId").focus();
	}
	else if(document.getElementById("memberPw").value == ""){
		e.preventDefault();
		alert("PW를 확인해주세요");
		document.getElementById("memberPw").focus();
	}
	else{
		
	}
});
</script>