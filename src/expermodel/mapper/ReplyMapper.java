package expermodel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import expermodel.ExpReply;

public interface ReplyMapper {
	//√÷¥Î seq
	@Select("select ifnull(max(seq),0) from expreply")
	int maxseq();
	
	//¥Ò±€ºˆ
	@Select({"<script>",
			"select count(*) from expreply",
			"<if test='email != null'> where email = #{email}</if>",
			"<if test='num != 0'> where num = #{num}</if>",
			"</script>"})
	int repcount(Map<String, Object> map);
	
	//µ•¿Ã≈Õ ª¿‘
	@Insert("insert into expreply (seq,num,email,name,content,regdate,grp)"
			+ " values (#{seq},#{num},#{email},#{name},#{content},now(),#{grp})")
	boolean insert(ExpReply reply);
	
	@Select("select * from expreply where num=#{num} order by grp asc, seq asc")
	List<ExpReply> list(Map<String, Object> map);
	
	@Delete("delete from expreply where seq=#{value}")
	int delete(int seq);
	
	@Select("select * from expreply where seq=#{value}")
	ExpReply selectOne(int seq);

	@Update("update expreply set content=#{content} where seq=#{seq}")
	int update(Map<String, Object> map);
	
	@Delete("delete from expreply where grp=#{value}")
	int deleteall(int grp);
	
	@Select("select num, count(*) cnt from expreply group by num")
	List<ExpReply> numcnt();
	
	@Select("select count(*) cnt from expreply where num=#{value}")
	int cnt(int num);

	
}
