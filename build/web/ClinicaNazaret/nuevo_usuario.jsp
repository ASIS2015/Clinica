<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>
<%
  String usuario = request.getParameter("usuario");
  String password = request.getParameter("password");
  Connection  conexion = DBConexion.obtener();
  Integer ok =0;
  
if(usuario!=null && password!=null  ){
     

         if(DBConexion.obtener() !=null)

         {
    
          
    
              Statement Estamento = conexion.createStatement();
             Statement Estamento2 = conexion.createStatement();
             

          
    
                try{
                    
                      
                      
                Estamento.executeUpdate("INSERT INTO usuarios VALUES ('"+usuario+"','"+password+"',2,0)");
               ok=1;
             
                } catch (SQLException e){
                
       
                }
     
     } else {
  
         }
  
     }
     
     
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
												<li class="active"><a href="#banner">Inicio</a></li>
												<li><a href="#about">Quienes Somos</a></li>
												<li><a href="#services">Servicios</a></li>
												<li><a href="#portfolio">Novedades</a></li>

												<li><a href="#contact">Contáctenos</a></li>
                                                                                                <li><a href="#reg">Registrarse</a></li>
																						</ul>
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
							<h1 class="text-center"><span><% if(ok==1) out.print("REGISTRO CORRECTO"); else  out.print("ERROR, VUELVA A INTENTARLO"); %></span></h1>
							<p class="lead text-center"><% if(ok==1) out.print("<a href='login.jsp'> INGRESAR </a>"); else  out.print("<a href='nuevo_usuario.jsp'> VOLVER </a>"); %></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section clearfix object-non-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 id="about" class="title text-center">Quienes <span>Somos</span></h1>
						<p class="lead text-center">Es nuestro interés prestar un servicio de excelente calidad a todos nuestros pacientes y esto lo logramos  a través del gran talento humano y medico de nuestra institución.</p>
						<div class="space"></div>
						<div class="row">
							<div class="col-md-6">
								<img src="images/section-image-1.jpg" alt="">
								<div class="space"></div>
							</div>
                            
                      

							<div class="col-md-6">
                            <p class="lead text-center">Misión</p>
								<p align="justify">Brindar una atención y servicios de salud con integridad y eficiencia a nuestros pacientes, contribuyendo así mismo a la prevención y recuperación que conduzcan al bienestar y mejoramiento de la calidad de vida de toda la comunidad.  </p>
								
						</div>
                        
                        <br>
                        <br>
                        
                        <div class="col-md-6">
                            <p class="lead text-center">Visión</p>
								<p align="justify">Lograr altos estándares de calidad en la atención en salud de los usuarios de la  comunidad que requiere nuestros servicios.   </p>
								
						</div>
                        
                        </div>
                        
                        
                        
                        <div class="col-md-6">
                            <p class="lead text-center">Política de Calidad</p>
								<p align="justify">La Clínica  esta comprometida en mantener y mejorar el sistema de gestión de calidad, mediante acciones de monitoreo, revisión y mejora continua en todos sus procesos para garantizar la eficiencia, eficacia e integralidad de sus servicios, con la revisión permanente de los objetivos de calidad contando con la competencia de su recurso humano y alta tecnología para cumplir las expectativas de los clientes y demás partes interesadas.   </p>
								
						</div>
						
										</div>
									</div>
								</div>
							</div>
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
				<h1 id="services"  class="text-center title">Nuestros Servicios</h1>
				<div class="space"></div>
				<div class="row">
					<div class="col-sm-6">
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">Implantes Dentales</h4>
								<p>son aditamentos, como raíces artificiales, creados para sustituir dientes ausentes o perdidos por cualquier causa, capaces de integrarse hasta el punto de convivir de forma sana y totalmente natural con el resto de los tejidos de la boca<p>
							</div>
     							<div class="media-right">
								<i class="fa fa-cog"></i>
							</div>
						</div>
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">Periodoncia </h4>
								<p>consiste desde la corrección de la técnica de higiene para el control de la placa bacteriana, hasta la eliminación de los factores desencadenantes de la misma (cálculos dentarios o sarro y bolsas periodontales).</p>
							</div>
							<div class="media-right">
								<i class="fa fa-check"></i>
							</div>
						</div>
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">Endodoncia</h4>
								<p>es un tratamiento que se conoce popularmente como “matar el nervio”. Se basa en la extracción del paquete neurovascular que se encuentra en el interior del diente y que al irritarse, es el causante del dolor dentario</p>
							</div>
							<div class="media-right">
								<i class="fa fa-desktop"></i>
							</div>
						</div>
						<div class="media">
							<div class="media-body text-right">
								<h4 class="media-heading">Prótesis Dental</h4>
								<p> es un elemento artificial destinado a restaurar la anatomía de una o varias piezas dentarias, restaurando también la relación entre los maxilares, a la vez que devuelve la dimensión vertical, y repone los dientes</p>
							</div>
							<div class="media-right">
								<i class="fa fa-users"></i>
							</div>
						</div>
					</div>
					<div class="space visible-xs"></div>
					<div class="col-sm-6">
						<div class="media">
							<div class="media-left">
								<i class="fa fa-leaf"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Blanqueamiento Dental</h4>
								<p>es uno de los métodos dentales más demandados en la actualidad y cada vez más estimado por parte de la rutina tradicional de estetica y belleza. Se ha transformado en una necesidad para los que quieren poseer una sonrisa linda y verdaderamente esplendida.</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-area-chart"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Radiografía Digital Computarizada</h4>
								<p>brinda hasta un 70% menos de radiación que la radiografía convencional. Además los diagósticos se vuelven más rápidos y precisos, las citas para el paciente son más cortas y cómodas</p>
							</div>
						</div>
						<div class="media">
							<div class="media-left">
								<i class="fa fa-child"></i>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Recina</h4>
								<p>Realizadas con la más reciente técnicas de biomimetización y materiales de última generación, ofreciendo tratamientos mejorados y más estéticos.</p>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="default-bg space blue">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="text-center"></h1>
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

		<!-- section start -->
		<!-- ================ -->
		<div class="section">
			<div class="container">
				<h1 class="text-center title" id="portfolio">Novedades</h1>
				<div class="separator"></div>
				<p class="lead text-center"><br></p>
				<br>			
				<div class="row object-non-visible" data-animation-effect="fadeIn">
					<div class="col-md-12">

						<!-- isotope filters start -->
						<div class="filters text-center">
							<ul class="nav nav-pills">
								<li class="active"><a href="#" data-filter="*">TODO</a></li>
								<li><a href="#" data-filter=".web-design">Medicina en general</a></li>
								<li><a href="#" data-filter=".app-development">Odontologia</a></li>
								<li><a href="#" data-filter=".site-building">Laboratorio</a></li>
							</ul>
						</div>
						<!-- isotope filters end -->

						<!-- portfolio items start -->
						<div class="isotope-container row grid-space-20">
							<div class="col-sm-6 col-md-3 isotope-item web-design">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-1.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-1">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-1">innovadora prótesis</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-1" tabindex="-1" role="dialog" aria-labelledby="project-1-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-1-label"> innovadora prótesis</h4>
											</div>
											<div class="modal-body">
												<h3>Un ingeniero argentino diseña una innovadora prótesis total de rodilla y pie</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">En este contexto se reconoció la necesidad de potenciar el desarrollo de este tipo de prótesis, con el objetivo de evitar los elevados costos de las                                                          prótesis importadas, que son hoy las únicas disponibles en el mercado. Pero a su vez, los investigadores destacan la importancia de “avanzar hacia la soberanía” en                                                          relación al desarrollo y fabricación de estos dispositivos para ponerlos al alcance de quienes los necesiten, sin importar clase social.</p>
														<p align="justify">Matías Menghini, director del proyecto, explicó a Argentina Investiga que la “gran ventaja del arreglo policéntrico radica en que permite la                                                         estabilidad de la rodilla cuando se hace contacto con el talón y reduce la estabilidad al momento del despegue de la punta del pie, con ello se incrementa la distancia de                                                        contacto con el piso y se reduce la posibilidad de tropiezo”. Las prótesis de rodillas policéntricas son sistemas de cuatro barras, porque tienen cuatro eslabones rígidos                                                        y cuatro puntos de pivote.</p>
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-1.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item app-development">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-2.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-2">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-2">Odontología Estética</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-2" tabindex="-1" role="dialog" aria-labelledby="project-2-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-2-label">Odontología Estética</h4>
											</div>
											<div class="modal-body">
												<h3>Odontología Estética</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Es la parte de la odontología que se encarga de que su sonrisa refleje una apariencia fresca y atractiva que se logra cambiar la forma, el color y el                                                        tamaño de los dientes proporcionando salud, seguridad y confianza. Esto se logra con carillas ceramicas, blanqueamientos, cambios de amalgama por resinas e incrustaciones,                                                       entre otros.</p>
														
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-2.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item web-design">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-3.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-3">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-3">metástasis cerebrales</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-3" tabindex="-1" role="dialog" aria-labelledby="project-3-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-3-label">metástasis cerebrales</h4>
											</div>
											<div class="modal-body">
												<h3>Las metástasis cerebrales podrían necesitar un tratamiento distinto al del tumor primario</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">El nuevo trabajo, llevado a cabo por investigadores del Massachusetts General Hospital (MGH), en Boston (EEUU), ha estudiado las características                                                         genéticas de casi un centenar de metástasis cerebrales, comparándolas con las de su tumor de origen. ¿Las conclusiones? Aunque comparten un ancestro común, las metástasis                                                        evolucionan de forma independiente.
														“Las metástasis cerebrales son una complicación devastadora del cáncer”, ha indicado en una conferencia de prensa Priscilla Brastianos, directora del programa de 		                                                        metástasis cerebrales en el MGH y primera firmante del trabajo, publicado en la revista Cancer Discovery. Al menos el 10% de los pacientes con cáncer desarrolla una                                                        metástasis cerebral y apenas hay tratamientos eficaces, por lo que su esperanza de vida suele reducirse drásticamente.</p>
																
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-3.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item site-building">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-4.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-4">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-4">combatir infecciones</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-4" tabindex="-1" role="dialog" aria-labelledby="project-4-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-4-label">Project Title</h4>
											</div>
											<div class="modal-body">
												<h3>Project Description</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">En experimentos recientes, los investigadores modificaron virus capacitándolos para atacar de manera selectiva y contundente a las bacterias patógenas 														                                                         Yersinia y Klebsiella, así como a varias cepas de E. coli. Todas forman parte de un grupo conocido como bacterias gram negativas, contra las cuales hay pocos                                                          antibióticos nuevos. Este grupo incluye asimismo microbios que pueden causar infecciones respiratorias, urinarias y gastrointestinales, incluyendo neumonía, sepsis,                                                          gastritis y legionelosis.</p>
														<p align="justify">Investigadores del MIT han ideado un nuevo sistema para modificar genéticamente virus con capacidad para infectar a bacterias, llamados bacteriófagos                                                         (en amarillo), con el propósito de controlarlos para beneficio de la humanidad y hacer que ataquen a bacterias concretas, perjudiciales para nosotros, como la mostrada en                                                        rojo. (Ilustración: Christine Daniloff/MIT)
 														Una ventaja de los virus modificados es que, a diferencia de muchos antibióticos, son muy específicos con respecto a sus blancos de ataque. Los antibióticos pueden matar                                                          mucha de la flora bacteriana beneficiosa de nuestro intestino. En cambio, mediante virus, es factible aniquilar solo a bacterias muy específicas.</p>
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-4.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item app-development">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-5.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-5">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-5">Prostodoncia</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-5" tabindex="-1" role="dialog" aria-labelledby="project-5-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-5-label">Prostodoncia</h4>
											</div>
											<div class="modal-body">
												<h3>Prostodoncia</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Rama de la odontología dedicada a la construcción de aparatos artificiales (implantes dentales, prótesis fija o puentes, coronas, etc.) para sustituir                                                          un diente perdidos o hasta una rehabilitación completa. </p>
														
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-5.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							
								
							</div>
							
							<div class="col-sm-6 col-md-3 isotope-item site-building">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-7.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-7">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-7">combatir al cáncer</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-7" tabindex="-1" role="dialog" aria-labelledby="project-7-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-7-label">Combatir al cáncer mediante las matetamaticas</h4>
											</div>
											<div class="modal-body">
												<h3>Matemáticas usadas para combatir al cáncer</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Unos investigadores de la Universidad de Ottawa en Canadá, han encontrado estrategias idóneas de uso de modelos matemáticos avanzados para combatir al                                                         cáncer con la mayor eficiencia posible. Las matemáticas predicen cómo diferentes tratamientos y modificaciones genéticas podrían permitir a los virus oncolíticos (virus                                                         capaces de matar selectivamente a células cancerosas) superar las defensas naturales que las células cancerosas utilizan para protegerse de las infecciones virales.
														 Los virus oncolíticos son especiales por su citada capacidad de matar células cancerosas sin dañar a las sanas. Desafortunadamente, el cáncer es una enfermedad muy                                                         complicada y variada, por lo que algunos de esos virus funcionan bien en determinadas circunstancias pero no en otras. Como resultado, se han invertido muchos esfuerzos                                                         en tratar de modificar del mejor modo posible esos virus para hacerlos más seguros, de tal manera que nunca dañen tejidos sanos y al mismo tiempo sean aún más eficientes                                                         en la eliminación de células cancerosas</p>
													    <p align="justify">Bell y Kaern establecieron un modelo matemático que describe un ciclo de infección, incluyendo la forma en que un virus se replica, se disemina y                                                         activa los mecanismos de defensa celular. A partir de ahí, estos científicos usaron su conocimiento acerca de las diferencias fisiológicas clave entre las células                                                         normales y las cancerosas para identificar cómo la modificación del genoma de los virus podría contrarrestar las defensas antivirales de las células cancerosas.
														 Las simulaciones del modelo fueron notablemente acertadas, mostrando la eficiencia de las modificaciones virales identificadas para erradicar el cáncer en un modelo de                                                         la enfermedad en ratones.
														 Esta prometedora línea de investigación ofrece muchas perspectivas nuevas. Apenas se han dado los primeros pasos por ella, al trabajar sobre un tipo específico de                                                         células ancerosas. Los científicos investigarán ahora otros tipos de células tumorales malignas bajo los mismos planteamientos básicos, a fin de acelerar los avances que                                                         permitan perfeccionar el ataque mediante virus contra las células cancerosas</p>
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-7.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
														
							
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item web-design">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-9.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-9">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-9">sangre Rejuvenecedora</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-9" tabindex="-1" role="dialog" aria-labelledby="project-9-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-9-label">sangre Rejuvenecedora</h4>
											</div>
											<div class="modal-body">
												<h3>La sangre joven rejuvenece</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">La sangre, o algún componente sanguíneo, de un ratón joven puede rejuvenecer los músculos y el cerebro de ratones viejos, según dos estudios del Centro                                                        de Terapias con Células Madre y Medicina Regenerativa de Harvard (EEUU), dirigido por el investigador Douglas Melton. Los trabajos, publicados en mayo, observaron que una                                                        proteína aislada de la sangre de ratones jóvenes, la GDF11, mejoraba el olfato y otras capacidades de roedores viejos tras ser inyectada en su torrente sanguíneo. La                                                        Universidad de Stanford (EE UU) prueba ahora si esta estrategia también funciona en humanos, mediante un ensayo con 18 pacientes con alzhéimer que están recibiendo plasma                                                        sanguíneo de jóvenes donantes.</p>
														
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-9.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item site-building">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-10.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-10">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-10">Clonación humana</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-10" tabindex="-1" role="dialog" aria-labelledby="project-10-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-10-label">Clonación humana</h4>
											</div>
											<div class="modal-body">
												<h3>Clonación humana</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Un equipo de investigadores ha logrado este año clonar células madre humanas, un avance que podría servir para tratar enfermedades neurológicas, la                                                         diabetes o la ceguera, según el responsable del grupo, Shoukhrat Mitalipov, de la Universidad de Ciencia y Salud de Oregón (EEUU). En 2004, el investigador surcoreano                                                         Hwang Woo-Suk hizo un anuncio similar, pero dos años después se descubrió que era un fraude. En el hallazgo de este año participó la embrióloga española Nuria Martí, que                                                         tras ser despedida del Centro de Investigación Príncipe Felipe, en Valencia, emigró para investigar en EEUU.</p>
														
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-10.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item web-design">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-11.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-11">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-11">Sangre Artificial</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-11" tabindex="-1" role="dialog" aria-labelledby="project-11-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-11-label">Sangre Artificial</h4>
											</div>
											<div class="modal-body">
												<h3>Sangre Artificial</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Tras cinco años de desarrollo, combinando la porfirina con monómeros que se autoensamblan en estructura de árbol, Twyman ha logrado una molécula                                                         extremadamente similar a la hemoglobina en forma y tamaño y que, además, ofrece el entorno adecuado alrededor del núcleo de la porfirina para que se enlace el hierro y                                                         libere el oxígeno. El aspecto de esta sangre artificial es el de una pasta de color rojo oscuro, con la consistencia de la miel y soluble en agua. El hecho de poner                                                         sangre plástica en el cuerpo, aunque sea para salvar una vida, suena arriesgado, pero Twyman señala que las porfirinas son naturales. Según él, el componente                                                          polimérico sería ignorado por sistema inmunológico del cuerpo humano y existen usos médicos en la actualidad que reafirman su postura; sin embargo, de momento, su                                                          experimento se limita a tubo de ensayo. </p>
														<p align="justify">Según Twyman, una de las principales aplicaciones sería el campo de batalla o un lugar en el que se haya producido un desastre importante y donde                                                        aportar sangre con rapidez pueda salvar muchas vidas ya que, a diferencia de la sangre donada, ésta es fácil de almacenar y se mantiene a temperatura ambiente.</p>
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-11.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
							</div>

							<div class="col-sm-6 col-md-3 isotope-item app-development">
								<div class="image-box">
									<div class="overlay-container">
										<img src="images/portfolio-12.jpg" alt="">
										<a class="overlay" data-toggle="modal" data-target="#project-12">
											<i class="fa fa-search-plus"></i>
											<span>Ampliar</span>
										</a>
									</div>
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-12">Veneers</a>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="project-12" tabindex="-1" role="dialog" aria-labelledby="project-12-label" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="project-12-label">Carillas de Cerámica o Veneers</h4>
											</div>
											<div class="modal-body">
												<h3>Carillas de Cerámica o Veneers</h3>
												<div class="row">
													<div class="col-md-6">
														<p align="justify">Son láminas de cerámica adheridas a la superficie frontal de los dientes, capaces de modificar el color, forma, tamaño o la posición del diente,                                                        mejorando de gran manera la estética dental. (Tuvieron su origen en los años veinte, por las exigencias estéticas de algunos artistas de cine).</p>
														
													</div>
													<div class="col-md-6">
														<img src="images/portfolio-12.jpg" alt="">
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal end -->
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
		<footer id="footer">

			<!-- .footer start -->
			<!-- ================ -->
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="contact">Contáctenos</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">Favor llenar el formulario para mayor información de nuestros servicios</p>
								<ul class="list-icons">
									<li><i class="fa fa-map-marker pr-10"></i> 89 Avenida Norte No. 165 Col Escalon</li>
									<li><i class="fa fa-phone pr-10"></i> 2205-7089</li>
									<li><i class="fa fa-fax pr-10"></i>2205-7081</li>
									<li><i class="fa fa-envelope-o pr-10"></i> clinicanazareth@gmail.com</li>
								</ul>
								<ul class="social-links">
								  <li class="facebook"><a target="_blank" href="https://www.facebook.com/pages/HtmlCoder/714570988650168"><i class="fa fa-facebook"></i></a></li>
									<li class="twitter"><a target="_blank" href="https://twitter.com/HtmlcoderMe"><i class="fa fa-twitter"></i></a></li>
									<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
									<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
									<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
									<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
									<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
									<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form role="form" id="footer-form">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Nombre</label>
										<input type="text" class="form-control" id="name2" placeholder="Nombre Completo" name="name2" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="email2">Correo Electronico</label>
										<input type="email" class="form-control" id="email2" placeholder="Digite su correo por Favor" name="email2" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="message2">Mensaje</label>
										<textarea class="form-control" rows="8" id="message2" placeholder="Mensaje" name="message2" required></textarea>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
									<input type="submit" value="Enviar" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .footer end -->
			<div class="footer section">
				<div class="container">
					<h1 class="title text-center" id="reg">Registro</h1>
					<div class="space"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="footer-content">
								<p class="large">Favor llenar el formulario</p>
								<ul class="list-icons">
									<li><i class="fa  fa-user pr-10"></i> Seleccione un nombre de usuario decente</li>
                                                                        <li><i class="fa  fa-key pr-10"></i> Seleccione una contraseña que no sea fac&iacute;l</li>
									
									<li><i class="fa fa-envelope-o pr-10"></i> dudas: clinicanazareth@gmail.com</li>
								</ul>
								
							</div>
						</div>
						<div class="col-sm-6">
							<div class="footer-content">
								<form action="nuevo_usuario.jsp" role="form" id="footer-form" method="POST">
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Nombre</label>
										<input type="text" class="form-control" id="usuario" placeholder="Nombre Completo" name="usuario" required>
										<i class="fa fa-user form-control-feedback"></i>
									</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="password">Password</label>
										<input type="password" class="form-control" id="password" placeholder="Digite su correo por Favor" name="password" required>
										<i class="fa fa-envelope form-control-feedback"></i>
									</div>
									
									<input type="submit" value="Enviar" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter start -->
			<!-- ================ -->
			<div class="subfooter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="text-center">Copyright Clínica Nazareth  <a target="_blank" href="http://htmlcoder.me"></a>.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- .subfooter end -->

		</footer>
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
