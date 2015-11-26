
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
                            Movimientos de Medicinas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Compras</th>
                                            <th>Ventas</th>
                                            <th>Ajuste positivo</th>
                                            <th>Ajuste negativo</th>
                                            <th>Existencias</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
<%                 
                    if(DBConexion.obtener() !=null)
{
    Connection  conexion = DBConexion.obtener();
    Statement Estamento = conexion.createStatement();
    Statement Estamento2 = conexion.createStatement();
    
    ResultSet rs = Estamento.executeQuery("select * from medicinas");
    
    
   




    while (rs.next()) {


        out.println("<tr class='odd gradeX'>");
        

        out.println("<th>");    
        
Integer sumas=0, restas=0, total=0;
        out.println(rs.getString("Nombre"));

        

        ResultSet rs2 = Estamento2.executeQuery("SELECT SUM(A.Cantidad) as 'total' FROM clinica.movimientos as A inner join medicinas as B ON A.id_medicina=B.id and A.id_tipo=1 and  A.id_medicina="+rs.getString("id"));

        rs2.next();
        if(rs2.getString("total")==null) {
        
        sumas=sumas+0;
        out.println("<th>0</th>");
        } else {
        sumas=sumas+Integer.parseInt(rs2.getString("total"));
        out.println("<th>"+rs2.getString("total")+"</th>");
        }

 
        rs2 = Estamento2.executeQuery("SELECT SUM(A.Cantidad) as 'total' FROM clinica.movimientos as A inner join medicinas as B ON A.id_medicina=B.id and A.id_tipo=2 and  A.id_medicina="+rs.getString("id"));

        rs2.next();
        if(rs2.getString("total")==null) {
        
        restas=restas+0;
        out.println("<th>0</th>");
        } else {
        restas=restas+Integer.parseInt(rs2.getString("total"));
        out.println("<th>"+rs2.getString("total")+"</th>");
        }

        
    
        rs2 = Estamento2.executeQuery("SELECT SUM(A.Cantidad) as 'total' FROM clinica.movimientos as A inner join medicinas as B ON A.id_medicina=B.id and A.id_tipo=3 and  A.id_medicina="+rs.getString("id"));

        rs2.next();
        if(rs2.getString("total")==null) {
        
        sumas=sumas+0;
        out.println("<th>0</th>");
        } else {
        sumas=sumas+Integer.parseInt(rs2.getString("total"));
        out.println("<th>"+rs2.getString("total")+"</th>");
        }

        
    
        rs2 = Estamento2.executeQuery("SELECT SUM(A.Cantidad) as 'total' FROM clinica.movimientos as A inner join medicinas as B ON A.id_medicina=B.id and A.id_tipo=4 and  A.id_medicina="+rs.getString("id"));

        rs2.next();
        if(rs2.getString("total")==null) {
        
        restas=restas+0;
        out.println("<th>0</th>");
        } else {
        restas=restas+Integer.parseInt(rs2.getString("total"));
        out.println("<th>"+rs2.getString("total")+"</th>");
        }

        
        
        out.println("<th>"+(sumas-restas)+"</th>   </tr>");

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
                                <h4>Movimiento de medicinas:</h4>
                                <p>Las compras son todas aquellas medicinas ingresadas por primera vez, los ajustes positivos y/o negativos, son ajustes por modificaci&oacute;n</p>
                                
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
