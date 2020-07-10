package action.member;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

public class MailFormAction extends AdminLoginAction{
	
		protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
			List<String> list = Arrays.asList(request.getParameterValues("mailchk"));
			request.setAttribute("list",list);
			return new ActionForward();
		}

	

}
