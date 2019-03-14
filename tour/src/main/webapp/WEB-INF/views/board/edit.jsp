<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script src="${contextPath}/resources/bower_components/tinymce/tinymce.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<script>
$(function(){
	tinymce.init({
		selector: 'textarea',
		language: 'ko_KR',
		height: 500
	});
})
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2 class="my-5">
			<i class="fas fa-edit"></i> 게시글 수정
		</h2>
		<form:form modelAttribute="board">
			<form:hidden path="boardId" />
			<div class="form-group">
				<label for="writer">작성자</label>
				<form:input path="writer" class="form-control" />
				<form:errors path="writer" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<form:input path="title" class="form-control" />
				<form:errors path="title" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<form:textarea path="content" class="form-control" rows="10" />
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary ok">
					<i class="fas fa-check"></i> 완료
				</button>
				<a href="../view/${board.boardId}?page=${param.page}" class="btn btn-primary back">
					<i class="fas fa-undo"></i> 취소
				</a>
			</div>
		</form:form>
	</div>
</body>
</html>