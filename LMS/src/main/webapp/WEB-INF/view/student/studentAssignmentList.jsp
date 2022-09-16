<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">"이름"님 /</span>${map.lectureName}
		</h4>
		
		<!-- studentLectureMenu -->
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-user me-1"></i>
					강의홈
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-bell me-1"></i> 
					강의공지사항
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					질문게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="${pageContext.request.contextPath}/student/studentAssignmentList?openedLecNo=${map.openedLecNo}">
				<i class="bx bx-link-alt me-1"></i> 
					과제게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					강의출석
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					강의시험
				</a>
			</li>
		</ul>
		<hr class="my-5" />
		
		<!-- studentLectureOne -->
		<!-- studentLectureList -->
		<div class="card text-center">
			<h5 class="card-header">과제게시판</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Assignment</caption>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">과제명</th>
							<th width="10%">등록</th>
							<th width="10%">평가</th>
							<th width="20%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="10%"><strong>123</strong></td>
							<td width="50%">김첨지</td>
							<td width="10%"><span class="badge bg-label-secondary me-1">N</span></td>
							<td width="10%"><span class="badge bg-label-secondary me-1">N</span></td>
							<td width="20%">2150-10-32</td>
						</tr>
						<c:forEach var="s" items="${list}">
							<tr>
								<td><strong>123</strong></td>
								<td>김첨지</td>
								<td><span class="badge bg-label-primary me-1">N</span></td>
								<td><span class="badge bg-label-secondary me-1">N</span></td>
								<td>2150-10-32</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
