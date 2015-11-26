
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
     
        String id = request.getParameter("id");
      String mensaje = "Error", estilo="danger";
     Integer estado=0;
            Connection  conexion = DBConexion.obtener();
            Statement Estamento = conexion.createStatement();
            Statement Estamento2 = conexion.createStatement();
            ResultSet rs,rs2;
            
if(DBConexion.obtener() !=null)
{
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    Estamento2 = conexion.createStatement();
    String  periodo= request.getParameter("periodo1");
    String  cant= request.getParameter("cantidad1");
    
     String  periodo2= request.getParameter("periodo1");
    String  cant2= request.getParameter("cantidad2");
    
     String  periodo3= request.getParameter("periodo3");
    String  cant3= request.getParameter("cantidad3");
    
   
     rs2 = Estamento.executeQuery("select * from citas Where id='"+id+"'");

    rs2.next();
    
     rs = Estamento2.executeQuery("select A.*,B.tipo, C.tipo as 'Especialidad' from personal as A inner join tipo as B ON B.id=A.id_tipo inner join tipo_cita as C ON C.id=A.id_tipo and  A.id='"+rs2.getString("id_personal")+"'");
    rs.next();
        
           
 
if(periodo!=null && cant!=null){
    
    
   
    
    try {

        
        if(!periodo.equals("") ){
            
        
        Integer id_medicina = Integer.parseInt(request.getParameter("m1")); 
         Integer id_medicina2 = Integer.parseInt(request.getParameter("m2")); 
          Integer id_medicina3 = Integer.parseInt(request.getParameter("m3")); 
        
        
         //out.println("Error sql  INSERT INTO recetas VALUES (0,'"+id+"','"+id_medicina+"','"+periodo+"',25)");
    Estamento.executeUpdate("INSERT INTO recetas VALUES (0,'"+id+"','"+id_medicina+"','"+periodo+"',"+cant+")");
   
                   
               estado=1;
               
      
               mensaje = "Datos Actualizados";
      
               estilo="success";
    }
    
    }catch (SQLException e){
                   
               estado=1;
               
      
               mensaje = "Datos No Actualizados";
      
               estilo="danger";
               out.println("Error sql");
    }
}


%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>
<jsp:include page="../comunes/head.jsp"></jsp:include>
           <div class="row">
                <div class="col-lg-12">
       <div class="panel panel-default">
                        <div class="panel-heading">
                           Seguimiento de Cita
                        </div>

<div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-male fa-fw"></i> Informaci&oacute;n del Paciente 
                            
                        </div>
                        
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
                                         
  
                                        <tr>
                                            <th>Nombres:</th>
                                            <th><% out.print(rs.getString("nombres")); %></th>
                                        </tr>
                                        <tr>
                                            <th>Apellidos:</th>
                                            <th><% out.print(rs.getString("apellidos")); %></th>
                                        </tr>                                        <tr>
                                            <th>DUI:</th>
                                            <th><% out.print(rs.getString("dui")); %></th>
                                        </tr>
                                        <tr>
                                            <th>Celular:</th>
                                            <th><% out.print(rs.getString("celular")); %></th>
                                        </tr>                                          <tr>
                                            <th>Fijo:</th>
                                            <th><% out.print(rs.getString("fijo")); %></th>
                                        </tr>                                          <tr>
                                            <th>Nacimiento:</th>
                                            <th><% out.print(rs.getString("fecha_nac")); %></th>
                                        </tr>                                          <tr>
                                            <th>E-mail:</th>
                                            <th><% out.print(rs.getString("email")); %></th>
                                        </tr>                                          <tr>
                                            <th>Domicilio:</th>
                                            <th><% out.print(rs.getString("domicilio")); %></th>
                                        </tr>                                        <tr>
                                            <th>Categoria:</th>
                                            <th> <% out.print(rs.getString("tipo")); %> </th>
                                        </tr>
                                       
                                        
                                    </tbody>                                         
</form>
  
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->                 
                        
                    </div>
                    
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Alertas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                        <div class="panel panel-green">
                        <div class="panel-heading">
                            <% out.print(rs.getString("Especialidad")); %>
                        </div>
                        <div class="panel-body">
                            <p><% out.print(rs2.getString("Comentarios")); %></p>
                        </div>
                        <div class="panel-footer">
                            &nbsp;
                        </div>
                        </div>
                            <!-- /. fin especialidad -->
<% 
}
%>                             
                            
                          <div class="panel panel-primary">
                        <div class="panel-heading">
                            Medicamentos
                        </div>
                        <div class="panel-body">
                            <p>
                                
<%
                                                    
     try{
     rs2 = Estamento.executeQuery("SELECT A.Nombre, B.periodo, B.Cantidad FROM medicinas as A inner join recetas as B ON B.id_medicina = A.id and B.id_cita='"+id+"'");

    while(rs2.next()){
    
    
    out.print("<br>"+rs2.getString("Cantidad")+" "+rs2.getString("Nombre")+", tomar cada "+rs2.getString("Periodo"));
    } 
    
     } catch(SQLException e){
     
     
        // out.print("Error");
         
     }                                                 
                                                  
                                                  
%>                                
                            </p>
                        </div>
                        <div class="panel-footer">
                            &nbsp;
                        </div>
                    </div>                             
                            
                            <!-- /.list-group -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>

                    <!-- /.panel -->
  <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Recetas
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div class="table-responsive">
                               
                                <table class="table table-striped table-bordered table-hover">
<form action="" name="frmusuarios" method="POST"> 
<% 

    rs2 = Estamento.executeQuery("select * from medicinas ");

   // rs2.next();
%>    
    <tr><th>Medicamento 1:</th> <th> <select name="m1"> 
                                                    <%
                                                    while(rs2.next()){
                                                        
                                                        out.print("<option value='"+rs2.getInt("id")+"'> "+rs2.getString("nombre")+"</option>");
                                                    }
                                                    rs2.beforeFirst();
                                                    %>
                                                </select></th><th>Periodo:</th>  <th><input type="text" name="periodo1"></th> 
    <th>Cantidad:</th>  <th><input type="text" name="cantidad1"></th> 
    </tr>
    <tr><th>Medicamento 2:</th> <th> <select name="m2"> 
                                                    <%
                                                    while(rs2.next()){
                                                        
                                                        out.print("<option value='"+rs2.getInt("id")+"'> "+rs2.getString("nombre")+"</option>");
                                                    }
                                                    rs2.beforeFirst();
                                                    %>
                                                </select></th><th>Periodo:</th>  <th><input type="text" name="periodo2"></th> 
    <th>Cantidad:</th>  <th><input type="text" name="cantidad2"></th> 
    </tr>
    <tr><th>Medicamento 3:</th> <th> <select name="m3"> 
                                                    <%
                                                    while(rs2.next()){
                                                        
                                                        out.print("<option value='"+rs2.getInt("id")+"'> "+rs2.getString("nombre")+"</option>");
                                                    }
                                                    
                                                    %>
                                                </select></th>
    
                                                <th>Periodo:</th>  <th><input type="text" name="periodo3"></th> 
                                                <th>Cantidad:</th>  <th><input type="text" name="cantidad3"></th> 
    </tr>
    <input type="hidden" value="<% out.print(id); %>" name="id">
    <tr><td colspan="6"><center><b>Comentarios:</b> <br> <textarea cols="80" rows="4"></textarea></center></td></tr>
    <tr> <th colspan="6"><center><input type="submit" value="Terminar Cita" class="btn btn-success"> </center></th></tr> 
</form>
                                </table> 
    
    
</div></div></div></div></div>
                    <!-- /.panel -->    
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
conexion.close();  %>                     <!-- /.panel-heading -->