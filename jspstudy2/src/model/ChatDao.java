package model;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ChatMapper;

public class ChatDao {
	private Class<ChatMapper> cls = ChatMapper.class;

	public boolean insert(String message) {
		SqlSession session = MyBatisConnection.getConnection();

		try {
			String[] messages = message.split(":");
			String id = messages[0].trim();
			String content = messages[1].trim();
			session.getMapper(cls).insert(id, content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}

		return false;

	}
}
