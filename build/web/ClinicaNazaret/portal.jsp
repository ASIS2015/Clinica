<%@page import="javax.persistence.Id"%>
﻿
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%HttpSession sesion=request.getSession();%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 
Integer Id=0;
 if(sesion.getAttribute("id")==null){  
  response.sendRedirect("./paginas/login.jsp");
} else {
 
  Id=(Integer)sesion.getAttribute("id");
// out.println("Contenido Id: "+Id);
 }

  Connection  conexion = DBConexion.obtener();
   Statement Estamento = conexion.createStatement();
   String Nombres ="";
            
            
        
        if(DBConexion.obtener() !=null)
{
   
    if(Id!=0){
 
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.*, concat(B.nombres, ' ', B.Apellidos) as Nombres, C.nombre as tipo from usuarios as A inner join personal as B ON B.id=A.id_personal inner join tipos_usuario as C ON C.id=A.nivel and A.id_personal='"+Id+"'");
    
   
rs.next();
Nombres=rs.getString("Nombres");
    }

%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>Clínica Nazareth | Clínica Nazareth</title>
		<meta name="description" content="Worthy a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content="htmlcoder.me">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.ico">

		<!-- Web Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="css/animations.css" rel="stylesheet">

		<!-- Worthy core CSS file -->
		<link href="css/style.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="css/custom.css" rel="stylesheet">
	</head>

	<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="images/logo.png" alt="Worthy"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">Nazareth</a></div>
								<div class="site-slogan">Comprometidos por su salud <a target="_blank" href="http://htmlcoder.me"></a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
											<% if(Id!=0) { %>
                                                                                            
                                                                                            <li class="active"><a href="#banner">Inicio</a></li>
												<li><a href="#personal">Citas</a></li>
                                                                                                <li><a href="#citas">Informaci&oacute;n Personal</a></li>
												

											<%}%>											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->

		<!-- banner start -->
		<!-- ================ -->
		<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
                                                    <h1 class="text-center"><span><% if(Id==0) out.print("USUARIO REGISTRADO"); else  out.print(Nombres); %></span></h1>
							<p class="lead text-center"><% if(Id==0) out.print("Por favor complete el proceso de registro"); else  out.print("Bienvenidos al Sistema de Clientes"); %></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->

		<!-- section start -->
		<!-- ================ -->
		
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section translucent-bg bg-image-1 blue">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
				<h1 id="personal"  class="text-center title">Historial de Citas</h1>
				<div class="space"></div>
				<div class="row">
                                   <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                           <th>Fecha</th>
                                            <th>Paciente</th>
                                            <th>Doctor</th>
                                            <th>Estado</th>
                                             
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    
                                      if(Id!=0){
                                          
 ResultSet rs = Estamento.executeQuery("select A.id,DATE_FORMAT(A.Fecha,'%d/%m/%Y %r') as Fecha,CONCAT( B.Nombres,' ',B.Apellidos) as 'paciente',  CONCAT(C.Nombres,' ',C.Apellidos) as 'medico', D.estado, A.id_estado from citas as A inner join personal as B ON B.id=A.id_personal inner join personal as C ON C.id=A.id_personal_medico inner join estado as D ON D.id=A.id_estado and A.id_personal="+Id);
 while (rs.next()) {

out.println("<tr");

        if(rs.getString("id_estado").equals("3")) out.println(" class=\"danger\"");
        if(rs.getString("id_estado").equals("2")) out.println(" class=\"success\"");
out.println("> <th>");    
        
out.println(rs.getString("Fecha"));


out.println("</th><th>");

out.println(rs.getString("paciente"));

out.println("</th><th>");

out.println(rs.getString("medico"));

out.println("</th> <th>");
out.println(rs.getString("Estado"));

//out.println("<form action='cita_modificar.jsp' method='POST'> <input type='hidden' name='id' value='"+rs.getInt("id")+"'> <input type='hidden' name='opc' value='1'></th> <th> <center><input type='Submit' value='Modificar' class='btn btn-info'></center> </form> </th>  <th> <form action='cita_modificar.jsp' method='POST'> <input type='hidden' name='id' value='"+rs.getInt("id")+"'> <input type='hidden' name='opc' value='2'> <center><input  class='btn btn-danger' type='Submit' value='Cancelar'></center> </form> </th> ");
out.println("</tr>");
}

                                          
                                          
                                          
                                          
                                      } else {
                                          
                                          
                                          
                                       out.println("<tr> <th colspan=4> <center>NECESITA COMPLETAR EL REGISTRO</center> </th> </tr>");   
                                          
                                          
                                      }


                                    
                                    
                                    
                                    %>
                                    
                                    </tbody>
                                </table>
					</div>
					<div class="space visible-xs"></div>
					
					
				</div>
			</div>
                </div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="default-bg space blue">
			<div class="container object-non-visible" data-animation-effect="fadeIn">
                            <h1 id="personal"  class="text-center title">Informaci&oacute;n del Usuario</h1>
				<div class="space"></div>
				<div class="row">
                                   <div class="dataTable_wrapper">
                                
                                    <%
                                    
                                      if(Id!=0){
                                          
   ResultSet rs = Estamento.executeQuery("select A.*, concat(B.nombres, ' ', B.Apellidos) as Nombres, C.nombre as tipo from usuarios as A inner join personal as B ON B.id=A.id_personal inner join tipos_usuario as C ON C.id=A.nivel and A.id_personal='"+Id+"'");
    
   
rs.next();


%>
 <div class="panel panel-default">
                        <div class="panel-heading">
                           <% out.print(rs.getString("Nombres")); %>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <div class="table-responsive">
                               
                                <table class="table table-striped table-bordered table-hover">

                                         <tbody>
                                         
                                        <tr>
                                            <th>Nombre de Usuario:</th>
                                            <th>  <% out.print(rs.getString("usuario")); %> </th>
                                        </tr>
                                        <tr>
                                            <th>Password:</th>
                                            <th>******</th>
                                        </tr>                                        
                                        <tr>
                                            <th>Nivel:</th>
                                            <th> <% out.print(rs.getString("tipo")); %> </th>
                                        </tr>             
<%
                                          
                                          
                                          
                                      } else {
                                          
                                          
                                          
                                       out.println("<tr> <th colspan=4> <center>NECESITA COMPLETAR EL REGISTRO</center> </th> </tr>");   
                                          
                                          
                                      }


                                    
                                    
                                    
                                    %>
                                    
                                    </tbody>
                                </table>
					</div>
					<div class="space visible-xs"></div>
					
					
				</div>
			</div>
							</div>

							
							
							
							
						
							
						
							
						

							

							

						</div>
						<!-- portfolio items end -->
					
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		

		<!-- footer start -->
		<!-- ================ -->
	
		<!-- footer end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="plugins/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="plugins/isotope/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="plugins/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="plugins/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="js/custom.js"></script>

	</body>
</html>
<% }%>