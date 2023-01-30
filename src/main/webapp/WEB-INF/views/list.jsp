<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/daterangepicker.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
<title>식당 리스트</title>
</head>
<body>
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

<!-- 테이블 -->
<div class="hero">
	<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="intro-wrap">
						<h1 class="mb-5"><span class="d-block">Let's Enjoy Your</span> Taste In Gwangju</h1> 
					</div>
				</div>
				<div class="col-lg-5">
					<div class="slides">
						<img src="images/rest.jpg" alt="Image" class="img-fluid active">
					</div>
				</div>
			</div>
		</div>
     </div>
     
     <div class="untree_co-section">
       <!-- Bootstrap Dark Table -->
       <div class="container" >
       <table> 
		 	<tr>
			<th style="padding-right: 10px; width:15%">
			 <select class="form-control form-cotrol-sm" name="searchType" id="searchType">
						<option value="resturantName">식당</option>
						<option value="loadaddress">주소</option>
			</select>
			</th>
			
			<th style="padding-right: 10px; width: 50%;">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</th>
			
			<th style="text-align:left; width:10%;">
				<button class="btn btn-success" name="btnSearch" id="btnSearch" onclick="btnSearch" style="padding: 10px;"  >
				검색</button>
			</th>
			<th>
				<form action="/excelDown.do" method="post" style="width:20%">
		         	 <c:forEach var="list" items="${list }" varStatus="loop">
		         		  <input type="hidden" class="form-control" id=resturantName name="resturantName" value=${list.bisinessNumber } />
			              <input type="hidden" class="form-control" id=address name="address" value=${list.businessName } />
			              <input type="hidden" class="form-control" id=restPhone name="restPhone" value=${list.branchName } />
			              <input type="hidden" class="form-control" id=restSector name="restSector" value=${list.bigBusinessCode } />
		         	 </c:forEach>
		         	 <input type="submit" class="btn btn-primary" value="Excel">
		        </form>
			</th>
			</tr>
		</table>
		
		</div>
		<p>
       
       <div class="container">
       <div class="card ">
       
         <h5 class="card-header bg-primary text-white">식당 리스트</h5>
         <div class="table-responsive text-nowrap">
           <table class="table card-table">
             <thead>
               <tr>
                 <th>식당</th>
                 <th>업종</th>
                 <th>업종명</th>
                 <th>지번주소</th>
               </tr>
             </thead>
             <c:forEach var="list" items="${list }" varStatus="loop">
             <tbody class="table-border-bottom-0">
               <tr>
                 <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${list.bisinessNumber}</strong></td>
                 <td>${list.businessName }</td>
                 <td>${list.branchName }</td>
                 <td>${list.bigBusinessCode}</td>
               </tr>
             </tbody>
            </c:forEach>
           </table>
          
         </div>
       </div> 
       </div>
       <!--/ Bootstrap Dark Table -->
       

     
     
     
     
     <div class="site-footer">
		<div class="inner first">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<h3 class="heading">Gwangju Donggu</h3>
							<p>광주 동구 식당 리스트</p>
						</div>
					</div>
			
					<div class="col-md-6 col-lg-4">
						<div class="widget">
							<h3 class="heading">Contact</h3>
							<ul class="list-unstyled quick-info links">
								<li class="email">jjh@beftech.co.kr</li>
								<li class="phone">010-9323-1530</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>

	<script src="js/typed.js"></script>

	<script src="js/custom.js"></script>
	</body>
	
	<script>
function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
	
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "/list.do";
	url += "?page=" + page;
	url += "&range=" + range;
	url += "&listSize=" + listSize;
	url += "&searchType=" + searchType;
	url += "&keyword=" + keyword;
	location.href= url;
}

function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
	var url = "/list.do";
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&listSize=" + listSize;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		location.href= url;
}

function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
	
	var page = parseInt((range * rangeSize)) +1;
	var range = parseInt(range) +1;
	var url = "/list.do";
	url += "?page=" + page;
	url += "&range=" + range;
	url += "&listSize=" + listSize;
	url += "&searchType=" + searchType;
	url += "&keyword=" + keyword;
	location.href= url;
}
$(document).on('click','#btnSearch',function(e){
	e.preventDefault();
	var url = "/list.do";
	url += "?searchType=" + $('#searchType').val();
	url += "&keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});
</script>

	
	
</html>
