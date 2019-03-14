package edu.autocar.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.autocar.domain.Board;
import edu.autocar.domain.PageInfo;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService {

	private List<Board> boardList;
	final static private int PER_PAEGE_COUNT = 10;
	int maxId=0;
	
	public BoardServiceImpl() {
		boardList = Collections.synchronizedList(new LinkedList<>());
		for (maxId = 1;  maxId <= 45; maxId++) {
			boardList.add(0, new Board(maxId));
		}
	}
	
	@Override
	public PageInfo<Board> getPage(int page) throws Exception {
		List<Board> list = new ArrayList<>();
		
		int start = (page-1)*PER_PAEGE_COUNT;
		int end = start + PER_PAEGE_COUNT;
		int totalCount = boardList.size();
		
		if(totalCount < end) {
			end = totalCount;
		}
		
		for (int i = start; i < end; i++) {
			list.add(boardList.get(i));
		}
		
		return new PageInfo<>(
				totalCount,
				(int)Math.ceil(totalCount/(double)PER_PAEGE_COUNT),
				page, PER_PAEGE_COUNT, list);
	}

	@Override
	public Board getBoard(int boardId) throws Exception {
		for(Board board : boardList) {
			if(board.getBoardId() == boardId) {
				int cnt = board.getReadCnt();
				board.setReadCnt(cnt+1);
				return board;
			}
		}
		return null;
	}

	@Override
	public void create(Board board) throws Exception {
		board.setBoardId(maxId);
		board.setRegDate(new Date());
		board.setUpdateDate(new Date());
		maxId++;
		
		boardList.add(0,board);
	}

	@Override
	public boolean update(Board board) throws Exception {
		for(Board b : boardList) {
			if(b.getBoardId() == board.getBoardId()) {
				if(b.getPassword().equals(board.getPassword())) {
					b.setTitle(board.getTitle());
					b.setWriter(board.getWriter());
					b.setContent(board.getContent());
					b.setUpdateDate(new Date());
					return true;
				} else {
					return false;
				}
			}
		}
		return false;
	}

	@Override
	public boolean delete(int boardId, String password) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
