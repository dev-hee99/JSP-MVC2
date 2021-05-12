package expermodel;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnection {
	private static SqlSessionFactory sqlMap;
	private MyBatisConnection() {}
	static {
		String resource = "expermodel/mapper/mybatis-config.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	static SqlSession getConnection() {
		return sqlMap.openSession();
	}
	static void close(SqlSession session) {
		//session.commit DB¿¡ µî·Ï
		session.commit();
		session.close();
	}
}
