
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
Integer nivel_acceso= Integer.parseInt(sesion.getAttribute("nivel").toString());

if(nivel_acceso!=1) {
     response.sendRedirect("../index.jsp");
}
 String html="";
%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>
<jsp:include page="../comunes/head.jsp"></jsp:include>
           <div class="row">
                <div class="col-lg-12">
       <div class="panel panel-default">
                        <div class="panel-heading">
                            Administraci&oacute;n de Usuarios
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            <%  html= html+ " <table> <thead> <tr><th>Usuario</th><th>Password</th>"+
                                            "<th>Nivel</th><th>Persona</th>"+
                                        "</tr></thead><tbody>";
                                       
                
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.*, concat(B.nombres, ' ', B.Apellidos) as Nombres, C.nombre as tipo from usuarios as A inner join personal as B ON B.id=A.id_personal inner join tipos_usuario as C ON C.id=A.nivel");
    
   



while (rs.next()) {

html= html+ "<tr> <th>"+rs.getString("usuario")+"</th><th>******</th><th>"+rs.getString("tipo");

html= html+ "</th><th>"+rs.getString("Nombres")+"</tr>";

//out.println("<form action='usuario_modificar.jsp' method='POST'> <input type='hidden' name='usuario' value='"+rs.getString("usuario")+"'> <input type='hidden' name='opc' value='1'></th> <th> <center><input type='Submit' value='Modificar' class='btn btn-info'></center> </form> </th>  <th> <form action='usuario_modificar.jsp' method='POST'> <input type='hidden' name='usuario' value='"+rs.getString("usuario")+"'> <input type='hidden' name='opc' value='2'> <center><input  class='btn btn-danger' type='Submit' value='Eliminar'></center> </form> </th> ");
html= html+"</table>";
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
                                <h4>Usuarios:</h4>
                                <p>Reporte de Usuarios</p>
                                
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
fichero = new FileWriter("C:\\Users\\Roberto\\Documents\\NetBeansProjects\\Clinica\\web\\reportes\\usuarios.xls"); 
// El carácter \r\n es el que hace que salte una linia en el fichero después de escribir 
fichero.write(html + "\r\n"); 
// Cierras el fichero 
fichero.close(); 
out.print("<script> window.location.href = '../reportes/usuarios.xls';</script>");
} 
catch(IOException ioe) 
{ 
// Aqui pones lo que quieres que haga cuando se da una excepción de escritura 
} 


%>