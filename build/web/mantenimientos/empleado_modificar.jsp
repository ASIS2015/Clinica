
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
     
     String id = request.getParameter("id");
     String nombre = request.getParameter("nombre");
     String apellido = request.getParameter("apellido");
     String dui = request.getParameter("dui");
     String celular =  request.getParameter("celular");
     String fijo =  request.getParameter("fijo");
     String nac =  request.getParameter("nac");
     String email =  request.getParameter("email");
     String dom =  request.getParameter("dom");
     String id_tipo =  request.getParameter("id_tipo");
     
     String opc= request.getParameter("opc");
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
             Statement Estamento2 = conexion.createStatement();
    
    
        if(opc.equals("2"))
        {
        
               Estamento.executeUpdate("DELETE FROM personal Where id='"+id+"'");
               
               conexion.close();
                out.print("<script> window.location.href = 'paciente_listar.jsp';</script>");
            
            
        
        } else if(opc.equals("1")){
            
            
            
                
     if(id!=null && nombre!=null  && apellido!=null  && dui!=null  && celular!=null ){
     

         if(DBConexion.obtener() !=null)

         {

              Estamento.executeUpdate("UPDATE `clinica`.`personal` SET `nombres`='"+nombre+"', `apellidos`='"+apellido+"', `dui`='"+dui+"', `celular`='"+celular+"', `fijo`='"+fijo+"', `fecha_nac`='"+nac+"', `email`='"+email+"', `domicilio`='"+dom+"', `id_tipo`='"+id_tipo+"' WHERE `id`='"+id+"';");
       //      out.print("UPDATE `clinica`.`personal` SET `nombres`='"+nombre+"', `apellidos`='"+apellido+"', `dui`='"+dui+"', `celular`='"+celular+"', `fijo`='"+fijo+"', `fec_nac`='"+nac+"', `email`='"+email+"', `domicilio`='"+dom+"' WHERE `id`='"+id+"';");
               
               estado=1;
               
      
               mensaje = "Datos Actualizados";
      
               estilo="success";
  
               conexion.close();
     } else {
         
         mensaje="Error conectando la BD";
         }
  
     }
            
            
        
        if(DBConexion.obtener() !=null)
{
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    Estamento2 = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select * from personal Where id='"+id+"'");
    ResultSet rs2 = Estamento2.executeQuery("select * from tipo order by tipo Asc");
    
   
rs.next();




        
        
        
        
     
%>
           <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Modificar M&eacute;dicos
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
                                         <input type="hidden" value="1" name="opc">
                                         <input type="hidden" value="<% out.print(rs.getInt("id")); %>" name="id">
  
                                        <tr>
                                            <th>Nombres:</th>
                                            <th><input type="text" name="nombre" value="<% out.print(rs.getString("nombres")); %>" > </th>
                                        </tr>
                                        <tr>
                                            <th>Apellidos:</th>
                                            <th><input type="text" name="apellido" value="<% out.print(rs.getString("apellidos")); %>" > </th>
                                        </tr>                                        <tr>
                                            <th>DUI:</th>
                                            <th><input type="text" name="dui" value="<% out.print(rs.getString("dui")); %>" > </th>
                                        </tr>
                                        <tr>
                                            <th>Celular:</th>
                                            <th><input type="text" name="celular" value="<% out.print(rs.getString("celular")); %>" > </th>
                                        </tr>                                          <tr>
                                            <th>Fijo:</th>
                                            <th><input type="text" name="fijo" value="<% out.print(rs.getString("fijo")); %>" > </th>
                                        </tr>                                          <tr>
                                            <th>Nacimiento:</th>
                                            <th><input type="date" name="nac" value="<% out.print(rs.getString("fecha_nac")); %>" > </th>
                                        </tr>                                          <tr>
                                            <th>E-mail:</th>
                                            <th><input type="text" name="email" value="<% out.print(rs.getString("email")); %>" > </th>
                                        </tr>                                          <tr>
                                            <th>Domicilio:</th>
                                            <th><input type="text" name="dom" value="<% out.print(rs.getString("domicilio")); %>" > </th>
                                        </tr>                                        <tr>
                                            <th>Tipo:</th>
                                            <th> <select name="id_tipo"> 
                                                    <%
                                                    while(rs2.next()){
                                                        
                                                        out.print("<option value='"+rs2.getInt("id")+"'");
                                                        if(rs2.getInt("id")==rs.getInt("id_tipo")) out.print(" selected");
                                                            out.print("> "+rs2.getString("tipo")+"</option>");
                                                    }
                                                    %>
                                                </select> </th>
                                        </tr>
                                        <tr> <th colspan="2"><center><input type="submit" value="Guardar" class="btn btn-success"> </center></th></tr>
                                        
                                    </tbody>                                         
</form>
 <% conexion.close(); } }
        
        else if(opc.equals("3")){
        

        
        }

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
