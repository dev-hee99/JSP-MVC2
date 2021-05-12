package controller;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;


@WebServlet(urlPatterns = {"*.do"},
   initParams = {@WebInitParam(name="properties",
            value = "action.properties")})
public class ControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Map<String, Action> commandMap = new HashMap<>();
    public ControllerServlet() {
        super();
    }
    @Override	//ControllerServlet 클래스의 객체 생성시 한 번 호출
    public void init(ServletConfig config) throws ServletException {
       String props = config.getInitParameter("properties");
       Properties pr = new Properties();
       FileInputStream f = null;
       try {
          f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
          pr.load(f);
       } catch (IOException e) {
          throw new ServletException(e);
       } finally {
          try { if(f != null) f.close();
           } catch(IOException e) {}
       }
       for(Object k : pr.keySet()) {
          String command = (String)k; 
          String className = pr.getProperty(command);
          try {
             Class commandClass = Class.forName(className.trim());
             Object commandObj = commandClass.newInstance();
             commandMap.put(command, (Action)commandObj);
          } catch(Exception e) {
             throw new ServletException(e);
          }
       }
    }
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("euc-kr");
      Action action = null;
      ActionForward forward = null;
      String command = null;
      try {
    	  //request.getRequestURI() : /jspstud2/model2/hello.me
    	  //request.getContextPath() : /jspstud2
    	  //comand : /model2/hello.me
         command = request.getRequestURI().substring(request.getContextPath().length());
         //action : action.HelloAction 객체 리턴
         action = commandMap.get(command);
         forward = action.execute(request, response);
      } catch (NullPointerException e) {
         forward = new ActionForward();
      } catch (Exception e) {
         throw new ServletException(e);
      }
      if(forward != null) {
         if(forward.isRedirect()) { //ture인 경우
            response.sendRedirect(forward.getView());
         } else {
            if(forward.getView() == null) {
               forward.setView(command.replace(".do", ".jsp"));
            }
            //forward.getView() : h
            RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
            disp.forward(request, response);
         }
      }
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}