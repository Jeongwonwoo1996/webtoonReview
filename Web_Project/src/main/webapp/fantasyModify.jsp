<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${sessionScope.id eq null || sessionScope.id ne map.id}">
	<c:redirect url="./fantasy.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리뷰 수정 - WebtoonReview</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--  서머노트 불러오기 -->
<link href = "./summernote/summernote.min.css" rel="stylesheet">
<script src="./summernote/summernote.min.js"></script>
<script>
        $(document).ready(function(){
            $('#fcontent').summernote({tabsize: 2, height: 420, maxHeight: 600, maxWidth:1350});

            $("#thumbnailFile").on('change',function(){
                var fileName = $("#thumbnailFile").val();
                $(".uploadName").val(fileName);
            });
        });
</script>
<script src='./js/boardWrite.js'></script>
<script type="text/javascript">
	function check() {
		var ftitle = document.getElementById("ftitle");
		var fcontent = document.getElementById("fcontent");
		//alert(title.value + " : " + content.value);
		if (ftitle.value.length < 5 || ftitle.value == "") {
			alert("제목을 5글자 이상 적어주세요.");
			ftitle.focus();
			return false;
		}
		if (fcontent.value == "" || fcontent.value.length < 5) {
			alert("내용을 5글자 이상 적어주세요.");
			fcontent.focus();
			return false;
		}
	}
	
	function deleteFile() {
		var deleted = document.getElementById("thumbnailInput");
		deleted.innerHTML = "<span class='writeItem'>썸네일</span><br>"
		+"<input class='uploadName'>"
        +"<input type='file' name='thumbnailFile' id='thumbnailFile' accept='.gif, .png, .jpg'>"
        +"<label for='thumbnailFile'>찾아보기</label>"
        +"<span class='tip'>&nbsp;&nbsp;3:2 비율의 사진을 사용하시면 깨끗하게 출력됩니다. </span>"
				+ "<input type='hidden' name='waitDelete' value='${waitDelete}'>";
	}
</script>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang:wght@400;700&family=Limelight&family=Londrina+Solid&display=swap');
</style>
<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/boardWrite.css">
</head>
<body>
<div id="headerSpace">
</div>
<div id="writeFormContainer">
        <h1>리뷰 작성</h1>
        <hr class="styleHR">
        <div id="genreInfo">
            <span class="writeItem">장르</span><br><p class="genreText">판타지</p>
        </div>
        <form action="./fantasyModify" method="post" onsubmit="return check()" enctype="multipart/form-data">
        <div id="titleInput">
            <span class="writeItem">제목</span><br>
            <input type="text" name="ftitle" id="ftitle" value="${map.ftitle}">
        </div>
        <div id="thumbnailInput">
            <span class="writeItem">썸네일</span><br>
            <c:choose>
				<c:when test="${map.fthumbnail ne null}">
				<a href="./thumbnail/${map.fthumbnail}">${map.fthumbnail}</a>&nbsp;&nbsp;
				<a onclick="deleteFile()">삭제</a>
				</c:when>
			<c:otherwise>
            <input class="uploadName">
            <input type="file" name="thumbnailFile" id="thumbnailFile" accept=".gif, .png, .jpg">
            <label for="thumbnailFile">찾아보기</label>
            <span class="tip">&nbsp;&nbsp;3:2 비율의 사진을 사용하시면 깨끗하게 출력됩니다. </span>
       		</c:otherwise>
			</c:choose>
        </div>
        <div id="contentInput">
        <textarea name="fcontent" id="fcontent" row="20" cols="30" resize=none;>
        ${map.fcontent}
	    </textarea>
        </div>
        <input type="hidden" name="fno" value="${param.fno}">
        <input type="hidden" name="pageNo" value="${param.pageNo}">
        <button id="writeSubmit" type="submit">수정하기</button>
    </form>
</div>
<div class="marginSpace"></div>
<div id="footerSpace"></div>
</body>
</html>