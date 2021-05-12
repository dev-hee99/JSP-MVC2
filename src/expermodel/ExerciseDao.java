package expermodel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import expermodel.mapper.MemberMapper;

public class ExerciseDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	public boolean insert(ExerciseBoard ex) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).exerciseinsert(ex);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<ExerciseBoard> list(String part, String email,Date bfdate,Date afdate) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("part", part);
			map.put("email", email);
			map.put("bfdate", bfdate);
			map.put("afdate", afdate);
			return session.getMapper(cls).exerciselist(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int maxno() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxno();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int delete(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).exdelete(no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
}
