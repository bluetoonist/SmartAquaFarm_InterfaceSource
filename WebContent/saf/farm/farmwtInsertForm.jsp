<%@ page import="farm.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!-- bean setup  -->
<jsp:useBean id="user_dto" scope="page" class="user.usertableDTO" />
<jsp:useBean id="user_dao" scope="page" class="user.usertableDAO" />

<jsp:useBean id="farm_dto" scope="page" class="farm.farmDTO" />
<jsp:useBean id="farm_dao" scope="page" class="farm.farmDAO" />


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>����Ʈ �����</title>
<link rel="stylesheet" href="../../common/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="../../common/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="../../common/assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="../../common/assets/css/untitled.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">

</head>

<body id="page-top">
	<%
		request.setCharacterEncoding("UTF-8");
		/* farmDAO ��ü ���� */
		farmDAO farmdao_obj = new farmDAO();
		ArrayList<farmDTO> farmnamelist =null;
		
		
		/* Session Infor*/
		String user_id = (String) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		String user_auth = (String) session.getAttribute("userAuth");
	
		// ������Ʈ�� farmid
		String Farmid = request.getParameter("farmid");
		
		// ������ ����� ID
		int FarmID;
		
		// Farmid�� null�̸� index.jsp �������� �̵�
		if (Farmid == null) {
			
			%>
				<script>
				alert("����� ���̵� �Է��ϼ���");
				location.href = "../main/index.jsp";
				</script>
			<%
			
			
		// �� �ۿ� Farmid�� ���ڷ� ��ȯ
		} else {
			FarmID = Integer.parseInt(Farmid);
		}
		
		farmnamelist = farmdao_obj.farmSelect(Farmid);
		System.out.println(farmnamelist);
		
	%>

	<div id="wrapper">
		<nav class="navbar navbar-dark bg-success align-items-start sidebar sidebar-dark bg-gradient-primary accordion p-0" style="background-color: rgb(198, 43, 43);">
			<div class="container-fluid d-flex flex-column p-0">
				<a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-fish"></i>
					</div>
					
					<div class="sidebar-brand-text mx-3">
						<span class="text-monospace">sMART AQUA FARM</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				
				<% if(user_auth.equals("sysadmin")){ %>
				<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="../main/index.jsp">
						<i class="fas fa-tachometer-alt"></i>
						<span>����͸�</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>���� ���� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>���� ���</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>��ġ ���</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>���</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>����� ���� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link" onclick="waterTank()">
						<i class="fas fa-water">
						</i><span>���� ����</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
				
				
				
				<% } else if(user_auth.equals("admin")) { %>
					
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="index.html">
						<i class="fas fa-tachometer-alt"></i>
						<span>����͸�</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>���� ���� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>���� ���</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>��ġ ���</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>���</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>����� ���� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link active" href="../farm/farmwtSearch.jsp">
						<i class="fas fa-water">
						</i><span>���� ����</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
					
				<% } else { %>
				
					<!-- Navigator Menu -->
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">
						<i class="fas fa-tachometer-alt"></i>
						<span>����͸�</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="profile.html">
						<i class="fas fa-table"></i>
						<span>���� ���� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="table.html">
						<i class="fas fa-th-list"></i>
						<span>���� ���</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="login.html">
						<i class="fas fa-record-vinyl"></i>
						<span>��ġ ���</span>
						</a>
					</li>
					
					
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-chart-bar"></i>
						<span>���</span></a>
					</li>
						
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="register.html">
						<i class="fas fa-tint">
						</i><span>����� ����</span>
						</a>
					</li>
					
					<li class="nav-item" role="presentation">				
						<a class="nav-link" href="../farm/farmwtSearch.jsp">
						<i class="fas fa-water">
						</i><span>���� ����</span>
						</a>
					</li>
					
				</ul>
				<!--  End Menu Navigator -->
					
				
				
				<% } %>
				
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
				</div>
			</div>
		</nav>
		
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<!-- ��� -->
				<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						
						<!--  ��� ������ ���� -->
						<h3 class="text-dark mb-0 navbar-brand">
							<strong>��������</strong>
						</h3>
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
							
							
							<!--  USER Management  -->
							<li class="nav-item dropdown no-arrow" role="presentation">
								<div class="nav-item dropdown no-arrow"> <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
									<span class="d-none d-lg-inline mr-2 text-gray-600 small"><%=user_name %></span>
									<img class="border rounded-circle img-profile" src="../../common/assets/img/avatars/avatar1.jpeg"></a>
									
									<div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
										<a class="dropdown-item" role="presentation" href="../user/userInfo.jsp">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;ȸ�� ����</a>
										
										<div class="dropdown-divider"></div> <a class="dropdown-item" role="presentation" href="../auth/logoutPrc.jsp">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;�α׾ƿ�</a>
									</div>
								</div>						
							</li>							
						</ul>
						
					</div>
				</nav>
				
				            <div class="container-fluid text-center">
                <div class="table-responsive table-bordered">
                    <table class="table table-bordered">
                        <thead>
                            <tr></tr>
                        </thead>
                        <tbody>
                            <tr></tr>
                            <tr>
                                <td class="table-primary border rounded-0" rowspan="1" colspan="2"><strong>������ȣ</strong></td>
                                <td rowspan="1" colspan="2"><br></td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>����</strong></td>
                                <td class="flex-shrink-0"><select class="form-control-sm pl-2" style="padding-right: 0;padding-left: 0;padding-bottom: 0;padding-top: 1;margin-left: -80px;margin-right: -80px;"><optgroup label="������ �����ϼ���"><option value="12" selected="">��ġ</option><option value="13">�������۾�</option></optgroup></select><br></td>
                                <td
                                    class="table-primary"><strong>�����</strong></td>
                                    <td><button class="btn btn-primary btn-sm" type="button"><strong>��ȸ</strong></button><br></td>
                            </tr>
                            <tr>
                                <td class="table-primary" rowspan="6"><strong>����</strong></td>
                                <td class="table-primary"><strong>DO</strong></td>
                                <td colspan="2">Cell 3</td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>pH</strong></td>
                                <td colspan="2">Cell 2</td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>PSU</strong></td>
                                <td colspan="2">Cell 2</td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>����</strong></td>
                                <td colspan="2">Cell 2</td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>NH4</strong></td>
                                <td colspan="2">Cell 2</td>
                            </tr>
                            <tr>
                                <td class="table-primary"><strong>NO2</strong></td>
                                <td colspan="2">Cell 2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

					
					
				</div>
				<!-- END LINE -->
				</div>
				

	<!-- partial -->
	<script src="../../common/Js/script.js"></script>

</body>

</html>