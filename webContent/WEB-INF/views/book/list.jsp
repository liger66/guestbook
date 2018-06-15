<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function del(id) {
		var url = "/book/password";
		$.ajax({
			"url":url, "data":"id=" + id, "type":"POST", "success":
				function(data) {
					var userPassword = prompt("비밀번호를 입력 하세요.");
					if (data == userPassword) {
						console.log("delete --------------");
						location.href = "delete?id=" + id;
					} else {
						alert ("비밀번호가 틀립니다.");
					}
			}
		});
	}
	
	function modify(id) {
		var url = "/book/password";
		
		$.ajax({
			"url":url, 
			"data":{"id":id }, 
			"type":"POST", 
			"success":
			function(data) {
				var userPassword = prompt("비밀번호를 입력 하세요.");
				if (data == userPassword) {
					//location.href = "${pageContext.request.contextPath}/book/update?id=" + id;
					location.href = "update?id=" + id;
				} else {
					alert ("비밀번호가 일치 하지 않습니다");
				}
			}
		});
	}
	
	function search() {
		var search_option = $("#search_option").val();
		var search_text = $("#search_text").val();
		
		if (search_option != 'all'  && search_text == '') {
			alert ("검색어를 입력 해 주세요");
			$("#search_text").focus();
		}
		
		// 같은 페이지로 요청 하는 경우 서블릿 경로를 생략 가능.. 파라미터만 넘긴다.
		location.href = "?search_option=" + search_option + "&search_text=" + search_text;
	}
	
	// 모든 html 이로딩 된후 실행 : 검색한 조건 내용을 유지
	$(function() {
		$('#serch_text').val('${param.search_text}');
		
		var options = $("#serch_option").children('optin');
		for (var option of options) {
			if ($(option).val == '${param.serch_option}') {
				$(option).attr('selected', 'seleted');
				break;
			}
		}
	});
	
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title">Guest Book</h1>
			<div class="search">
				<select id="search_option">
					<option value="all">전체검색</option>
					<option value="writer">이름으로검색</option>
					<option value="msg">내용으로검색</option>
					<option value="name_msg">이름+내용</option>
				</select>
				<input type="text" id="search_text"/>
				<input type="button" value="검색" onclick="search()"/>
			</div>
		</div>
		<hr />
		<div class="footer">
			<button class="big" type="button" onclick=
				"location.href='${pageContext.request.contextPath}/book/add'">W r i t e</button>
		</div>
		<hr />
		<div class="content">
			<c:if test="${empty bookList}">
				<P class="text_center">첫 게시물을 작성 해 주세요.^^ </P>
			</c:if>
			<c:forEach var="bvo" items="${bookList }">
			<div class="comment">
				<div class="msg">${bvo.msg }</div>
				<div class="grid_3_7">
					<div class="text_center">Writer</div>
					<div>${bvo.writer } ( ${bvo.ip } )</div>
				</div>
				<div class="grid_3_7">
					<div class="text_center">D a t e</div>
					<div>${bvo.writedate }</div>
				</div>
				<div class="text_center">
					<button class="small" type="button" onclick="del('${bvo.id }');">D e l e t e</button>					
					<button class="small" type="button" onclick="modify('${bvo.id }');">M o d i f y</button>
				</div>
			</div>
			<hr />
			</c:forEach>
		</div>		
	</div>
</body>
</html>