
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
                            Consulta de Medicinas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <% 
                                
                                  html= html+ " <table><thead>"+
                                   "<tr> <th  colspan=5> <h2> Reporte de Medicinas</h2> </th> </tr> <tr>"+
                                   "<th><b>Nombre</b></th>"+
                                   "<th><b>Apellidos</b></th></tr>"+
                                    "</thead>"+
                                    "<tbody>";
                                       
              
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select * from medicinas");
    
   



while (rs.next()) {

html= html+"<tr class='odd gradeX'><th>"+rs.getString("Nombre")+"</th><th>"+rs.getInt("Cantidad")+"</th> </tr>";

}

html= html+"</table>";
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
                                <h4>Medicina Reporte:</h4>
                                <p>Consulta de Datos de medicinas registradas.</p>
                                
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
fichero = new FileWriter("C:\\ReportesClinica\\medicinas.xls"); 
// El carácter \r\n es el que hace que salte una linia en el fichero después de escribir 
fichero.write(html + "\r\n"); 
// Cierras el fichero 
fichero.close(); 
out.print("<script> window.location.href = '../reportes/medicinas.xls';</script>");
} 
catch(IOException ioe) 
{ 
// Aqui pones lo que quieres que haga cuando se da una excepción de escritura 
} 


%>