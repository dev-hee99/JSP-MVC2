package expermodel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import expermodel.mapper.BoardMapper;


public class ExpBoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public ExperBoard selectOne(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).selectboard(map).get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	

	public boolean insert (ExperBoard board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(board);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	public int boardCount(String column, String find, int btype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype", btype);
			if(column != null) {
				String [] cols = column.split(",");
				switch(cols.length) {
				case 3: map.put("col3", cols[2]);				
				case 2: map.put("col2", cols[1]);
				case 1: map.put("col1", cols[0]); break;
				}
				map.put("find", find);
			}
			return session.getMapper(cls).boardCount(map);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public List<ExperBoard> list(int pageNum,int limit, String column, String find, int btype){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("pageNum", (pageNum-1)*limit);
			map.put("limit", limit);
			map.put("btype", btype);
			if(column != null) {
				String [] cols = column.split(",");
				switch(cols.length) {
				case 3: map.put("col3", cols[2]);				
				case 2: map.put("col2", cols[1]);
				case 1: map.put("col1", cols[0]); break;
				}
				map.put("find", find);
			}
			return session.getMapper(cls).select(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
	}
	public String selectemail(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectemail(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int postcount(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).postcount(email);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int delete(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int selectbtype(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).btype(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean update(ExperBoard board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(board);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	//전체 게시글
	public int postall() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).postall();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

}
