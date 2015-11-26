
<%HttpSession sesion=request.getSession();%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbpack.DBConexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
Integer Id=0;
 if(sesion.getAttribute("id")==null){  
  response.sendRedirect("../paginas/login.jsp");
} else {
   Id=(Integer)sesion.getAttribute("id");
 
 

// out.println("Contenido Id: "+Id);
 }
Integer nivel_acceso= Integer.parseInt(sesion.getAttribute("nivel").toString());

if(nivel_acceso!=1) {
     response.sendRedirect("../index.jsp");
}
%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>
<jsp:include page="../comunes/head.jsp"></jsp:include>

<% 
     
     

     String id_personal =  request.getParameter("id_personal");
     
     String opc= request.getParameter("opc");
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
    
            
 
            
            
        
        if(DBConexion.obtener() !=null)
{
    
 
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.*, concat(B.nombres, ' ', B.Apellidos) as Nombres, C.nombre as tipo from usuarios as A inner join personal as B ON B.id=A.id_personal inner join tipos_usuario as C ON C.id=A.nivel and A.id_personal='"+Id+"'");
    
   
rs.next();




        
        
        
        
     
%>
           <div class="row">
                <div class="col-lg-12">
                    
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
                                       <!--  <tr>
                                            <form action='usuario_modificar.jsp' method='POST'> 
                                                 <input type='hidden' name='opc' value='1'>
                                                <input type='hidden' name='usuario' value='<% out.print(rs.getString("usuario")); %>'> 
                                               
                                           <th colspan="2"><center> <input type='Submit' value='Modificar' class='btn btn-info'> </center></th></tr> -->
                                        
                                    </tbody>
</form>
 <% conexion.close(); } 
        
       

 %>  
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
