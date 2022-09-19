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
				<a class="nav-link active" href="">
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
				<a class="nav-link" href="${pageContext.request.contextPath}/student/studentAssignmentList?openedLecNo=${map.openedLecNo}">
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
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>${map.lectureName}</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
						<tr>
							<th>담당교수</th>
							<td>${map.professorName}</td>
							<th>교과구분</th>
							<td>${map.lectureType}</td>
							<th>이수학점</th>
							<td>${map.credit}</td>
						</tr>
						<tr>
							<th>개설학부</th>
							<td>${map.departmentName}</td>
							<th>개설년도</th>
							<td>${map.lectureYear}</td>
							<th>개설학기</th>
							<td>${map.lectureSemester}</td>
						</tr>
						<tr>
							<th>강의장소</th>
							<td>${map.lecClassroom}</td>
							<th>강의정원</th>
							<td>${map.studentNum}</td>
							<th>신청인원</th>
							<td>????</td>							
						</tr>
						<tr>
							<th>강의계획서</th>
							<td colspan="5"><textarea class="form-control" rows="20px" readonly="readonly" style="background-color:#fff;">${map.syllabus}</textarea></td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>