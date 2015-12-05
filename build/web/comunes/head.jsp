<% String url="http://localhost:8080/Clinica/"; %>
<%HttpSession sesion=request.getSession();%>
<% 
Integer Id=0;
Integer nivel_acceso= 0;
 if(sesion.getAttribute("id")==null){  
  response.sendRedirect("../paginas/login.jsp");
} 
 else {
 nivel_acceso= Integer.parseInt(sesion.getAttribute("nivel").toString());
 }
%>
<body>
    
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SClinica v1.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<% out.println(url); %>mantenimientos/usuario.jsp?usuario="<% out.println(Id); %>><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        
                        <li class="divider"></li>
                        <li><a href="<% out.println(url); %>paginas/logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="<% out.println(url); %>"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                       
                        <li>
                            <a href="#"><i class="fa fa-calendar fa-fw"></i> Citas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                      <% if(nivel_acceso==1) { %>       <li>
                                     <a href="<% out.println(url); %>mantenimientos/cita_nuevo.jsp">Nueva</a>
                            </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/cita_listar.jsp">Modificar</a>
                                </li>            <%}%>                   
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/cita_consulta.jsp">Consultas</a>
                                </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/cita_seguimiento.jsp">Seguimiento</a>
                                </li>                                
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/cita_reportes.jsp">Reportes</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level --> 
                        </li>                        
                       <li>
                            <a href="#"><i class="fa  fa-male fa-fw"></i> Pacientes<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                     <% if(nivel_acceso==1) { %>            <li>
                                    <a href="<% out.println(url); %>mantenimientos/paciente_nuevo.jsp">Nuevo</a>
                                </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/paciente_listar.jsp">Modificar</a>
                                </li>    <%}%>                           <li>
                                    <a href="<% out.println(url); %>mantenimientos/paciente_consulta.jsp">Consultas</a>
                                </li>
                                </li>                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/paciente_reportes.jsp">Reportes</a>
                                </li> 
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li> 
                      <% if(nivel_acceso==1 || nivel_acceso==2) { %>    
                        <li>
                            <a href="#"><i class="fa fa-user-md fa-fw"></i> M&eacute;dicos <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                          <% if(nivel_acceso==1) { %>       <li>
                                    <a href="<% out.println(url); %>mantenimientos/medico_nuevo.jsp">Nuevo</a>
                                </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/medico_listar.jsp">Modificar</a>
                                </li>    <%}%>                            <li>
                                    <a href="<% out.println(url); %>mantenimientos/medico_consulta.jsp">Consultas</a>
                                </li>
                                </li>                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/medico_reportes.jsp">Reportes</a>
                                </li>                                
                            </ul>
                            <!-- /.nav-second-level --> 
                        </li> 
                        <li>
                            <a href="#"><i class="fa  fa-child fa-fw"></i> Empleados <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                        <% if(nivel_acceso==1) { %>         <li>
                                   <a href="<% out.println(url); %>mantenimientos/empleado_nuevo.jsp">Nuevo</a> 
                                </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/empleado_listar.jsp">Modificar</a>
                                </li>   <%}%>                             <li>
                                    <a href="<% out.println(url); %>mantenimientos/empleado_consulta.jsp">Consultas</a>
                                </li>
                                </li>                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/empleado_reportes.jsp">Reportes</a>
                                </li>                                
                            </ul>
                            <!-- /.nav-second-level --> 
                        </li>
                        <% if(nivel_acceso==1) { %>
                            <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i>Usuarios <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/usuario_nuevo.jsp">Nuevo</a>
                                </li>
                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/usuario_listar.jsp">Modificar</a>
                                </li>                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/usuario_consulta.jsp">Consultas</a>
                                </li>
                                </li>                                <li>
                                    <a href="<% out.println(url); %>mantenimientos/usuario_reportes.jsp">Reportes</a>
                                </li>                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>                         
                                <% } %>
<li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>Administrativos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">

                                <li>
                                    <a href="<% out.println(url); %>facturacion/factura_listar.jsp">Facturaci&oacute;n</a>
                                </li>
                                        <li>
                                            <a href="<% out.println(url); %>inventario/movimientos.jsp">Movimientos</a>
                                        </li>                                
                                <li>
                                    <a href="#">Productos<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="<% out.println(url); %>inventario/medicina_nuevo.jsp">Nuevo</a>
                                        </li>
                                        <li>
                                            <a href="<% out.println(url); %>inventario/medicina_listar.jsp">Modificar</a>
                                        </li>
                                </li>                                <li>
                                     <a href="<% out.println(url); %>inventario/medicina_consulta.jsp">Consultas</a>
                                </li>
                                        <li>
                                            <a href="<% out.println(url); %>inventario/medicina_reportes.jsp">Reportes</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>                        
<%}%>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sistema de Control de Pacientes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->