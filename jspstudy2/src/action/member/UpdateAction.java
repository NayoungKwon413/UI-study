package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
  	1. 모든 파라미터 정보를 Member 객체에 저장
	2. 입력된 비밀번호와 db에 저장된 비밀번호를 비교
		- 같지 않은 경우, "비밀번호 오류" 메세지 출력 후 updateForm.me 페이지로 이동
	3. 비밀번호가 일치하는 경우, 파라미터값을 저장한 Member 객체를 이용하여 db 정보를 수정
		int MemberDao.update(Member) 메서드 이용
		return 값 <0 => 수정 실패 메세지 출력 후 updateForm.me 로 페이지 이동
		return 값 >0 => 수정 성공 메세지 출력 후 info.me 로 페이지 이동 
 */
public class UpdateAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));	
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		Member db = new MemberDao().selectOne(mem.getId());
		String msg = "비밀번호 오류"; 
		String url = "updateForm.me?id="+mem.getId();
		if(mem.getPass().equals(db.getPass())){
			int result = new MemberDao().update(mem);
			if(result > 0) {   //수정 성공인 경우
				return new ActionForward(true, "info.me?id="+mem.getId());
			}else {
				msg = "수정 실패";
				url = "updateForm.me?id="+mem.getId();
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
