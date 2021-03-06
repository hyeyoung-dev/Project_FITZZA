package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;

public interface OldBoardService {
	public int oldBoardDetailInsert(BoardVO vo);
	public int oldBoardStateInsert(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll();
	public BoardVO oldBoardView(int board_num);
	public int oldBoardDetailUpdate(BoardVO vo);
	public int oldBoardStateUpdate(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll(PagingVO pvo);
	public List<BoardVO> oldBoardSearch(String searchKey, String string, int start, int end);
}
