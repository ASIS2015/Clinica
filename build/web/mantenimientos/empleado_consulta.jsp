
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
           <div class="row">
                <div class="col-lg-12">
       <div class="panel panel-default">
                        <div class="panel-heading">
                            Consulta de Empleados
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>DUI</th>
                                            <th>Celular</th>
                                            <th>Fijo</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
<%                 
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select * from personal where id_tipo=3");
    
   



while (rs.next()) {

out.println("<tr class='odd gradeX'>");
        
out.println("<th>");    
        
out.println(rs.getString("Nombres"));

out.println("</th><th>");

out.println(rs.getString("Apellidos"));

out.println("</th><th>");

out.println(rs.getString("DUI"));

out.println("</th><th>");

out.println(rs.getString("Celular"));

out.println("</th><th>");

out.println(rs.getString("Fijo"));

//out.println("<form action='empleado_modificar.jsp' method='POST'> <input type='hidden' name='id' value='"+rs.getInt("id")+"'> <input type='hidden' name='opc' value='1'></th> <th> <center><input type='Submit' value='Ver' class='btn btn-info'></center> </form> </th>   ");
out.println("</th> </tr>");

}


    conexion.close();

}
else
{
%>
<p>Hubo un error en la conexión</p>
<%
}
%>                                           

       
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <h4>Empleados:</h4>
                                <p>Consulta de Empleados Registrados</p>
                                
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>         <!-- /.col-lg-12 -->
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
