package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;


public interface BoardMapper {
	
	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert into board" 
			+ "(num, name, pass, subject, content, file1, regdate, readcnt, grp, grplevel, grpstep)" 
			+ "value(#{num}, #{name}, #{pass}, #{subject}, #{content}, #{file1}, now(), 0, #{grp}, #{grplevel}, #{grpstep})")
	void insert(Board b);

	@Select({"<script>",
			"select count(*) from board",
			"<if test='col1 != null'> where ${col1} like '%${search}%' </if>",
			"<if test='col2 != null'> or ${col2} like '%${search}%' </if>",
			"<if test='col3 != null'> or ${col3} like '%${search}%' </if>",
			"</script>"})
	int boardCount(Map<String, Object> map);
	
//	@Select("select * from board order by grp desc, grpstep asc limit #{pageNum},#{limit}")
//	List<Board> list(@Param("pageNum")int pageNum, @Param("limit")int limit);

	@Select({"<script>",
			"select * from board",
			"<if test='col1 != null'> where ${col1} like '%${search}%' </if>",
			"<if test='col2 != null'> or ${col2} like '%${search}%' </if>",
			"<if test='col3 != null'> or ${col3} like '%${search}%' </if>",
//			"<if test='num != null'> where num = #{num} </if>",
//			"<if test='pageNum != null || limit != null'> order by grp desc, grpstep asc limit #{start},#{limit} </if>",
			"<choose>",
			"<when test='num != null'> where num = #{num} </when>",
			"<otherwise> order by grp desc, grpstep asc limit #{start}, #{limit} </otherwise>",
			"</choose>",
			"</script>"})
	List<Board> select(Map<String, Object> map);

	@Update("update board set readcnt = readcnt+1 where num=#{value}")
	void readcntAdd(int num);

	@Update("update board set grpstep = grpstep + 1 where grp=#{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update("update board set name=#{name}, subject=#{subject}, content=#{content}, file1=#{file1} where num=#{num}")
	void update(Board b);

	@Delete("delete from board where num=#{value}")
	int delete(int num);

	//[{name:È«±æµ¿, cnt:9}], [{name:±è»ñ°«, cnt:3}] ...
	@Select("select name, count(*) cnt from board group by name having count(*) > 1 order by cnt desc")
	List<Map<String, Integer>> graph();

	// list : [{date:2020-05-01, cnt:9}], [{date:2020-05-02, cnt:3}] ...
	@Select("select date_format(regdate, '%Y-%m-%d') regdate, count(*) cnt "
			+ "from board "
			+ "group by date_format(regdate, '%Y%m%d') "
			+ "order by regdate desc LIMIT 0,7")
	List<Map<String, Integer>> graph2();

	
}
