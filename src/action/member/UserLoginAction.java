package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/*
 * 로그인 된 경우 : doExecute 호출
 * 로그아웃 된 경우 : 로그인 하세요. loginForm.me로 페이지 이동
 * id 파라미터가 존재하는 경우 : 로그인 정보, 파라미터 정보를 비교하여 관리자가 아니면서,
 *  다른경우 본인 정보만 거래 가능 메세지 출력, main.me 페이지 이동
 */
public abstract class UserLoginAction implements Action{
   protected String login;
   protected String email;
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
      login = (String)request.getSession().getAttribute("login");
      email = request.getParameter("email");
      
      if(login == null) {
         request.setAttribute("msg", "로그인이 필요합니다.");
         request.setAttribute("url", "../Expermember/Explogin.do");
         return new ActionForward(false,"../alert.jsp");
      }
      if(email != null && !email.equals(login) && !login.equals("admin")) {
         request.setAttribute("msg", "본인만 가능합니다");
         request.setAttribute("url", "main.do");
         return new ActionForward(false,"../alert.jsp");
      }
      return doExecute(request,response);
   }
   public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}