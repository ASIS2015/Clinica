
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
     
     String id = request.getParameter("id");
     String nombre = request.getParameter("nombre");
     String cantidad = request.getParameter("cantidad");
     String cantidad_uno = request.getParameter("cantidad_uno");
     String precio = request.getParameter("precio");
     
     Integer cant=0;
     
     
     String opc= request.getParameter("opc");
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
             Statement Estamento2 = conexion.createStatement();
    
    
        if(opc.equals("2"))
        {
        
               Estamento.executeUpdate("DELETE FROM medicinas Where id='"+id+"'");
               
               conexion.close();
                out.print("<script> window.location.href = 'medicina_listar.jsp';</script>");
            
            
        
        } else if(opc.equals("1")){
            
            
            
                
     if(id!=null && nombre!=null  && cantidad!=null ){
     
Integer  cantidad2 = Integer.parseInt(request.getParameter("cantidad2"));
         if(DBConexion.obtener() !=null)

         {

              Estamento.executeUpdate("UPDATE `clinica`.`medicinas` SET `nombre`='"+nombre+"', `cantidad`='"+cantidad+"', `precio`='"+precio+"' WHERE `id`='"+id+"';");
       //      out.print("UPDATE `clinica`.`personal` SET `nombres`='"+nombre+"', `apellidos`='"+apellido+"', `dui`='"+dui+"', `celular`='"+celular+"', `fijo`='"+fijo+"', `fec_nac`='"+nac+"', `email`='"+email+"', `domicilio`='"+dom+"' WHERE `id`='"+id+"';");
               cant = Integer.parseInt(cantidad);
              if(cant>cantidad2 && !cantidad_uno.equals(cantidad)){
                  cant=cant-cantidad2;
              
               Estamento.executeUpdate("INSERT INTO movimientos VALUES (0,'"+id+"','"+cant+"',3)");
              } else if(cant<cantidad2 && !cantidad_uno.equals(cantidad)){
                  cant=cantidad2-cant;
              
               Estamento.executeUpdate("INSERT INTO movimientos VALUES (0,'"+id+"','"+cant+"',4)");
              }
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
    ResultSet rs = Estamento.executeQuery("select * from medicinas Where id='"+id+"'");
   
   
rs.next();




        
        
        
        
     
%>
           <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Modificar Paciente
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
                                             <input type="hidden" value="1" name="opc">
                                         <input type="hidden" value="<% out.print(rs.getInt("id")); %>" name="id">
                                         <input type="hidden" value="<% out.print(rs.getInt("Cantidad")); %>" name="cantidad2">
 
                                         <tbody>
                                        <tr>
                                            <th>Nombre:</th>
                                            <th><input type="text" name="nombre" value="<% out.println(rs.getString("Nombre")); %>" required/> </th>
                                        </tr>
                                        <tr>
                                            <th>Cantidad Inicial:</th>
                                            <input type="hidden" name="cantidad_uno"  value="<% out.println(rs.getInt("Cantidad")); %>" /> 
                                            <th><input type="text" name="cantidad"  value="<% out.println(rs.getInt("Cantidad")); %>" required/> </th>
                                        </tr>                                        <tr>
                                            <th>Precio:</th>
                                            <th><input type="text" name="precio"  value="<% out.println(rs.getDouble("Precio")); %>" required/> </th>
                                        </tr>                                        
                                        <tr> <th colspan="2"><center><input type="submit" value="Guardar" class="btn btn-success"> </center></th></tr>
                                        
                                    </tbody>
</form>
                               
                                    </tbody>       </table>                                   
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
