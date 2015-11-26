
<%@page import="java.sql.SQLException"%>
<%HttpSession sesion=request.getSession();%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

 if(sesion.getAttribute("id")==null){  
  response.sendRedirect("../paginas/login.jsp");
} else {
 
 Integer Id=(Integer)sesion.getAttribute("id");
// out.println("Contenido Id: "+Id);
 }

%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>
<jsp:include page="../comunes/head.jsp"></jsp:include>

<% 
     
     String nombre = request.getParameter("nombre");
     String apellido = request.getParameter("apellido");
     String dui = request.getParameter("dui");
     String celular =  request.getParameter("celular");
     String fijo =  request.getParameter("fijo");
     String nac =  request.getParameter("nac");
     String email =  request.getParameter("email");
     String dom =  request.getParameter("dom");
      String jvpm =  request.getParameter("jvpm");
    // String id_tipo =  request.getParameter("id_tipo");
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
   //   out.print("INSERT INTO personal VALUES (0,'"+nombre+"','"+apellido+"','"+dui+"','"+celular+"','"+fijo+"','"+nac+"','"+email+"','"+dom+"',2)");
        
     if(jvpm!=null && nombre!=null && apellido!=null  && dui!=null  && celular!=null   && fijo!=null   && nac!=null   && email!=null   && dom!=null  ){
     

         if(DBConexion.obtener() !=null)

         {
   
           
        
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
   
                try{
                Estamento.executeUpdate("INSERT INTO personal VALUES (0,'"+nombre+"','"+apellido+"','"+dui+"','"+celular+"','"+fijo+"','"+nac+"','"+email+"','"+dom+"',2)");
                
                ResultSet rs =Estamento.executeQuery("SELECT LAST_INSERT_ID() as 'Last';");
               rs.next();
                
               
                Estamento.executeUpdate("INSERT INTO detalle_medico VALUES (0,'"+rs.getString("Last")+"','"+jvpm+"' )");
               
               estado=1;
               
      
               mensaje = "Datos Guardados ";
      
               estilo="success";
                } catch (SQLException e){
                
               estado=1;
               mensaje = "Datos No Guardados, DUI de Empleados ya existe en la Base de Datos.";
      
               estilo="danger";
                } 
     
     } else {
             estado=1;
         estilo="danger";
         mensaje="Error conectando la BD";
         }
  
     }
     
     
%>
            <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Crear M&eacute;dicos
                        </div>
                        <!-- /.panel-heading -->
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
                            <div class="table-responsive">
                               
                                <table class="table table-striped table-bordered table-hover">
<form action="" name="frmusuarios" method="POST"> 
                                         <tbody>
                                        <tr>
                                            <th>Nombres:</th>
                                            <th><input type="text" name="nombre" required> </th>
                                        </tr>
                                        <tr>
                                            <th>Apellidos:</th>
                                            <th><input type="text" name="apellido" required> </th>
                                        </tr>                                        <tr>
                                            <th>DUI:</th>
                                            <th><input type="text" name="dui" required> </th>
                                        </tr>
</tr>                                          <tr>
                                            <th>JVPM:</th>
                                            <th><input type="text" name="jvpm" id="jvpm" required> </th>
                                        </tr>                                        
                                        <tr>
                                            <th>Celular:</th>
                                            <th><input type="text" name="celular" required> </th>
                                        </tr>                                          <tr>
                                            <th>Fijo:</th>
                                            <th><input type="text" name="fijo" required> </th>
                                        </tr>                                          <tr>
                                            <th>Nacimiento:</th>
                                            <th><input type="date" name="nac" required> </th>
                                        </tr>                                          <tr>
                                            <th>E-mail:</th>
                                            <th><input type="email" name="email" id="email" required> </th>
                                        </tr> 
                                        <tr>
                                            <th>Domicilio:</th>
                                            <th><input type="text" name="dom" required> </th>

                                        <tr> <th colspan="2"><center><input type="submit" value="Guardar" class="btn btn-success"> </center></th></tr>
                                        
                                    </tbody>
</form>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
 
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
         
            <!-- /.row -->
          
            <!-- /.row -->
        
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

 <jsp:include page="../comunes/foot.jsp"></jsp:include>
    
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
