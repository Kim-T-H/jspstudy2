package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.MemberDao;

public class ListAction extends AdminLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("list", new MemberDao().list());
		return new ActionForward();
	}

}
