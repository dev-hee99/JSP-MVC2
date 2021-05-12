package expermodel.mapper;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import expermodel.ExerciseBoard;
import expermodel.ExperMember;
import expermodel.WeightBoard;



public interface MemberMapper {
	/* Insert */
	/*=================================회원 기록=========================*/
	//expermember
	@Insert("insert into expermember" 
    		  + "(email,pass,name,weight,height,pwquestion,pwanswer,gender,picture)"
    		  + "values(#{email},#{pass},#{name},#{weight},#{height},#{pwque},"
    		  + "#{pwans},#{gender},#{picture})")
	int insert(ExperMember mem);
	
	@Select("select * from expermember where email = #{email}")
	ExperMember selectOne(Map<String,Object> map);
	
	
	@Select("select pass from expermember "
			+ "where email=#{email} and pwquestion=#{pwque} and pwanswer=#{pwans}")
	String pwSearch(@Param("email") String email,
			@Param("pwque") String qwque,
			@Param("pwans") String pwans);
	
	@Select("select * from expermember")
	List<ExperMember> list();
	
	@Delete("delete from expermember where email = #{value}")
	int delete(String email);
	
	@Update("UPDATE expermember SET name=#{name}, height=#{height}, "
			+ "weight=#{weight} where email=#{email}")
	int update(ExperMember m);
	
	@Update("UPDATE expermember SET pass=#{pass} where email=#{email}")
	int updatePass(Map<String,Object> map);
	
	@Update("UPDATE expermember SET picture=#{fname} where email=#{email}")
	void updatepic(Map<String, Object> map);
	
	
	
	
	/*=================================신체 기록=========================*/
	//weightboard
	@Select("SELECT DATE_FORMAT(regdate,'%Y-%m-%d') regdate, weight FROM weightboard" 
			+" WHERE DATEDIFF(NOW(),regdate) < 7 and email=#{value}"
			+" ORDER BY regdate asc")
	List<Map<String, Float>> weightgraph(String email);
	
	//신체기록
	@Select("select * from weightboard where email=#{email} order by regdate desc limit 0,20")
	List<WeightBoard> weightlist(Map<String,Object> map);

	@Insert("insert into weightboard (email,regdate,weight,bodyfat,musclemass)"
			+ " values(#{email},#{regdate},#{weight},#{bodyfat},#{musclemass})")
	boolean report(WeightBoard w);
	
	@Select("select ifnull(regdate,'') from weightboard where regdate=#{date} and email=#{email}")
	String datechk(@Param("email") String email, @Param("date") Date date);
	
	@Update("update weightboard set weight=#{weight}, bodyfat=#{bodyfat},"
			+ " musclemass=#{musclemass} where regdate=#{regdate} and email=#{email}")
	boolean reportupdate(WeightBoard w);
	
	@Delete("delete from weightboard where regdate=#{regdate} and email=#{email}")
	boolean weightdelete(Map<String, Object> map);
	//변화한 몸무게 등록
	@Update("UPDATE expermember SET chgweight=IFNULL((SELECT weight FROM weightboard WHERE regdate=(SELECT MAX(regdate) FROM weightboard) and email=#{value}),0)"  
			+" WHERE email =#{value}")
	void weightupdate(String email);
	
	//체지방률 그래프
	@Select("SELECT DATE_FORMAT(regdate,'%Y-%m-%d') regdate, bodyfat FROM weightboard" 
			+" WHERE DATEDIFF(NOW(),regdate) < 7 and email=#{value}"
			+" ORDER BY regdate asc")
	List<Map<String, Float>> bodyfatgraph(String email);
	
	//골격근량 그래프
	@Select("SELECT DATE_FORMAT(regdate,'%Y-%m-%d') regdate, musclemass FROM weightboard" 
			+" WHERE DATEDIFF(NOW(),regdate) < 7 and email=#{value}"
			+" ORDER BY regdate asc")
	List<Map<String, Float>> musclemassgraph(String email);

	//신체기록 최근데이터
	@Select("select max(regdate) from weightboard where email=#{value}")
	String maxdate(String email);
	//신체기록 최초데이터
	@Select("select min(regdate) from weightboard where email=#{value}")
	String mindate(String email);
	
	/*=================================운동 기록=========================*/
	//exerciseboard
	 
	@Insert("Insert into exerciseboard (no,email,regdate,part,ename,weight,setnum,count)"
			+ " values(#{no},#{email},#{regdate},#{part},#{ename},#{weight},#{setnum},#{count})")
	boolean exerciseinsert(ExerciseBoard ex);
	
	@Select({"<script>",
			 "select * from exerciseboard",
			 "<if test='email != null'>where email=#{email}</if>",
			 "<if test='part != null'>and part=#{part}</if>",
			 "<if test='bedate != null and afdate != null'> and regdate between #{bedate} and #{afdate}</if>",
			 " order by part asc,ename asc, setnum asc",
			 "</script>"})
	List<ExerciseBoard> exerciselist(Map<String, Object> map);
	
	@Select("select ifnull(max(no),0) from exerciseboard")
	int maxno();
	
	@Delete("delete from exerciseboard where no=#{value}")
	int exdelete(int no);
}

