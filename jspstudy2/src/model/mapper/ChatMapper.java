package model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import model.Chat;

public interface ChatMapper {
	@Insert("insert into chat"
			+"(id,regdate,content)"
			+"values(#{id},now(),#{content})")
	
	void insert(@Param("id") String id,@Param("content") String content);
	
	
}
