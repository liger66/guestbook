package com.inc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.inc.vo.BookVo;

public class BookDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BookVo> selectList(Map<String, String> searchMap) {
		List<BookVo> bookList = sqlSession.selectList("guestbook.selectList", searchMap);
		return bookList;
	}

	public void add(BookVo bvo) {
		sqlSession.insert("guestbook.add", bvo);
	}
	
	public void delete(int id) {
		sqlSession.delete("guestbook.delete", id);
	}
	
	public BookVo selectOne(int id) {
		BookVo bvo = sqlSession.selectOne("guestbook.selectOne", id);
		return bvo;
	}

	public void update(BookVo bvo) {
		sqlSession.update("guestbook.modify", bvo);
		
	}

	public String getPassword(int id) {
		String password = sqlSession.selectOne("guestbook.get_password", id);
		return password;
	}

	public int getNameCount(String name) {
		int count = sqlSession.selectOne("guestbook.get_name_count", name);
		return count;
	}
}