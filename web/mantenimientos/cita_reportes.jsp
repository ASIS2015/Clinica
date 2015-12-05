
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
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
 String html="";
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
                               <% 
                                
                                  html= html+ " <table><thead>"+
                                   "<tr> <th  colspan=5> <h2> Reporte de Citas</h2> </th> </tr> <tr>"+
                                   "<th><b>Fecha</b></th>"+
                                   "<th><b>Paciente</b></th>"+
                                            "<th><b>Doctor</b></th>"+
                                            "<th><b>Comentarios</b></th>"+
                                            "<th><b>Estado</b></th>"+
                                        "</tr>"+
                                    "</thead>"+
                                    "<tbody>";
                                       %>
                                    <tbody>
                                       
<%                 
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.id,A.Fecha,CONCAT( B.Nombres,' ',B.Apellidos) as 'paciente',  CONCAT(C.Nombres,' ',C.Apellidos) as 'medico', D.estado, A.Comentarios from citas as A inner join personal as B ON B.id=A.id_personal inner join personal as C ON C.id=A.id_personal_medico inner join estado as D ON D.id=A.id_estado");
    
   

while (rs.next()) {

html= html+"<tr> <th>"+rs.getString("Fecha")+"</th><th>"+rs.getString("paciente")+"</th><th>"+rs.getString("medico");

html= html+"</th> <th>"+rs.getString("Estado")+" </th>  <th>"+rs.getString("Comentarios")+" </th> </tr>";
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
                                <h4>Citas:</h4>
                                <p>Reporte en Excel de las citas programadas</p>
                                
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

<%
    FileWriter fichero = null; 

try 
{ 
// Creas la instancia del fichero 
fichero = new FileWriter("C:\\ReportesClinica\\citas.xls"); 
// El carácter \r\n es el que hace que salte una linia en el fichero después de escribir 
fichero.write(html + "\r\n"); 
// Cierras el fichero 
fichero.close(); 
out.print("<script> window.location.href = '../reportes/citas.xls';</script>");
} 
catch(IOException ioe) 
{ 
// Aqui pones lo que quieres que haga cuando se da una excepción de escritura 
} 


%>