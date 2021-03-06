package com.team.fitzza.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;


@Controller
public class VoteController {
	
	@Inject
	BoardService service;
	@Inject
	MemberService Mservice;
	
	@GetMapping("/board/vote/voteList")
	public String voteList() {
		
		return "/board/vote/voteList";
	}
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/vote/voteLists")
	public List<BoardVO> newsMoreView(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception {
		System.out.println("투표 페이지vo"+pvo);
//		startNum="9";
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(8);
		return service.BoardSelectAllSE(6,pvo);
		}
	
	//검색 기능
	@GetMapping("/board/vote/search")
	   public ModelAndView search(String searchKey, String searchWord) {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/board/vote/voteList");
	      return mav;
		}
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/vote/searchLists")
	public List<BoardVO> searchMoreView(@RequestParam(value="startNum", required=false)String startNum,
			String searchKey, String searchWord) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 5;
		System.out.println("searchKey -> "+searchKey);
		System.out.println("searchWord -> "+searchWord);
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, 6);
		}
	
	
	@GetMapping("/board/vote/voteWrite")
	public String voteWrite() {
		
		return "/board/vote/voteWrite";
	}
	
	@PostMapping("/board/vote/voteWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		System.out.println("voteWriteOk START");
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String)request.getSession().getAttribute("logId"));	// 글쓴이
		
		
		// 파일 업로드에 관련된 multipartRequest객체
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload"); // 파일업로드를 위한 업로드 위치의 절대주소
		System.out.println("path -> "+path);
		try {
			// 파일 업로드를 처리하기 위해서 request 객체에서 multipart객체를 구하여야 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			//mr에 파일의 수만큼 MultipartFile객체가존재한다
			List<MultipartFile> files = mr.getFiles("filename");
			System.out.println("업로드 파일 수 -> "+files.size());
			
			if(files!=null) {	//if 111
				int cnt = 1;	// 4번에서 업로드 순서에 따라 filename1, filename2 파일명을 대입하기 위한 변수
				//첨부파일수 만큼 반복하여 업로드한다.
				for(int i=0; i<files.size(); i++) {	// for 222
					//	1. MultipartFile객체 얻어오기
					MultipartFile mf = files.get(i);
					
					//	2. 업로드한 실제 파일명을 구하기
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName -> "+ orgFileName );
					
					//	3. rename하기
					if(orgFileName!=null && !orgFileName.equals("")) {	//if 333, 파일명이 존재하면
						File f = new File(path, orgFileName);
						
						//	파일이 존재하는 지 확인	true:파일이 존재/	false:파일 없음
						if(f.exists()) {	//if 444
							for(int renameNum=1;; renameNum++) {	//for 555
								//	확장자와 파일을 분리한다.
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) {	//if 666 , 새로 생성된 파일 객체가 없으면
									orgFileName = f.getName();
									break;
								}	//if 666
								
							}	//for 555
							
						}	//if 444
						//	4. 파일 업로드 구현
						try {
							mf.transferTo(f);	// 실제 업로드가 일어나는(발생하는) 시점
							System.out.println(f);
						}catch(Exception ee) {
							ee.printStackTrace();
						}
						
						//	5. 업로드한(새로운파일명) vo에 셋팅
						if(cnt==1) vo.setFile1(orgFileName);
						if(cnt==2) vo.setFile2(orgFileName);
						cnt++;
					}	//if 3
					
				}// for 2
				
			}//	if 1
			System.out.println(vo.getFile1());
			System.out.println(vo.getFile2());
			//DB등록
			service.BoardInsert(vo);
			Mservice.expUp_board(path);
			String user_id = (String)request.getSession().getAttribute("logId");
			vo.setBoard_num(service.boardNum(user_id));
			service.BoardFileInsert(vo);
			
			

			//레코드 추가 성공
			String msg = "<script>alert('자료실에 글이 등록되었습니다');location.href='/board/vote/voteList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			
		}catch(Exception e) {
			e.printStackTrace();
			//레코드 추가실패
			//파일을지우기
				fileDelete(path, vo.getFile1());
				fileDelete(path, vo.getFile2());

			//메세지
			String msg = "<script>alert('글 등록에 실패하였습니다');history.back();</script>";
			//이전페이지로 보내기
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);	//400
		}
		return entity;
	}
	// 파일지우기
		public void fileDelete(String p, String f) {
			if(f != null) {	//파일명이 있을때만
				File file = new File(p, f);
				file.delete();
			}
		}
	
	//글 내용보기
	@GetMapping("/board/vote/voteView")
	public ModelAndView voteBoardView(int board_num, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("조회수 증가");
		service.hitCount(board_num); //조회수 증가
		mav.addObject("vo", service.BoardView(board_num));
		BoardVO vo = new BoardVO();
		vo.setBoard_num(board_num);
		mav.addObject("us", service.voteuser((String)request.getSession().getAttribute("logId"),vo));
		Integer a = service.votecnt(1,vo);
		Integer b = service.votecnt(2,vo);
		Integer c = service.votepercent(1, vo);
		Integer d = service.votepercent(2, vo);
		mav.addObject("cnt1", a);
		mav.addObject("cnt2", b);
		mav.addObject("cnt3", a+b);
		mav.addObject("cnt4", c);
		mav.addObject("cnt5", d);
		
		mav.setViewName("/board/vote/voteView");
		return mav;
		
	}
	
	//글 수정폼
	@GetMapping("/board/vote/voteEdit")
	public ModelAndView voteEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo =service.BoardView(board_num);
		mav.addObject("vo", vo);
		mav.setViewName("/board/vote/voteEdit");
		return mav;
	}
	
	//수정(DB)
		@PostMapping("/board/vote/voteEditOk")
		public ResponseEntity<String> reviewEditOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
			System.out.println("voteEditOk START");
			vo.setUser_id((String)session.getAttribute("logId"));
			String path = session.getServletContext().getRealPath("/upload");
			
				
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			List<String> fileList = new ArrayList<String>();	// 새로 DB에 업데이트 할 파일명 정리하는 컬렉션
			List<String> newUpload = new ArrayList<String>();	// 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
			try {
				//	1. DB에서 파일명 가져오기
				BoardVO dbfileVO = service.getFileName(vo.getBoard_num());
				fileList.add(dbfileVO.getFile1());
				if(dbfileVO.getFile2()!=null) fileList.add(dbfileVO.getFile2());
				
				//	2. 새로 업로드 하기
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
				
				// 새로 업로드된 MultipartFile객체를 얻어오기
				List<MultipartFile> newFileList = mr.getFiles("filename");
				if(newFileList != null) {	// 새로 업로드 된 파일이 있으면
					for(int i=0; i<newFileList.size(); i++) {
						MultipartFile newMf = newFileList.get(i);
						String newUploadFilename = newMf.getOriginalFilename();
						System.out.println((i+1)+"번째 파일 -> "+newUploadFilename);
						// 리네임 작업
						if(newUploadFilename != null && !newUploadFilename.equals("")) {
							File f = new File(path, newUploadFilename);
							if(fileList.contains(newUploadFilename)) {
								//이미 해당 글에 업로드 된 파일이라면 리네임이나 업로드하지 않음
							}else {
								//해당 글에는 없지만 이미 업로드 된 파일이라면
								//리네임 후 업로드
								if(f.exists()) {
									//있으면 여기서 rename
									for(int n=1;;n++) {
										int point = newUploadFilename.lastIndexOf(".");
										String fileNameNoExt = newUploadFilename.substring(0, point);
										String ext = newUploadFilename.substring(point+1);
										
										//새로운 파일명 만들어 존재유무 확인
										String nf = fileNameNoExt+ " ("+n+")."+ext;
										f = new File(path, nf);
										if(!f.exists()) {	//없으면
											newUploadFilename = nf;
											break;
										}
									}//for
								}
								//업로드
								try {
									newMf.transferTo(f);
								}catch(Exception ee) {}
							}
							
							//fileList.add(newUploadFilename);	//db에 등록할 파일명에 추가
							newUpload.add(newUploadFilename);	//새로 업로드 목록 추가		
						}
					}//for
				}//if
				else {
				}
				
				// fileList에 있는 DB에 등록할 파일명을 filename1, filename2에 셋팅
				for(int k=0; k<newUpload.size(); k++) {
					if(k==0) vo.setFile1(newUpload.get(k));
					if(k==1) vo.setFile2(newUpload.get(k));
				}
				
				// DB update
				service.BoardUpdate(vo);
				service.BoardFileUpdate(vo);		
				
				// 글 내용보기로 이동
				String msg = "<script>alert('자료실 글이 수정되었습니다.\\n글내용보기로 이동합니다');";
				msg += "location.href='/board/vote/voteView?board_num="+vo.getBoard_num()+"';</script>";
				
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				//DB잘못수정했을때
				for(String fname:newUpload) {
					fileDelete(path, fname);
				}
				
				//수정페이지로 이동
				String msg = "<script>";
				msg += "alert('글 수정 실패하였습니다'\\n수정폼으로 이동합니다)";
				msg += "history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}

			return entity;		
		}
		
		//투표
		@RequestMapping(value="/vote/votein", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Integer> votein(BoardVO vo, HttpServletRequest request) {
			vo.setUser_id((String)request.getSession().getAttribute("logId"));
			 service.votein(vo);
			 Map<String, Integer> map = new HashMap<String, Integer>();
			 Integer a = service.votecnt(1,vo);
			 Integer b = service.votecnt(2,vo);
			 Integer c = service.votepercent(1, vo);
				Integer d = service.votepercent(2, vo);
				map.put("cnt1", a);
				map.put("cnt2", b);
				map.put("cnt3", a+b);
				map.put("cnt4", c);
				map.put("cnt5", d);
			return map;
		}
	
}
