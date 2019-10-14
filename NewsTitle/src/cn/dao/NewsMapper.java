package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pojo.Comment;
import cn.pojo.Detail;

public interface NewsMapper {
	/**
	 * 查询新闻表全部信息
	 * @return
	 */
	List<Detail> selectAll(@Param("title") String title,
			@Param("from") Integer currentPageNo,
			@Param("pageSize") Integer pageSize);
	
	/**
	 * 查询新闻表总数
	 */
	int getDetailCount();
	/**
	 * 删除新闻
	 */
	int delectNews(int id);
	/**
	 * 查询评论
	 */
	List<Comment> selectComment(Integer id);
	/**
	 * 增加评论
	 */
	int addComment(Comment comment);

}
