<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ch18_guestbook/css/style.css" />

<style>
	button.small{
		width: 20%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function add() {
		$("#add_form").submit();
	}
	
	function dualCheck() {
		var name = $('#name').val();		
		var xhr = new XMLHttpRequest();		
		var url = "${pageContext.request.contextPath}/book/dualCheck";
		var param = "writer=" + name;
		
		xhr.open("GET", url + "?writer=" + name, true);  // true : 비동기 통신일때
		// get 방식일때는 생략 가능
		//xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		xhr.send(param);
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var cnt = xhr.responseText;
				
				if (cnt > 0) {
					alert (cnt + " 건의 방명록이 있어요.");
				} else {
					alert ("첫방문 환영 합니다");
				}
			} 
		} 
	}
	
	
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title">Add Comment</h1>
		</div>
		<hr />
		<div class="content">
			<form:form action="${pageContext.request.contextPath}/book/add" 
				  id="add_form" method="post" modelAttribute="bookVo">
				<table class="table_add">
					<tr>
						<th>Name</th>
						<td>
							<form:input id="name" type="text" path="writer" />
							<button type="button" onclick="dualCheck();">중복확인</button>
							<form:errors path="writer" class="error"/>
						</td>
					</tr>
					<tr>
						<th>Password</th>
						<td>
							<form:password id="password" path="password" />
							<form:errors path="password" class="error"/>
						</td>
					</tr>					
					<tr>
						<th>Comment</th>
						<td>
							<form:textarea path="msg" cols="40" rows="2"></form:textarea>
							<form:errors path="msg" class="error"/>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<hr />
		<div class="footer text_center">
			<button class="small" type="button" onclick="add();">등록</button>
			<button class="small" type="button" onclick="history.back();">취소</button>
		</div>	
		
	</div>
</body>
</html>