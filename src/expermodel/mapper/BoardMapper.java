package expermodel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import expermodel.ExperBoard;

public interface BoardMapper {
	//최대 num
	@Select("select ifnull(max(num),0) from expboard")
	int maxnum();
	
	//데이터 삽입
	@Insert("insert into expboard (num,email,name,subject,content,file1,regdate,readcnt,recom,btype,wtype)"
			+ "values (#{num},#{email},#{name},#{subject},#{content},#{file1},now(),0,0,#{btype},#{wtype})")
	boolean insert(ExperBoard board);
	//등록된 게시글 개수, 게시글 찾기.
	@Select({"<script>",
		"select count(*) from expboard",
		"<if test='btype == 0'>where btype in(2,3) </if>",
		 "<if test='btype != 0 and btype != 4'>where btype = #{btype} </if>",
		"<if test='col1 != null'> and ${col1} like '%${find}%' </if>",
	    "<if test='col2 != null'> or ${col2} like '%${find}%' </if>",
	    "<if test='col3 != null'> or ${col3} like '%${find}%' </if>",  
		"</script>"})
	int boardCount(Map<String, Object> map);
	//list
	@Select({"<script>",
		"select * from expboard",
		"<if test='btype == 0'> where btype in(2,3)</if>",
		"<if test='btype != 0 and btype != 4'> where btype = #{btype}</if>",
		"<if test='col1 != null'> and ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
		"<if test='pageNum != null and limit != null'> order by wtype asc, num desc limit #{pageNum},#{limit}</if>",
		"</script>"})
	List<ExperBoard> select(Map<String,Object> map);
	
	@Select({"<script>",
			"select * from expboard",
			"<if test='num != null'> where num=#{num}</if>",
			"</script>"})
	List<ExperBoard> selectboard(Map<String, Object> map);
	
	@Update("Update expboard set readcnt=readcnt+1 where num=#{value}")
	void readcntAdd(int num);
	
	@Select("select email from expboard where num=#{value}")
	String selectemail(int num);
	
	@Select("select count(*) from expboard where email=#{value}")
	int postcount(String email);
	
	@Delete("delete from expboard where num=#{value}")
	int delete(int num);
	
	@Select("select btype from expboard where num=#{value}")
	int btype(int num);
	
	@Update("update expboard set btype=#{btype}, subject=#{subject}, content=#{content}, file1=#{file1} where num=#{num}")
	boolean update(ExperBoard board);
	
	@Select("select count(*) from expboard")
	int postall();

	
}
