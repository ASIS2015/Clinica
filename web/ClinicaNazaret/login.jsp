<%-- 
    Document   : login
    Created on : 11-13-2015, 09:18:55 PM
    Author     : Roberto
--%>
<%@page import="java.util.*" session="true" %>
<%HttpSession sesion=request.getSession();%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% 
     
     String usuario = request.getParameter("usuario");
     String password = request.getParameter("password");
     String enviado =  request.getParameter("enviado");
     String mensaje = "", estilo="";
     Integer estado=0;
  
     
     
    if(usuario!=null && password!=null){

            if(usuario.isEmpty() && password.isEmpty()){
                estado=1;
                estilo="warning";
                mensaje = "Los dos campos son requeridos";

            } else if(usuario.isEmpty()){
            
               estado=1;
               estilo="warning";
               mensaje = "Campo usuario es requerido";           
            } else if(password.isEmpty()) {

     
                estado=1;
                estilo="warning";
                mensaje = "Campo password es requerido";
            
                
        
            } else {
            
            
    
                if(DBConexion.obtener() !=null)

                {

                    Connection  conexion = DBConexion.obtener();
 
                    Statement Estamento = conexion.createStatement();
 
                    ResultSet rs = Estamento.executeQuery("select * from usuarios where usuario='"+usuario+"' and password='"+password+"'");
  
                    if(rs.next()){
                
                        session.setAttribute("id",rs.getInt("id_personal"));
                        session.setAttribute("nivel",rs.getInt("nivel"));
                        response.sendRedirect("portal.jsp");
                        
 
                    } else{
                        estado=1;
                        estilo="danger";
                        mensaje = "Datos incorrectos, usuario y/o password erroneos";
 
                    }

                } else{
                
                 out.println("Error conectado a la BD"); 
                
                }            
            
            }

    }   

     
     
     %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inicio</title>

     <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>        
<body>
    
<body>
<!-- DIALOGO --> 
             <div id="dialogo" style="display:none;"><div class="notify"></div></div> 
 
        <!-- ALERTA --> 
        <div class="col-md-4 col-md-offset-4" style="position:fixed;" id="msj"></div>


    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Entrar Como Cliente Registrado</h3>
                    </div>
                    <div class="panel-body">
<%

        if(estado==1){

%>

                        <div class="alert alert-<% out.println(estilo); %>">
                               <% out.println(mensaje); %>
                            </div>
<%

        }
%>
                        <form action="" method="post" accept-charset="utf-8" id="my_form" class="form-signin"> 
                            <input type="hidden" value="1" name="enviado">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="usuario"  id="usuario"  name="usuario"  autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" id="password" name="password" type="password" value="">
                                </div>
                               
                                <!-- Change this to a button or input when using this as a form -->
                               <button type="submit" class="btn btn-lg btn-success btn-block btn-signin" id="send" >Entrar</button>

                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	  <!--END PAGE CONTENT -->
   


          

 <script src="../set/js/jquery-1.11.3.min.js"></script>
<script src="../set/js/bootstrap.min.js"></script>

<script src="../set/js/jquery-ui-1.10.4.custom.js"></script> 
<script src="../set/js/jquery-ui-1.10.4.custom.min.js"></script> 

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
               
    
    </body>
</html>