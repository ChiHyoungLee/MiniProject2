<%@page import="java.sql.Timestamp"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE jsp>
<jsp lang="en">

<head>
<title>AND Yummy :: Board</title>
<meta charset="utf-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="../assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">


<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/templatemo.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../assets/css/fontawesome.min.css">
<!--  <link rel="stylesheet" href="../bootstrap_3.1.1/css/bootstrap.css"> -->

</head>

<body>


	<!-- Start Top Nav -->
	<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:kisj20@naver.com">kisj20@naver.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-2929-1639">010-2992-1639</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo"
						target="_blank" rel="sponsored"><i
						class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a
						class="text-light" href="https://www.instagram.com/"
						target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light"
						href="https://www.linkedin.com/" target="_blank"><i
						class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="../index.jsp"> AND Yummy </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="../team/team.jsp">Team</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../restaurant/restaurant.jsp">Restaurant</a></li>
						<li class="nav-item"><a class="nav-link" href="board.jsp">Board</a>
						</li>

					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>

					<!--<a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a> 
                    
                      <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    -->
					<ul >
                     <c:choose>
                     <c:when test="${empty sessionId}">
                        <a class="nav-icon position-relative text-decoration-none" href="../login/login.jsp">
                     </c:when>
                     <c:otherwise>
                        <a class="nav-icon position-relative text-decoration-none" href="../login/updateMember.jsp">
                     </c:otherwise>
                     </c:choose>
                  </ul>
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                           <c:choose>
                     <c:when test="${empty sessionId}">
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><a href="../login/login.jsp">login</a></span>
                     </c:when>
                     <c:otherwise>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><a href="../login/logoutMember.jsp">logout</a></span>
                     </c:otherwise>
                     </c:choose>
                
				</div>
			</div>

		</div>
	</nav>

	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>

	<!-- board start -->

	<%
	//로긴 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	String userID = null;
	if (session.getAttribute("sessionId") != null) {
		userID = (String) session.getAttribute("sessionId");
	}
	int pageNumber = 1; //기본 페이지 넘버

	//페이지 넘버값이 있을때
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1ps solid #dddddd">
				<thead>
					<tr>
						<!--   <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						
						for (int i = 0; i < list.size(); i++) {
							
					%>
					<tr>
						<!--  <td><%=list.get(i).getBbsID()%></td>-->
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
						<%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		
		<!-- 페이지 넘기기 -->
		<%
		if (pageNumber != 1) {
		%>
		<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
			class="btn btn-success btn-arrow-left">이전</a>
		<%
		}
		if (bbsDAO.nextPage(pageNumber)) {
		%>
		<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
			class="btn btn-success btn-arrow-left">다음</a>
		<%
		}
		%>
		<!-- 회원만 넘어가도록 -->
		<%
		//if logined userID라는 변수에 해당 아이다가 담기고 if not null
		if (session.getAttribute("sessionId") != null) {
		%>
		<a href="write.jsp" class=" btn btn-primary full-right">글쓰기</a>
		<%
		} else {
		%>
		<button class="btn btn-primary pull-right"
			onclick="if(confirm('로그인 하세요'))location.href='../login/login.jsp';"
			type="button">글쓰기</button>
		<%
		}
		%>
	</div>

	<!-- Start Footer -->
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">AND
						Yummy</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> 안동대학교 인공지능 1팀
							프로젝트</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-4636-2017">민성준
								010-4636-2017</a></li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-2992-1639">김상준
								010-2992-1639</a></li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-3453-6220">김은철
								010-3453-6220</a></li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-4532-7911">이치형
								010-4532-7911</a></li>

						<!--  
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:kisj20@naver.com">kisj20@naver.com</a>
                        </li>
                        -->
					</ul>
				</div>
				<!-- 
                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                        <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                        <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
                    </ul>
                </div>
                -->

			</div>

			<div class="row text-light mb-4">
				<div class="col-12 mb-3">
					<div class="w-100 my-3 border-top border-light"></div>
				</div>
				<div class="col-auto me-auto">
					<ul class="list-inline text-left footer-icons">
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="http://facebook.com/"><i
								class="fab fa-facebook-f fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.instagram.com/"><i
								class="fab fa-instagram fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://twitter.com/"><i
								class="fab fa-twitter fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.linkedin.com/"><i
								class="fab fa-linkedin fa-lg fa-fw"></i></a>
						</li>
					</ul>
				</div>
				<!--
                  
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div> -->
			</div>
		</div>

		<div class="w-100 bg-black py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2021 Project 1 Team | Designed by <a
								rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="../assets/js/jquery-1.11.0.min.js"></script>
	<script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="../assets/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/templatemo.js"></script>
	<script src="../assets/js/custom.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- End Script -->
</body>

</jsp>