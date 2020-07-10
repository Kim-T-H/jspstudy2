package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map =new HashMap<>();
	//게시물의 최대 번호 리턴
	
	
	public int maxnum() {
		SqlSession session= MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public boolean insert(Board board) {
		SqlSession session= MyBatisConnection.getConnection();
		String sql = "insert into board "
			+ " (num,name, pass, subject, content, file1, regdate,"
			+ " readcnt, grp,grplevel,grpstep) "
			+ " values(?,?,?,?,?,?,now(),0,?,?,?)";
		try {
			session.getMapper(cls).insert(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public int boardCount(String column, String find) {
		SqlSession session= MyBatisConnection.getConnection();
		try {
			map.clear();
			//subject,name
			if(column != null) {
				String[] cols =column.split(",");	//subject
				map.put("col1",cols[0]);
				if(cols.length> 1) {
					map.put("col2",cols[1]);	//name 에 들어감.
				}
				if(cols.length> 2) {
					map.put("col3",cols[1]);	//name 에 들어감.
				}
			}
			map.put("find",find);
			
			
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public List<Board> list(int pageNum,int limit,String column,String find) {
		SqlSession session=MyBatisConnection.getConnection();
	
		try {
		 map.clear();
		 map.put("start", (pageNum-1)*limit);
		 map.put("limit", limit);
		 if(column != null) {
				String[] cols =column.split(",");
				map.put("col1",cols[0]);
				if(cols.length> 1) {
					map.put("col2",cols[1]);
				}
				if(cols.length> 2) {
					map.put("col3",cols[1]);	//name 에 들어감.
				}
			}
		 map.put("find",find);
		
		 return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;		
	}	
	public Board selectOne(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).select(map).get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}	
	public void grpStepAdd(int grp,int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
		session.getMapper(cls).grpStepAdd(grp,grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}	
	public boolean update(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			return session.getMapper(cls).update(board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		} return false;
	}
	
	
	
	
	public boolean delete(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			 return session.getMapper(cls).delete(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public List<Map<String, Integer>> boardgraph(){
		SqlSession session =MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).graph();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return list;
	}
	public List<Map<String, Integer>> boardgraph2() {
		SqlSession session =MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).graph2();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return list;
	}
}
