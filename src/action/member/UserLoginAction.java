package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/*
 * �α��� �� ��� : doExecute ȣ��
 * �α׾ƿ� �� ��� : �α��� �ϼ���. loginForm.me�� ������ �̵�
 * id �Ķ���Ͱ� �����ϴ� ��� : �α��� ����, �Ķ���� ������ ���Ͽ� �����ڰ� �ƴϸ鼭,
 *  �ٸ���� ���� ������ �ŷ� ���� �޼��� ���, main.me ������ �̵�
 */
public abstract class UserLoginAction implements Action{
   protected String login;
   protected String email;
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
      login = (String)request.getSession().getAttribute("login");
      email = request.getParameter("email");
      
      if(login == null) {
         request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
         request.setAttribute("url", "../Expermember/Explogin.do");
         return new ActionForward(false,"../alert.jsp");
      }
      if(email != null && !email.equals(login) && !login.equals("admin")) {
         request.setAttribute("msg", "���θ� �����մϴ�");
         request.setAttribute("url", "main.do");
         return new ActionForward(false,"../alert.jsp");
      }
      return doExecute(request,response);
   }
   public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}