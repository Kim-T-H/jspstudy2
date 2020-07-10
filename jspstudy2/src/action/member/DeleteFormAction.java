package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
/*
  1. id 파라미터 저장하기.
  2. login 여부 검증하기
           로그아웃상태인 경우 로그인하세요.메세지 출력 후 loginForm.jsp 페이지로 이동
  3. 현재 화면 출력하기   
 */
public class DeleteFormAction extends UserLoginAction{
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		return new ActionForward();
	}
}
