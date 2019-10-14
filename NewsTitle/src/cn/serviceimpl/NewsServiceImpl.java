package cn.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.dao.NewsMapper;
import cn.pojo.Comment;
import cn.pojo.Detail;
import cn.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService{
	@Resource
	private NewsMapper newsMapper;

	@Override
	public List<Detail> selectAll(String title, Integer currentPageNo,
			Integer pageSize) {
		currentPageNo = (currentPageNo - 1) * pageSize;
		// TODO Auto-generated method stub
		return newsMapper.selectAll(title, currentPageNo, pageSize);
	}

	@Override
	public int getEntryCount() {
		// TODO Auto-generated method stub
		return newsMapper.getDetailCount();
	}

	@Override
	public int delectNews(int id) {
		// TODO Auto-generated method stub
		return newsMapper.delectNews(id);
	}

	@Override
	public List<Comment> selectComment(Integer id) {
		// TODO Auto-generated method stub
		return newsMapper.selectComment(id);
	}

	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		return newsMapper.addComment(comment);
	}

}
