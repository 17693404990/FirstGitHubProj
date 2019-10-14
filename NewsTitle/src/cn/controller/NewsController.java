package cn.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.pojo.Comment;
import cn.pojo.Detail;
import cn.service.NewsService;
import cn.tools.PageSupport;

@Controller
@RequestMapping(value="news")
public class NewsController {
	private Logger logger = Logger.getLogger(NewsController.class);
	
	@Resource
	private NewsService newsService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder){
		dataBinder.registerCustomEditor(Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping(value="newsinfo")
	public String selectAll(Model model,Integer id,HttpSession session,
			HttpServletRequest request,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "pageIndex", required = false) String pageIndex){
		String titles= request.getParameter("title");
		List<Detail> list =null;		
		System.out.println(titles);
		int pageSize = 3;
		int currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}
		int totalCount = 0;
		try {
			totalCount = newsService.getEntryCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		//总页数
		int totalPageCount = pages.getTotalPageCount();
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		list = newsService.selectAll(titles, currentPageNo, pageSize);		
		
		model.addAttribute("list", list);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("pages", pages);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPageNo", currentPageNo);
		return"news";
	}
	
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(int id,HttpSession session){
		int count = newsService.delectNews(id);
		session.setAttribute("tishi", "删除成功！");
		return JSONArray.toJSONString(count);
	}
	
	
	@RequestMapping(value="comment")
	public String selectComment(Integer id,HttpSession session){
		List<Comment> list = new ArrayList<Comment>();
		list = newsService.selectComment(id);
		session.setAttribute("list", list);
		return"comment";
	}
	
	
	@RequestMapping(value="add")
	public String add(Model model,HttpServletRequest request,Integer id){		
		model.addAttribute("id", id);
		System.out.println("id---------->"+id);
		return"add";
	}
	
	
	@RequestMapping(value="adds")
	public String adds(Comment comment,HttpSession session){
		comment.setId(comment.getNewsid());
		comment.setContent(comment.getContent());
		comment.setAuthor(comment.getAuthor());
		int num = newsService.addComment(comment);
		if(num>0){
			return"redirect:comment?id="+comment.getId();
		}else{
			return"add";
		}		
	}
	

}
