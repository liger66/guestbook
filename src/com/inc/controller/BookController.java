package com.inc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.inc.dao.BookDao;
import com.inc.vo.BookVo;

@Controller
@SessionAttributes({"bvo"})
public class BookController {
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@RequestMapping(value="/book/list", method=RequestMethod.GET)
	public String bookList(@RequestParam(required=false) String serch_option, 
						   @RequestParam(required=false) String serch_text, Model model) {
		Map<String, String> serchMap = new HashMap<>();
		
		serchMap.put("serch_option", serch_option);
		serchMap.put("serch_text", serch_text);
		
		model.addAttribute("bookList", bookDao.selectList(serchMap));
		
		return "/book/list.jsp";
	}
	
	@RequestMapping(value="/book/add", method=RequestMethod.GET)
	public String bookAdd(Model model) {
		model.addAttribute("bookVo", new BookVo());
		return "/book/add.jsp";
	}
	
	@RequestMapping(value="/book/add", method=RequestMethod.POST)
	public String bookAdd(@ModelAttribute("bookVo") @Valid BookVo bookVo, BindingResult result,
			HttpServletRequest request) {
		bookVo.setIp(request.getRemoteAddr());
		if (result.hasErrors()) {
			return "/book/add.jsp";
		} else {
			bookDao.add(bookVo);
			return "redirect:/book/list";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/book/dualCheck", method=RequestMethod.GET)
	public int bookDualCheck(@RequestParam(required=false) String writer) {		
		int cnt = bookDao.getNameCount(writer);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value="/book/password", method=RequestMethod.POST)
	public String bookPass(@RequestParam(required=false) int id) {
		String password = bookDao.getPassword(id);
		return password;
	}
	
	@RequestMapping(value="/book/delete", method=RequestMethod.GET)
	public String bookDelete(@RequestParam(required=false) int id) {
		bookDao.delete(id);
		return "redirect:/book/list";
	}
	
	@RequestMapping(value="/book/update", method=RequestMethod.GET)
	public String bookUpdate(@RequestParam(required=false) int id, Model model) {
		BookVo bvo = bookDao.selectOne(id);
		model.addAttribute("bvo", bvo);
		return "/book/update.jsp";
	}
	
	@RequestMapping(value="/book/update", method=RequestMethod.POST)
	public String bookUpdate(@ModelAttribute("bvo") BookVo bvo) {
		bookDao.update(bvo);
		return "redirect:/book/list";
	}
}
