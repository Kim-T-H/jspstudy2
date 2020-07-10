package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member" 
		    + " (id,pass,name,gender, email, tel,picture)" 
			+ " values (#{id},#{pass},#{name},#{gender},#{email},#{tel},#{picture})")
	
	int insert(Member mem);

	@Select({"<script>",
			"select * from member",
			"<if test='id !=null'> where binary id=#{id}</if>",
			"</script>"})
	List<Member> select(Map<String, Object> map);

	
	@Select("select id from member where email =#{email} and tel =#{tel} ")
	String idSearch(@Param("email") String email,@Param("tel") String tel);

	
	@Select("select pass from member " 
	          + " where id = #{id}  and email = #{email} and tel = #{tel}")
	String pwSearch(@Param("id") String id,@Param("email") String email,@Param("tel") String tel);

	@Update("update member set "+"name=#{name}, gender=#{gender}, email=#{email}, tel=#{tel}, picture=#{picture} where id=#{id}")
	int update(Member m);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatepass(@Param ("id") String id,@Param("pass") String pass);

	@Delete("delete from member where id=#{id}")
	int delete(@Param("id")String id);
	
	

}
