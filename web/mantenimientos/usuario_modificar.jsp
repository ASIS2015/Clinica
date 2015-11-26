
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
%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>
<jsp:include page="../comunes/head.jsp"></jsp:include>

<% 
     
     String usuario = request.getParameter("usuario");
     String password = request.getParameter("password");
     String password2 = request.getParameter("password2");
     String nivel =  request.getParameter("nivel");
     String id_personal =  request.getParameter("paciente");
     
     String opc= request.getParameter("opc");
     String Nombres="";
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
     
    
            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
              Statement Estamento2 = conexion.createStatement();
    
    
        if(opc.equals("2"))
        {
        
               Estamento.executeUpdate("DELETE FROM usuarios Where usuario='"+usuario+"'");
               
               conexion.close();
                out.print("<script> window.location.href = 'usuario_listar.jsp';</script>");
            
            
        
        } else if(opc.equals("1")){
            
            
            
                
     if(usuario!=null && password!=null  && password2!=null  && nivel!=null  && id_personal!=null ){
     

         if(DBConexion.obtener() !=null)

         {
                                   
             String[] str1 = id_personal.split(",");
                   
             ResultSet rs2;
           rs2 = Estamento2.executeQuery("select *  from personal where nombres='"+str1[0]+"' and apellidos='"+str1[1].substring(1,str1[1].length())+"'");
           
          rs2.next();
          Integer id_paciente = rs2.getInt("Id");
          Nombres = rs2.getString("Nombres")+", "+rs2.getString("Apellidos");

               Estamento.executeUpdate("UPDATE `clinica`.`usuarios` SET `password`='"+password+"', `nivel`='"+nivel+"', `id_personal`='"+id_paciente+"' WHERE `usuario`='"+usuario+"';");
               
               estado=1;
               
      
               mensaje = "Datos Actualizados";
      
               estilo="success";
              //  out.print("<script>window.location.href='usuario_listar.jsp?opc=2&usuario="+usuario+"'</script>");
     //out.print("UPDATE `clinica`.`usuarios` SET `password`='"+password+"', `nivel`='"+nivel+"', `id_personal`='"+id_personal+"' WHERE `usuario`='"+usuario+"';");
               // conexion.close();
     } else {
         
         mensaje="Error conectando la BD";
         }
  
     }
            
            
        
        if(DBConexion.obtener() !=null)
{
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.*, B.Nombres, B.Apellidos from usuarios as A inner join personal as B ON B.id=A.id_personal and usuario='"+usuario+"'");
    
   
rs.next();

 Nombres = rs.getString("Nombres")+", "+rs.getString("Apellidos");


        
        
        
        
     
%>
           <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Modificar Usuario
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
                                         <input type="hidden" value="<% out.print(rs.getString("usuario")); %>" name="usuario">
                                        <tr>
                                            <th>Nombre de Usuario:</th>
                                            <th><% out.print(rs.getString("usuario")); %></th>
                                        </tr>
                                        <tr>
                                            <th>Password:</th>
                                            <th><input type="password" name="password" placeholder="******"  onchange="frmusuarios.password2.pattern = this.value;" required/> </th>
                                        </tr>                                        <tr>
                                            <th>Repita Password:</th>
                                            <th><input type="password" name="password2" placeholder="******"  required/> </th>
                                        </tr>
                                        <tr>
                                            <th>Nivel:</th>
                                            <th> <select name="nivel"> 
                                                    <option value="2" <% if(rs.getInt("nivel")==2) out.print("selected"); %> >Usuario</option>
                                                    <option value="1" <% if(rs.getInt("nivel")==1) out.print("selected"); %> >Administrador</option>
                                                </select> </th>
                                        </tr>                                        <tr>
                                            <th>Personal:</th>
                                           <th> <input type="search" id="brand-filter" placeholder="Buscar..." value="<% out.print(Nombres); %>" name="paciente" data-list="brands-list" autocomplete="off" required />
    <label for="brand-filter" data-icon="&#128269;"></label>
    <datalist id="brands-list">
      <select>
     
<%
        
         if(DBConexion.obtener() !=null)

         {
            //  Statement Estamento2 = conexion.createStatement();
               ResultSet rs2 = Estamento2.executeQuery("select * from personal where id_tipo=2");
               
         rs2 = Estamento2.executeQuery("select * from personal order by Nombres Asc");
                                                    
        while(rs2.next()){
                                                        
                                                        
            out.println("<option value=\""+rs2.getString("Nombres")+", "+rs2.getString("Apellidos")+"\" /></option>");
                                                        
                                                    
        }
                                                    
                                                          
                                                    
         }  
         
         
       %>
      </select>
    </datalist>  </th>   
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

<script>
$('input[data-list]').each(function () {
    var availableTags = $('#' + $(this).attr('data-list')).find('option').map(function () {
        return this.value;
    }).get();
    $(this).autocomplete({ source: availableTags }).on('focus', function () {
        $(this).autocomplete('search', ' ');
    }).on('search', function () {
        if ($(this).val() === '') {
            $(this).autocomplete('search', ' ');
        }
    });
});
//# sourceURL=pen.js
</script>
</html>
