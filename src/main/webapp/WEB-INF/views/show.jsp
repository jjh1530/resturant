<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<title>식당 리스트</title>
</head>
<body>
	 <!-- Navigation-->
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
         <div class="container px-5">
             <a class="navbar-brand" href="index.html">BTFTech</a>
             <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                     <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="list.do">List</a></li>
                 </ul>
             </div>
         </div>
     </nav>
     
      <!-- Masthead-->
        <header class="masthead">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-white">
                            <!-- Page heading-->
                            <h1 class="mb-5">상호 검색</h1>
                            <form class="form-subscribe" action="/shop.do" method="post" >
                                <!-- Email address input-->
                                <div class="row">
                                    <div class="col">
                                        <input class="form-control" id="eventNm" name="eventNm"type="text" placeholder="쇼 명"/><p></p>
                                    </div>
                                    <div class="col-auto"><button class="btn btn-primary" type="submit" >Submit</button></div> 
                                    <!-- <div class="col-auto"><button class="btn btn-primary"  type="submit" >Submit</button></div>  --> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </header>

		<section class="testimonials text-center bg-light">
        <div class="container">
             <!-- Page Heading -->
             <h1 class="h3 mb-2 text-gray-800">리스트</h1>
             <div class="card shadow mb-4">
                 <div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                 </div>
                 <div class="card-body">
                     <div class="table-responsive">
                         <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                             <thead>
                                 <tr>
                                     <th>공연명</th>
					                 <th>공연장소</th>
					                 <th>무료유무</th>
                                 </tr>
                             </thead>
                             <tbody>
                             
                               <c:forEach var="result" items="${list }" varStatus="loop">
                                 <tr>
                                     <td><button class="btn btn-primary btn-sm" onclick="location='/apiDetail.do?id=${result.id }&eventNm=${result.eventNm }'">${result.eventNm }</button></td>
					                 <td>${result.addrRoad }</td>
					                 <td>${result.payYn }</td>
                                 </tr>
                               </c:forEach>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>

         </div>
			<!-- 페이징 -->
		<div id ="paginationBox" class="text-center">
			<ul class="pagination" style="justify-content: center; ">
			
				<c:if test="${pagination.prev }">
					<li class="page-item"><a class="page-link" href="#" 
					onclick="fn_prev('${pagination.page }','${pagination.range }', '${pagination.rangeSize }','${pagination.listSize }'
					, '${search.keyword1}', '${search.keyword2}', '${search.keyword3}', '${search.keyword4}', '${search.keyword5}')">이전</a>
				</c:if>
				<c:forEach begin="${pagination.startPage }" end="${pagination.endPage}" var="count">
					<li class="page-item <c:out value="${pagination.page ==  count ? 'active' : ''}"/> ">
					<a class="page-link" href="#" 
						onclick="fn_pagination('${count	 }', '${pagination.range }','${paginationf.rangeSize }',
						'${pagination.listSize }','${search.keyword1 }', '${search.keyword2}', '${search.keyword3}', '${search.keyword4}', '${search.keyword5}')">
						${count}</a></li>
				</c:forEach>	
				
				<c:if test="${pagination.next }">
					<li class="page-item"><a class="page-link" href="#" 
					onclick="fn_next('${pagination.page }','${pagination.range }', '${pagination.rangeSize }',
						'${pagination.listSize }', '${search.keyword1}', '${search.keyword2}', '${search.keyword3}', '${search.keyword4}', '${search.keyword5}')">다음</a>
					</li>
				</c:if>
			
			</ul>
		</div> 
	<!-- 페이징 종료 -->
       </section>
       
       
        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">
                            <li class="list-inline-item"><a href="#!">About</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Contact</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2022. All Rights Reserved.</p>
                    </div>
                   
                </div>
            </div>
        </footer>

<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="resources/js/jquery-3.4.1.min.js"></script>
	</body>
<script>

function btnSearch() {
	
	var eventNm = $("#eventNm").val();
	location.href="shop.do";
	/*
	$.ajax({
		url: "shop.do",
		type: "post",
		data : {"eventNm" : eventNm},
		datatype : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : location="show.do",
		error :function() {alert("error");}
	});*/
	
}
	
</script>
</html>
