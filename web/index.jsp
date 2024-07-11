<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이리얼트립 :: 나다운 진짜 여행</title>
</head>
<body>
<!-- 최초 실행 장소입니다. 여기서 실행하면 프론트컨트롤러로 이동됩니다. -->
<h2>알 수 없는 오류</h2>
<span>다시 시도해주세요</span>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<a href="${cp}/user/UserJoin.us">회원가입</a>
<a href="${cp}/user/UserLogin.us">로그인 </a>
</body>
</html>