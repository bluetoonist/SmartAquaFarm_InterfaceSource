<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<%
	String farmid = request.getParameter("farmid");
	System.out.println("farmid : "+ farmid);
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css?h=a0c69c2ee60d5a7f34c321b94a34e501">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css?h=06ed58a0080308e1635633c2fd9a56a3">
    <link rel="stylesheet" href="../../common/assets/css/Header-Blue.css?h=7fad78607ce59d50c5d9dc2f028b4b7b">
    <link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css?h=d014ac7b8d4b9b6c8b9646f2e2315bc5">
    <link rel="stylesheet" href="../../common/assets/css/untitled.css?h=50a8e9fe65cba9461984a61467997ba4">
</head>

<body id="page-top">
    <nav class="navbar navbar-light navbar-expand bg-white shadow topbar static-top">
        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
            <h3 class="text-dark ml-4 mt-2 navbar-brand"><strong>SmartAquaFarm&nbsp;</strong></h3>
            <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                    <div class="input-group-append"></div>
                </div>
            </form>
            <ul class="nav navbar-nav flex-nowrap ml-auto">
                <li class="nav-item dropdown no-arrow mx-1" role="presentation"></li>
                <li class="nav-item dropdown no-arrow mx-1" role="presentation">
                    <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                </li>
                <div class="d-none d-sm-block topbar-divider"></div>
                <li class="nav-item dropdown no-arrow" role="presentation">
                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">sysadmin</span><img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg?h=0ecc82101fb9a10ca459432faa8c0656"></a>
                        <div
                            class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="userInfo.html"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;회원 정보</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;로그아웃</a></div>
        </div>
        </li>
        </ul>
        </div>
    </nav>
    <div id="wrapper">
        <nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198,43,43);">
            <div class="container-fluid d-flex flex-column p-0">
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="../main/index.jsp"><i class="fas fa-tachometer-alt"></i><span>모니터링</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="상태기준정보.html"><i class="fas fa-table"></i><span>상태 기준 정보</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="상태기록검색.html"><i class="fas fa-th-list"></i><span>상태 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="조치기록등록.html"><i class="fas fa-record-vinyl"></i><span>조치 기록</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="register.html"><i class="fas fa-chart-bar"></i><span>통계</span></a><a class="nav-link" href="create-1.html"><i class="fas fa-tint"></i><span>양식장 정보 관리</span></a><a class="nav-link" href="farmwtUpdateForm.html"><i class="fas fa-water"></i><span>수조 정보</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div class="text-center" id="content">
                <!-- Start: 양식장이름 -->
                <div class="container-fluid">
                    <h2 class="mt-5"><strong>무안수산</strong></h2>
                </div>
                <!-- End: 양식장이름 -->
                <!-- Start: 검색부분 -->
                <div class="container mt-4 mb-4">
                    <form>
                        <div class="form-row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-3 row-cols-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center">
                            <div class="col-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center"><label style="width: 150px;margin-top: 4px;"><strong>수조명&nbsp;</strong></label><input class="form-control form-control-sm mr-2" type="text"></div>
                            <div class="col-xl-3 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center"><label style="width: 130px;margin-top: 4px;"><strong>&nbsp; &nbsp;어종&nbsp;</strong></label><input class="form-control form-control-sm mr-2" type="text"></div>
                            <div class="col-xl-4 d-flex d-sm-flex d-md-flex d-lg-flex d-xl-flex justify-content-center justify-content-sm-center justify-content-md-center justify-content-lg-center justify-content-xl-center"><label style="width: 299px;margin-top: 4px;"><strong>측정기간&nbsp;</strong></label><select class="form-control form-control-sm"><optgroup label="This is a group"><option value="12" selected="">---- -- --</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select><span><strong>&nbsp;~&nbsp;</strong></span>
                                <select
                                    class="form-control form-control-sm mr-2">
                                    <optgroup label="This is a group">
                                        <option value="12" selected="">---- -- --</option>
                                        <option value="13">This is item 2</option>
                                        <option value="14">This is item 3</option>
                                    </optgroup>
                                    </select>
                            </div>
                            <div class="col-xl-1 text-center" style="margin: 0px;margin-bottom: 0px;margin-top: 0px;padding-right: 5px;margin-right: 0px;"><button class="btn btn-primary btn-sm" type="button" style="width: 60px;">조회</button></div>
                        </div>
                    </form>
                </div>
                <!-- End: 검색부분 -->
                <!-- Start: 테이블 -->
                <div class="container">
                    <div class="table-responsive table-bordered" style="height: 239px;">
                        <table class="table table-bordered">
                            <tbody class="shadow-sm">
                                <tr class="table-primary">
                                    <td class="text-dark"><strong>측정일시</strong></td>
                                    <td class="text-dark"><strong>수조이름</strong></td>
                                    <td class="text-dark"><strong>어종</strong></td>
                                    <td class="text-dark"><strong>상태</strong></td>
                                    <td class="text-dark"><strong>DO</strong><br><strong>(mg/L)</strong></td>
                                    <td class="text-dark"><strong>수온</strong></td>
                                    <td class="text-dark"><strong>염도</strong><br><strong>(psu)</strong></td>
                                    <td class="text-dark"><strong>pH</strong></td>
                                    <td class="text-dark"><strong>NH4</strong><br><strong>(mg/L)</strong></td>
                                    <td class="text-dark"><strong>NO2</strong><br><strong>(mg/L)</strong></td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                                <tr>
                                    <td>Cell 3</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                    <td>Cell 4</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End: 테이블 -->
            </div>
            <footer class="bg-white d-xl-flex align-items-xl-end sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Mokpo National University&nbsp; 2020</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="../../common/assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="../../common/assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../common/assets/js/theme.js?h=6d33b44a6dcb451ae1ea7efc7b5c5e30"></script>
</body>

</html>