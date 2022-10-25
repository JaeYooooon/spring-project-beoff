<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- 로그인한 사용자 정보 Authentication 객체의 필요한 property 들을 변수에 담아 사용 가능  --%>
<sec:authentication property="name" var="username"/>  
<sec:authentication property="authorities" var="authorities"/> 
<sec:authentication property="principal" var="userdetails"/>   
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />
    </head>
   
    <body class="d-flex flex-column h-100">
    <%-- 인증 헤더 --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <form name="frm" action="updateOk" method="post" enctype="Multipart/form-data">
        <main class="flex-shrink-0">
            <!-- Hotel Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h3 class="display-6 fw-bolder text-white mb-2 ">HOTEL - Update Page</h3>
                                <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
                            </div>
                        </div>
                    </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                    	<div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                            <input type="hidden" name="id" value="${hotel.id }">
                            	<h3 class="display-7 fw-bolder text-white mb-2 ">Username</h3>
                            	<input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="username" value="${username}" name="username" readonly>
                           
                            	<h3 class="display-7 fw-bolder text-white mb-2 ">Hotel Name</h3>
                            	<input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="hotelname" value="${hotel.hotelname }" name="hotelname" required>
                                <h3 class="display-7 fw-bolder text-white mb-2 ">Hotel Region</h3>
                             
                                <!-- 체크용 <script>console.log("${regionList}")</script>  -->
                                <select name="region">
                                	<c:forEach var="r" items="${regionList }">
                                		<c:choose>
                                			<c:when test="${r == hotel.region.region }">
                                				<option value="${r }" selected>${r }</option>
                                			</c:when>
                                			<c:otherwise>
                                				<option value="${r }">${r }</option>
                                			</c:otherwise>
                                		</c:choose> 
                                	</c:forEach>
                                </select>
                                <h3 class="display-7 fw-bolder text-white mb-2 ">Hotel Content</h3>
                                <input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="content" value="${hotel.content }" name="content" required>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <button class="btn btn-outline-dark">수정완료</button>
                                    <a class="btn btn-outline-dark" href="delete">삭제</a>
                                </div>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
         </main>   
     </form>
            <!-- Room Header-->
            <header class="bg-write py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h3 class="display-6 fw-bolder text-black mb-2 ">ROOM - Update Page</h3>
                                <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
                            </div>
                        </div>
                    </div>
                    	<c:forEach var="r" items="${hotel.rooms }">
            			<form name="frm" action="updateOk" method="post" enctype="Multipart/form-data">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                            	<h3 class="display-7 fw-bolder text-black mb-2 ">Room Name</h3>
                            	<input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="roomname" value="${r.roomname}" name="roomname" required>
                                <h3 class="display-7 fw-bolder text-black mb-2 ">Room Price</h3>
                                <input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="price" value="${r.price }" name="price" required>
                                <h3 class="display-7 fw-bolder text-black mb-2 ">Room bed</h3>
                                <input type="text" class="form-control display-5 fw-bolder text-black mb-3"  id="bed" value="${r.bed }" name="bed" required>
                    			<input type="hidden" name="id" value="${r.id }">
                    			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <button class="btn btn-outline-dark">수정완료</button>
                                    <a class="btn btn-outline-dark" href="delete">삭제</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                        </form>        
                        </c:forEach>
                    </div>
                </div>
            </header>
   		
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
