
<%@page import="java.sql.SQLException"%>
<%HttpSession sesion=request.getSession();%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
Integer nivel_acceso= 0;
 if(sesion.getAttribute("id")==null){  
  response.sendRedirect("../paginas/login.jsp");
} else {
 
 Integer Id=(Integer)sesion.getAttribute("id");
  nivel_acceso= Integer.parseInt(sesion.getAttribute("nivel").toString());
// out.println("Contenido Id: "+Id);
 }
if(nivel_acceso!=1){  
  response.sendRedirect("../index.jsp");
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
    // String id_tipo =  request.getParameter("id_tipo");
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
     
     if(nombre!=null && apellido!=null  && dui!=null  && celular!=null   && fijo!=null   && nac!=null   && email!=null   && dom!=null  ){
     

         if(DBConexion.obtener() !=null)

         {
   
            
        
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
   
                try{
                Estamento.executeUpdate("INSERT INTO personal VALUES (0,'"+nombre+"','"+apellido+"','"+dui+"','"+celular+"','"+fijo+"','"+nac+"','"+email+"','"+dom+"',3)");
               
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
                           Crear Empleados
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
                                            <th><input type="text" name="dui" placeholder="########-#" pattern="[0-9]{8}[\-][0-9]{1}" required> </th>
                                        </tr>
                                        <tr>
                                            <th>Celular:</th>
                                            <th><input type="text" name="celular" placeholder="####-####" pattern="[0-9]{4}[\-][0-9]{4}"  required> </th>
                                        </tr>                                          <tr>
                                            <th>Fijo:</th>
                                            <th><input type="text" name="fijo" placeholder="####-####" pattern="[0-9]{4}[\-][0-9]{4}"  required> </th>
                                        </tr>                                          <tr>
                                            <th>Nacimiento:</th>
                                            <th><input type="date" name="nac" required> </th>
                                        </tr>                                          <tr>
                                            <th>E-mail:</th>
                                            <th><input type="email" placeholder="alguien@empresa.com" name="email" id="email" required> </th>
                                        </tr>                                          <tr>
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
