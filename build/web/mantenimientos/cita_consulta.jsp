
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
                            Administraci&oacute;n de Citas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
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
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.id,DATE_FORMAT(A.Fecha,'%d/%m/%Y %r') as Fecha,CONCAT( B.Nombres,' ',B.Apellidos) as 'paciente',  CONCAT(C.Nombres,' ',C.Apellidos) as 'medico', D.estado, A.id_estado from citas as A inner join personal as B ON B.id=A.id_personal inner join personal as C ON C.id=A.id_personal_medico inner join estado as D ON D.id=A.id_estado");
    
   

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

//out.println("<form action='cita_modificar.jsp' method='POST'> <input type='hidden' name='id' value='"+rs.getInt("id")+"'> <input type='hidden' name='opc' value='1'></th> <th> <center><input type='Submit' value='Ver' class='btn btn-info'></center> </form> </th>  ");
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
                                <p>Busque y acceda al modulo de modificar el Empleados, o si lo desea puede eliminarlo directamente. (nota) Necesitara privilegios de administrador</p>
                                
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
