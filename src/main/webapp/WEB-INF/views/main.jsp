<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap icons-->
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
                            <form class="form-subscribe" id ="frm" method="post" action="list.do" ><!--  -->
                                <!-- Email address input-->
                                <div class="row">
                                    <div class="col">
                                        <input class="form-control" id="keyword1" name="keyword1"type="text" placeholder="상호명"/><p></p>
                                        <input class="form-control" id="keyword2" name="keyword2" type="text" placeholder="주소"/><p></p>
                                        <input class="form-control" id="keyword3" name="keyword3" type="text" placeholder="대분류 업종"/><p></p>
                                        <input class="form-control" id="keyword4" name="keyword4" type="text" placeholder="중분류 업종"/><p></p>
                                        <input class="form-control" id="keyword5" name="keyword5" type="text" placeholder="소분류 업종"/><p></p>
                                    </div>
                                    <div class="col-auto"><button class="btn btn-primary" id="btnSearch"  type="button" >Submit</button></div> 
                                    <!-- <div class="col-auto"><button class="btn btn-primary"  type="submit" >Submit</button></div>  --> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </header>
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
$(document).on('click','#btnSearch',function(e){
	
	e.preventDefault();
	var url = "/list.do";
	url += "?keyword1=" + $('#keyword1').val();
	url += "&keyword2=" + $('#keyword2').val();
	url += "&keyword3=" + $('#keyword3').val();
	url += "&keyword4=" + $('#keyword4').val();
	url += "&keyword5=" + $('#keyword5').val();
	location.href = url;
	console.log(url);

});


</script>
</html>
