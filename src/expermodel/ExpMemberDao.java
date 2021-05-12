package expermodel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import expermodel.mapper.MemberMapper;


public class ExpMemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
   //회원가입
   public int insert(ExperMember mem) {
	   SqlSession session = MyBatisConnection.getConnection();
      try {
         return session.getMapper(cls).insert(mem);
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         //MyBatisConnection클래스의 close메소드
         MyBatisConnection.close(session);
      }
      return 0;
   }
   //로그인
   public ExperMember selectOne(String email) {
	      SqlSession session = MyBatisConnection.getConnection();
	      try {
	    	  map.clear();
	    	  map.put("email", email);
	    	  return session.getMapper(cls).selectOne(map); 
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  MyBatisConnection.close(session);
	      }
	      return null;
	   }
   //비밀번호 찾기
   public String pwSearch(String email,String pwque,String pwans) {
	   SqlSession session = MyBatisConnection.getConnection();
	   try {
		   return session.getMapper(cls).pwSearch(email,pwque,pwans);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   
	   }
	   return null;
   }
   public List<ExperMember> list() {
	      SqlSession session = MyBatisConnection.getConnection();
	      try {
	    	  return session.getMapper(cls).list(); 
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  MyBatisConnection.close(session);
	      }
	      return null;
	   }
   public int delete(String email) {
	   SqlSession session = MyBatisConnection.getConnection();
	      try {
	    	  System.out.println(email);
	    	  return session.getMapper(cls).delete(email); 
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  MyBatisConnection.close(session);
	      }
	      return 0;   
   }
   public int update(ExperMember m) {
		  SqlSession session = MyBatisConnection.getConnection();
	      try {
	    	 return session.getMapper(cls).update(m);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  MyBatisConnection.close(session);
	      }
	      return 0;
	   }
   public int updatePass(String email, String pass) {
		  SqlSession session = MyBatisConnection.getConnection();
	      try {
	    	 map.clear();
	    	 map.put("email", email);
	    	 map.put("pass", pass);
	    	 return session.getMapper(cls).updatePass(map);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	    	  MyBatisConnection.close(session);
	      }
	      return 0;
	   }
public void updatepic(String email, String fname) {
	  SqlSession session = MyBatisConnection.getConnection();
      try {
    	 map.clear();
    	 map.put("email", email);
    	 map.put("fname", fname);
    	 session.getMapper(cls).updatepic(map);
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
    	  MyBatisConnection.close(session);
      }
	}
}
