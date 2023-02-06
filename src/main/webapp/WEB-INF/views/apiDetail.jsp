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
     
     <div class="container">
     	<p>
     	 <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"></h1>
            <input type="hidden" id="lat" value="${vo.lat }"/>
            <input type="hidden" id="lon" value="${vo.lng }"/>
        </div>

        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">상업 번호</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${vo.eventNm }</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">주소</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${vo.addrRoad }</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">업종</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">시작일 : ${vo.eventBeginDate }<br>종료일 : ${vo.eventEndDate }</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">상세 업종</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${vo.payYn }</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
     	<div class="col-lg-3">
				<div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
                        ${vo.price }
                     </div>
                 </div>
			</div>
			<div class="col-lg-3">
				<div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
						${vo.enterAge }
                     </div>
                 </div>
			</div>
			<div class="col-lg-3">
				<div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
						${vo.parkingLotAvail }
                     </div>
                 </div>
			</div>
			<div class="col-lg-3">
				<div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
                         This card uses Bootstrap's default styling with no utility classes added. Global
                         styles are the only things modifying the look and feel of this default card example.
                     </div>
                 </div>
			</div>
		<div class="row">
		
           <div class="col-lg-6">

                 <!-- Default Card Example -->
                 <div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
                         ${vo.eventInfo }
                     </div>
                 </div>

                 <!-- Basic Card Example -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">Basic Card Example</h6>
                     </div>
                     <div class="card-body">
                         ${vo.notice }
                     </div>
                 </div>

             </div>

             <div class="col-lg-6">
                 <div class="card mb-4">
                     <div class="card-header">
                         Default Card Example
                     </div>
                     <div class="card-body">
                         This card uses Bootstrap's default styling with no utility classes added. Global
                         styles are the only things modifying the look and feel of this default card example.
                     </div>
                 </div>

                 <!-- Basic Card Example -->
                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                         <h6 class="m-0 font-weight-bold text-primary">Basic Card Example</h6>
                     </div>
                     <div class="card-body">
                         The styling for this basic card example is created by using default Bootstrap
                         utility classes. By using utility classes, the style of the card component can be
                         easily modified with no need for any custom CSS!
                     </div>
                 </div>
             </div>
         </div>
       </div>
       
		 <div id="staticMap" style="width:100%;height:350px;"></div>
     </div>
     
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5db2b706f7f6e0d8ea554337463adfcf"></script>
<script>
var lat = $.trim($("#lat").val());
var lan = $.trim($("#lon").val());
var markerPosition  = new kakao.maps.LatLng(lat, lan); 
var marker = {
	    position: markerPosition
	};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
staticMapOption = { 
    center: new kakao.maps.LatLng(lat, lan), // 이미지 지도의 중심좌표
    level: 3, // 이미지 지도의 확대 레벨
    marker: marker // 이미지 지도에 표시할 마커 
};    

//이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</html>
