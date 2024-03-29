<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리뷰 작성 - WebtoonReview</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="./summernote/summernote.min.css" rel="stylesheet">
<script src="./summernote/summernote.min.js"></script>
<script>
	$(document).ready(function() {
		$('#rcontent').summernote({
			tabsize : 2,
			height : 420,
			maxHeight : 600,
			maxWidth : 1350
		});

		$("#thumbnailFile").on('change', function() {
			var fileName = $("#thumbnailFile").val();
			$(".uploadName").val(fileName);
		});
	});
</script>
<script src='./js/boardWrite.js'></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang:wght@400;700&family=Limelight&family=Londrina+Solid&display=swap')
	;
</style>
<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/boardWrite.css">
</head>
<body>
	<c:if test="${sessionScope.id != null }">
		<div id="headerSpace"></div>
		<div id="writeFormContainer">
			<form action="./romanceBoardModify" method="post"
				enctype="multipart/form-data">
				<h1>리뷰 작성</h1>
				<hr class="styleHR">
				<div id="genreInfo">
					<span class="writeItem">장르</span><br>
					<p class="genreText">로맨스</p>
				</div>
				<div id="titleInput">
					<span class="writeItem">제목</span><br> <input type="text"
						name="title" id="rtitle" value="${map.rtitle }">
				</div>
				<div id="thumbnailInput">
					<span class="writeItem">썸네일</span><br> <input
						class="uploadName"> <input type="file" name="rfilename"
						id="thumbnailFile" accept=".gif, .png, .jpg"> <label
						for="thumbnailFile">찾아보기</label> <span class="tip">&nbsp;&nbsp;3:2
						비율의 사진을 사용하시면 깨끗하게 출력됩니다. </span>
				</div>
				<div id="contentInput">
					<textarea name="content" id="dcontent" row="20" cols="30"
						resize=none;>${map.rcontent }
	    </textarea>
					<input type="hidden" name="rno" value="${map.rno }">
				</div>
				<button id="writeSubmit" type="submit">글쓰기</button>
			</form>
		</div>
		<div class="marginSpace"></div>
		<div id="footerSpace"></div>
	</c:if>
	<c:if test="${sessionScope.id == null }">
		<script>
			location.href = "./login.jsp";
		</script>
	</c:if>
</body>
</html>