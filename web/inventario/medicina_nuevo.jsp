
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
     String cantidad = request.getParameter("cantidad");
     String precio = request.getParameter("precio");

     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
     
     if(nombre!=null && cantidad!=null ){
     

         if(DBConexion.obtener() !=null)

         {
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
             
    
                try{
                Estamento.executeUpdate("INSERT INTO medicinas VALUES (0,'"+nombre.toUpperCase()+"','"+cantidad+"','"+precio+"')");
               ResultSet rs =Estamento.executeQuery("SELECT LAST_INSERT_ID() as 'Last';");
               rs.next();
               Estamento.executeUpdate("INSERT INTO movimientos VALUES (0,'"+rs.getString("Last")+"','"+cantidad+"',1)");
               
               estado=1;
               
      
               mensaje = "Datos Guardados";
      
               estilo="success";
                } catch (SQLException e){
                
               estado=1;
               mensaje = "Datos No Guardados, medicina ya existe en la Base de Datos";
      
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
                           Nueva Medicina
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
                                            <th>Nombre:</th>
                                            <th><input type="text" name="nombre" required/> </th>
                                        </tr>
                                        <tr>
                                            <th>Cantidad Inicial:</th>
                                            <th><input type="text" name="cantidad" required/> </th>
                                        </tr> 
                                        <tr>
                                            <th>Precio:</th>
                                            <th><input type="text" name="precio" required/> </th>
                                        </tr>                                        
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
