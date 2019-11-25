package com.care.modelDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;
import com.care.modelDTO.PostDTO;

@Repository
public class ModelDAO {
	private static final String namespace="com.care.ttbatis.ttMapper";

	@Autowired
	private SqlSession sqlSession;

	public String register(MemberDTO dto, String id, String tel, String mail) {
		String du = null;


		String resultId = sqlSession.selectOne(namespace+".idchk",id);
		String resultTel = sqlSession.selectOne(namespace+".telchk",tel);
		String resultMail = sqlSession.selectOne(namespace+".mailchk",mail);
		System.out.println("id : " + resultId);
		System.out.println("tel : " + resultTel);
		System.out.println("mail : " +resultMail);
		if(resultId==null) {
			resultId = "ok1";
		}
		if(resultTel==null) {
			resultTel = "ok2";
		}
		if(resultMail==null) {
			resultMail = "ok3";
		}

		try {
			if(resultId.equals(id)) {
				du = "iddu";
			}else if(resultTel.equals(tel)) {
				du = "teldu";
			}else if(resultMail.equals(mail)) {
				du = "maildu";	
			}else if(resultId.equals("ok1") && resultTel.equals("ok2") && resultMail.equals("ok3")){
				System.out.println("중복 없음");
				sqlSession.insert(namespace+".regmember",dto);
				du = "regiOk";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//System.out.println("인서트 실행!!");
		//sqlSession.insert(namespace+".regmember",dto);

		return du;

	}


	public MemberDTO loginchk(String m_id) {
		return sqlSession.selectOne(namespace+".loginchk",m_id);
	}

	public String category(CategoryDTO cdto) {
		String cat_du = null;
		try {
			sqlSession.insert(namespace+".category_insert", cdto);		
			cat_du = "catOk";
		}catch(Exception e) {
			cat_du = "catdu";
		}
		return cat_du;
	}

	//John DAO ==================================
	public int checkIfFriend(MyFriendDTO mfdto) {
		int ifFriend = 0;
		try {
			ifFriend = sqlSession.selectOne(namespace + ".checkIfFriend", mfdto);
		} catch (Exception e){
			
		}

		return ifFriend;
	}

	public MemberDTO userLookUp(String m_id) {
		return sqlSession.selectOne(namespace + ".userLookUp", m_id);
	}
	//===========================================
	
	//==============yang================
	public MemberDTO my_info(String sessionid) {
		return sqlSession.selectOne(namespace+".my_info", sessionid);
	}
	public CategoryDTO my_cat(String sessionid) {
		return sqlSession.selectOne(namespace+".my_cat", sessionid);
	}
	public MemberDTO f_info(String user_id) {
		return sqlSession.selectOne(namespace+".f_info", user_id);
	}
	public void info_fix(MemberDTO mdto) {
		sqlSession.update(namespace+".info_fix", mdto);
	}
	public List<MyFriendDTO> f_list(String user_id) {
		return sqlSession.selectList(namespace+".f_list", user_id);
	}
	public void friend_add(MyFriendDTO mfdto) {
		sqlSession.insert(namespace+".friend_add", mfdto);
	}
	public void write_board(PostDTO pdto) {
		sqlSession.insert(namespace+".write_board", pdto);
	}
	public List<PostDTO> board_list(String sessionid) {
		return sqlSession.selectList(namespace+".board_list", sessionid);
	}
	//===================================

}
