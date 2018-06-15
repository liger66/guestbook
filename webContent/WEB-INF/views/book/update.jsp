<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update title</title>
<link rel="stylesheet" href="/ch18_guestbook/css/style.css" />

<style>
	button.small{
		width: 20%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function check() {
		if ($("#name").val() == "") {
			alert("이름을 입력 하세요.");
			$("#name").focus();
			return;
		}
		
		if ($("#password").val() == "") {
			alert("비밀번호를 입력 하세요.");
			$("#password").focus();
			return;
		}
		
		$("#update_form").submit();
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title">Update Comment</h1>
		</div>
		<hr />
		<div class="content">
			<form action="${pageContext.request.contextPath}/book/update" 
				  id="update_form" method="post">
				<%-- <input type="text" name="id" value="${bvo.id }" /> --%>
				<table class="table_mod">
					<tr>
						<th>Name</th>
						<td>
							<input id="name" type="text" name="writer" value="${bvo.writer }"/>
						</td>
					</tr>
					<tr>
						<th>Password</th>
						<td>
							<input id="password" type="password" name="password" value="${bvo.password }"/>
						</td>
					</tr>					
					<tr>
						<th>Comment</th>
						<td>
							<textarea name="msg" cols="40" rows="2">${bvo.msg }</textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<hr />
		<div class="footer text_center">
			<button class="small" type="button" onclick="check();">수정</button>
			<button class="small" type="button" onclick="history.back();">취소</button>
		</div>	
		
	</div>
</body>
</html>