<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<script>
	$(function() {
		$('.back').click(function() {
			location = '../list?page=${param.page}';
		});

		$('.delete').click(function() {
			$(".password-panel").show();
		});

		$('.cancel').click(function() {
			$(':password').val('');
			$('.password-panel').hide();
		});
		$('.password-panel').submit(function(e) {
			e.preventDefault();
			var result = confirm("삭제할까요?");
			if (result) {
				//ajax로 삭제
			}
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2 class="my-5">
			<i class="fas fa-file-alt"></i> ${board.title}
		</h2>

		<div style="overflow: hidden">
			<div class="float-left">작성자 : ${board.writer}, 조회수 :
				${board.readCnt}</div>
			<div class="float-right">
				수정일 :
				<fmt:formatDate value="${board.updateDate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
		</div>
		<hr />
		${board.content}
		<hr />
		<form class="my-3 password-panel" style="display: none">
			비밀번호 : <input type="password" name="password" required>
			<button type="submit" class="btn btn-primary btn-sm">
				<i class="fas fa-times"></i> 삭제
			</button>
			<button type="button" class="btn btn-primary btn-sm cancel">
				<i class="fas fa-undo"></i> 취소
			</button>
		</form>
		<div class="text-center">
			<a href="../edit/${board.boardId}?page=${param.page}"
				class="btn btn-primary ok text-white"> <i class="fas fa-edit"></i>
				수정
			</a>
			<button class="btn btn-danger delete">
				<i class="fas fa-trash"></i> 삭제
			</button>
			<button type="button" class="btn btn-primary back">
				<i class="fas fa-undo"></i> 목록
			</button>
		</div>
	</div>
</body>
</html>