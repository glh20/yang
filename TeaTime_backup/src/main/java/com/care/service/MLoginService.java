package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;

@Service
public class MLoginService implements IService{

	@Autowired
	private ModelDAO mdao;
	private Map<String, Object> map = null;

	@Override
	public void execute(Model model) {
		map = model.asMap();
		HttpServletRequest request 
			= (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDTO memdto = new MemberDTO();
		memdto = mdao.loginchk(id);
		if(memdto==null) {
			model.addAttribute("login","0");
		}else if(memdto!=null) {
			if(memdto.getM_id().equals(id) && !memdto.getM_pw().equals(pw)) {
				model.addAttribute("login","1");
			}else if(memdto.getM_id().equals(id) && memdto.getM_pw().equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("sid", request.getParameter("id"));
				model.addAttribute("login","2");
			}
		}
	}

}
