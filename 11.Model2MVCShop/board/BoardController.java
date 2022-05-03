package com.model2.mvc.web.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.boardImg.BoardImgService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.BoardImg;
import com.model2.mvc.service.domain.User;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("boardImgServiceImpl")
	private BoardImgService boardImgService;
	
	public BoardController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="getBoard", method=RequestMethod.GET)
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {
		Board board = boardService.oneBoard(boardNo);
		model.addAttribute("board",board);
		
		return "/board/getBoard.jsp";
	}
	
	@RequestMapping(value="listBoard", method=RequestMethod.GET)
	public String listBoard(@ModelAttribute("search") Search search , Model model, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		
		model.addAttribute("board",boardService.getBoard(user));
		
		return "/board/listBoard.jsp";
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.GET)
	public String addBoardView() throws Exception {
		System.out.println("GET/addBoard");
		return "redirect:/board/addBoard.jsp";
	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)
	public String addBoard(@ModelAttribute("board")Board board,MultipartHttpServletRequest mRequest,HttpSession session ) throws Exception {
			
		
		board.setUserId(((User)session.getAttribute("user")).getUserId());
		board.setRegion(((User)session.getAttribute("user")).getAddr());
		int no = boardService.addBoard(board);
		
		List<MultipartFile> fileList = mRequest.getFiles("file");
		List<BoardImg> img = new ArrayList<>();
		
		String projectPath = "C:\\Users\\bitcamp\\git\\12Model2\\12.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";	
		for(MultipartFile mf : fileList) {
			String originName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			
			System.out.println("원본이름 : "+ originName);
			System.out.println("파일사이즈 : "+fileSize);
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid+"_"+originName;
			
			File saveFile = new File(projectPath,fileName);
			mf.transferTo(saveFile);
			
			BoardImg boardImg = new BoardImg();
			boardImg.setImgURL(fileName);
			boardImg.setBoardNo(board.getBoardNo());
			img.add(boardImg);
		}
		
		boardImgService.addBoardImg(img.get(0));
		
		return "redirect:/board/listBoard";
	}
}
