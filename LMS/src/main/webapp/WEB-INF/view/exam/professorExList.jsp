<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Main -->
<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			<div class="col-sm-3 col-12"></div>
			<div class="col-sm-6 col-12 text-center">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/professor/professorLectureList?memberCode=${memberCode}" style="float: right;">
					강의리스트
				</a>
			</div>
		</div>
		<!-- lectureMenu -->
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의상세
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						강의출석
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>
						<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">
					<i class="bx bx-link-alt me-1"></i> 
						강의시험
					</a>
				</li>
			</ul>
		</div>
		<hr class="my-5" />	


	<!-- professor Example List -->
	<div class="card">
		<h5 class="card-header">시험지 목록</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
				<caption class="ms-4">Example ${memberType}.Ver/ 안녕하세요.
					${memberName}님!</caption>
				<thead>
					<tr>
						
						<th>시험지번호</th>
						<th>시험지이름</th>
						<th>등록일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${Exlist}">
						<input type="hidden" value=${openedLecNo } name="openedLecNo">
						<c:if test="${e.openedLecNo eq openedLecNo}">
						<tr>
							<td>${e.examNo}</td>
							<td><a
								href="${pageContext.request.contextPath}/exam/professorExList/${e.examNo}">
									${e.examName}</a></td>
							<td>${e.createDate}</td>
							<td>${e.updateDate}</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<hr>

	 <a	href="${pageContext.request.contextPath}/exam/AddExamSheet?opendLecNo=${openedLecNo}"
		style="float: right" class="btn btn-primary">시험지추가(교수)</a>

</div>

<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
<script>
	function deleteBtn() {
		alert("삭제되었습니다.");
		document.form.submit();
	}
</script>

