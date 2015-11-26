
<%@page import="java.sql.SQLException"%>
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
     
     String mensaje = "Error", estilo="danger";
     Integer estado=0;
      Connection  conexion = DBConexion.obtener();
     
     if(usuario!=null && password!=null  && password2!=null  && nivel!=null  && id_personal!=null ){
     

         if(DBConexion.obtener() !=null)

         {
    
          
    
              Statement Estamento = conexion.createStatement();
             Statement Estamento2 = conexion.createStatement();
             

          
    
                try{
                    
                      String[] str1 = id_personal.split(",");
                                   
                      ResultSet rs2;
           rs2 = Estamento2.executeQuery("select *  from personal where nombres='"+str1[0]+"' and apellidos='"+str1[1].substring(1,str1[1].length())+"'");
           
          rs2.next();
          Integer id_paciente = rs2.getInt("Id");
                      
                Estamento.executeUpdate("INSERT INTO usuarios VALUES ('"+usuario+"','"+password+"',"+nivel+","+id_paciente+")");
               
               estado=1;
               
      
               mensaje = "Datos Guardados";
      
               estilo="success";
                } catch (SQLException e){
                
               estado=1;
               mensaje = "Datos No Guardados, usuario ya existe en la Base de Datos";
      
               estilo="danger";
                }
     
     } else {
             estado=1;
         estilo="danger";
         mensaje="Error conectando la BD";
         }
  
     }
     
     
%>
            <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Crear Usuario
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
                                        <tr>
                                            <th>Nombre de Usuario:</th>
                                            <th><input type="text" name="usuario" required/> </th>
                                        </tr>
                                        <tr>
                                            <th>Password:</th>
                                            <th><input type="password" name="password"  onchange="frmusuarios.password2.pattern = this.value;" required/> </th>
                                        </tr>                                        <tr>
                                            <th>Repita Password:</th>
                                            <th><input type="password" name="password2" required/> </th>
                                        </tr>
                                        <tr>
                                            <th>Nivel:</th>
                                            <th> <select name="nivel"> 
                                                    <option value="2">Usuario</option>
                                                    <option value="1">Administrador</option>
                                                </select> </th>
                                        </tr>                                        <tr>
                                            <th>Personal:</th>
                                            
<th> <input type="search" id="brand-filter" placeholder="Buscar..." name="paciente" data-list="brands-list" autocomplete="off" required />
    <label for="brand-filter" data-icon="&#128269;"></label>
    <datalist id="brands-list">
      <select>
     
<%
        
         if(DBConexion.obtener() !=null)

         {
              Statement Estamento2 = conexion.createStatement();
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
</html>
