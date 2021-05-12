package expermodel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import expermodel.mapper.ReplyMapper;


public class ExpReplyDao {
	private Class<ReplyMapper> cls = ReplyMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	public int maxseq() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int repcount(String email, int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("email", email);
			map.put("num", num);
			return session.getMapper(cls).repcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(ExpReply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(reply);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<ExpReply> list(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).list(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int delete(int seq) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public ExpReply selectOne(int seq) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int update(int seq, String content) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("seq", seq);
			map.put("content", content);
			return session.getMapper(cls).update(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}

		return 0;
	}

	public int deleteall(int grp) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).deleteall(grp);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<ExpReply> numcnt() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).numcnt();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int cnt(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).cnt(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
}
