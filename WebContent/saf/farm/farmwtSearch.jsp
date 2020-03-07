<%@ page import="farm.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>����Ʈ �����</title>
<link rel="stylesheet" href="../../common/css/style.css">
</head>

<body>
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

	<!-- partial:index.partial.html -->
	<span class="bckg"></span>
	<header>
		<h1>Smart Aqua Farm</h1>
		<!-- (����) �׺���̼� �޴� -->
		<!--  ��� �߰� ������ ���� ���Ѻ��� ������ ���� -->
		<!--  '��ü ������' �� �� �޴�  -->
		<nav>
			<%
				if (user_auth.equals("sysadmin")) {
			%>
			<ul>
				<li><a href="../main/index.jsp" onmouseover="changed_Menu(0)" data-title="����͸�">����͸�</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(1)" data-title="���� ���� ����">���� ���� ����</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(2)" data-title="���±��">���±��</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(3)" data-title="��ġ���">��ġ���</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(4)" data-title="���">���</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(5)" data-title="����� ���� ����">����� ���� ����</a></li>
				<li><a href="../farm/farmwtSearch.jsp" onmouseover="changed_Menu(6)" data-title="���� ����">���� ����</a></li>
				<li><a href="../auth/logoutPrc.jsp" onmouseover="changed_Menu(7)" data-title="�α� �ƿ�">�α� �ƿ�</a></li>
			</ul>
			<!--  '�Ϲ� ������' �� �� �޴�  -->
			<%
				} else if (user_auth.equals("admin")) {
			%>
			<ul>
				<li><a href="../main/index.jsp" onmouseover="changed_Menu(0)" data-title="����͸�">����͸�</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(1)" data-title="���� ���� ����">���� ���� ����</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(2)" data-title="���±��">���±��</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(3)" data-title="��ġ���">��ġ���</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(4)" data-title="���">���</a></li>
				<li><a href="javascript:void(0);" onmouseover="changed_Menu(5)" data-title="����� ���� ����">����� ���� ����</a></li>
				<li><a href="../farm/farmwtSearch.jsp" onmouseover="changed_Menu(6)" data-title="���� ����">���� ����</a></li>
				<li><a href="../auth/logoutPrc.jsp" onmouseover="changed_Menu(7)" data-title="�α� �ƿ�">�α� �ƿ�</a></li>
			</ul>
			<!--  '�����' �� �� �޴�  -->
			<%
				} else {
			%>

			<ul>
				<li><a href="../main/index.jsp" onmouserover="changed_Menu()" data-title="����͸�">����͸�</a></li>
				<li><a href="javascript:void(0);" data-title="���� ���� ����">���� ���� ����</a></li>
				<li><a href="javascript:void(0);" data-title="���±��">���±��</a></li>
				<li><a href="javascript:void(0);" data-title="��ġ���">��ġ���</a></li>
				<li><a href="javascript:void(0);" data-title="���">���</a></li>
				<li><a href="javascript:void(0);" data-title="����� ����">����� ����</a></li>
				<li><a href="../farm/farmwtSearch.jsp" data-title="���� ����">���� ����</a></li>
				<li><a href="../auth/logoutPrc.jsp" data-title="�α� �ƿ�">�α� �ƿ�</a></li>
			</ul>
			<%
				}
			%>

		</nav>
	</header>

	<main>

		<div class="title">
			<h2>���� ����</h2>
			<a href="javascript:void(0);">�ȳ��ϼ��� <%=user_name%>��
			</a>
		</div>
		<div></div>

		<article>
		
		
			<!--  ���� �˻� select box ���� -->
			<span class="farmwtsearch_box">
            <!-- ����Ʈ �ڽ� -->
            <h3> ���� �����</h3>
            <select name="search" id="search">
					<option selected value='null'>���Ǽ���</option>
					<option value='tankid'>���� ��ȣ</option>
					<option value='lastuptdate'>���� �Ͻ�</option>
					<option value='lastuptid'>������</option>
					<option value='userid'>�����</option>
            </select>
            <input type="text" id="search_input" autofocus/>
            <input type="submit" id="search_click" value="�˻�"/> 
            
            </span>
			
		
		
		
			<!-- ���� ����  -->
			<div class="table_frame">
				<table id="table_layout">

					<thead>
						<tr>
							<th rowspan=2>���� ��ȣ</th>
							<th rowspan=2>���� �Ͻ�</th>
							<th rowspan=2>������</th>
							<th rowspan=2>����</th>
							<th rowspan=2>�����</th>
							<th></th>
							<th colspan=3>-����-</th>
							<th></th>
							<th></th>
						</tr>

						<tr>
							<th colspan=1>DO</th>
							<th colspan=1>PH</th>
							<th colspan=1>����</th>
							<th colspan=1>����</th>
							<th colspan=1>NH4</th>
							<th colspan=1>NO2</th>
						</tr>

					</thead>
					<!--  ����¡ ó�� �� -->
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>

							<td colspan=1>$320,800</td>
							<td colspan=1>PH</td>
							<td colspan=1>����</td>

							<td>����</td>
							<td>NH4</td>
							<td>NO2</td>
						</tr>


					</tbody>
				</table>
			</div>
		</article>
	</main>

	<!-- partial -->
	<script src="../../common/Js/script.js"></script>

</body>

</html>