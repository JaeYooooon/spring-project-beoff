<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>rental cars list</title>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10"></div>
			<div class="col-lg-2">
				<a class="btn btn-secondary btn-lg" href="carWrite">차등록</a>
			</div>
		</div>
	</div>

	<c:forEach var="c" items="${r.cars}"> 
<%-- 	<input type="hidden" name="rentalId" value="${c.id }"> --%>
		<div class="container py-5">
			<div class="row">
				<div class="col-md-12 col-lg-4 mb-4 mb-lg-0">
					<div class="card text-black">
						<img class="card-img-top"
							src="${pageContext.request.contextPath }/upload/${c.files[0].file}"
							alt="..." />
						<div class="card-body">
							<div class="text-center mt-1">
								<h4 class="card-title">${c.carname }</h4>
							</div>

							<div class="d-flex flex-row">
								<a class="btn btn-secondary btn-lg"
									href="rentalUpdate?id=${c.id }">수정</a>
								<a class="btn btn-secondary btn-lg"
									href="rentalUpdate?id=${c.id }">삭제</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>