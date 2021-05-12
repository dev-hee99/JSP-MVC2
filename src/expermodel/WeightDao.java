package expermodel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import expermodel.mapper.MemberMapper;
public class WeightDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	public List<Map<String, Float>> weightgraph(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		List <Map<String, Float>> list = null;
		try {
			list = session.getMapper(cls).weightgraph(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	
	public List<WeightBoard> list(String login) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("email", login);
			return session.getMapper(cls).weightlist(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}


	public boolean insert(WeightBoard w) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).report(w);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}


	public String datechk(String email,Date date) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).datechk(email,date);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}


	public boolean update(WeightBoard w) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).reportupdate(w);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}


	public boolean delete(String email, Date regdate) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("email", email);
			map.put("regdate", regdate);
			return session.getMapper(cls).weightdelete(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public void weightupdate(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).weightupdate(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
	}




	public List<Map<String, Float>> bodyfatgraph(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		List <Map<String, Float>> list = null;
		try {
			list = session.getMapper(cls).bodyfatgraph(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return list;
	}


	public List<Map<String, Float>> musclemassgraph(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		List <Map<String, Float>> list = null;
		try {
			list = session.getMapper(cls).musclemassgraph(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return list;
	}


	public String maxdate(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxdate(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public String mindate(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).mindate(email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

}
