
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
        String paciente = request.getParameter("paciente");
        String es  = request.getParameter("estado");
        Integer estado = 0;    
        if(es!=null) {
            estado = Integer.parseInt(es);
        } 
             
      String mensaje = "Error", estilo="green";
    
            Connection  conexion = DBConexion.obtener();
            Statement Estamento = conexion.createStatement();
            Statement Estamento2 = conexion.createStatement();
            Statement Estamento3 = conexion.createStatement();
            Double total_medicina=0.00, total_consulta=.00, total=0.00;
            
            ResultSet rs,rs2,rs3;
            
if(DBConexion.obtener() !=null)
{
    conexion = DBConexion.obtener();
    Estamento = conexion.createStatement();
    Estamento2 = conexion.createStatement();
    Estamento3 = conexion.createStatement();

    
    
   
     rs2 = Estamento.executeQuery("select * from citas Where id='"+id+"'");

    rs2.next();
    
     rs = Estamento2.executeQuery("select A.*,B.tipo, C.tipo as 'Especialidad', C.precio from personal as A inner join tipo as B ON B.id=A.id_tipo inner join tipo_cita as C ON C.id=A.id_tipo and  A.id='"+rs2.getString("id_personal")+"'");
    rs.next();
        



%>
<jsp:include page="../comunes/estilos.jsp"></jsp:include>

           <div class="row">
                <div class="col-lg-12">
       <div class="panel panel-default">
                        <div class="panel-heading">
                            Facturaci&oacute;n
                        </div>

<div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-reorder fa-fw"></i> Detalles 
                            
                        </div>
                        
                               <div class="panel-body">

                            <div class="table-responsive">
 <form action="" name="frmusuarios" method="POST">      
     <input name="id" value="<% out.print(id); %>" type="hidden">
                                <table class="table table-striped table-bordered table-hover">

                                         <tbody>
                                         <input type="hidden" value="1" name="opc">
                                         
                                         <tr> <th colspan="2"> <i class="fa fa-dollar fa-reorder fa-fw"></i> Informaci&oacute;n de Pago: </th></tr>
                                        <tr>
                                            <th>Factura a nombre de:</th>
                                            <th>

     
                                                          <%
                                    
         rs3 = Estamento3.executeQuery("SELECT A.*, concat(B.Nombres, ' ', B.Apellidos) as 'Nombre' FROM clinica.factura as A inner join personal as B ON B.id=A.id_personal and id_cita="+id);
                                                    
         rs3.next();
            out.println(rs3.getString("Nombre"));
                                                        
                                                    
                                          
                                                 
                                                          
       %>
      </th>
                                        </tr>                                        <tr>
                                                                               
                                         <tr> <th colspan="2"> <i class="fa fa-male fa-reorder fa-fw"></i> Informaci&oacute;n del Paciente: </th></tr>
                                        <tr>
                                            <th>Nombre Completo:</th>
                                            <th><% out.print(rs.getString("nombres")+" "+rs.getString("apellidos")); %></th>
                                        </tr>                                        
                                        <tr>
                                            <th>Tipo de Cita:</th>
                                            <th><% out.print(rs.getString("Especialidad")); %></th>
                                        </tr>
                                        <tr>
                                            <th>Precio:</th>
                                            <th>$<% out.print(rs3.getString("total_consulta")); total_consulta=Double.parseDouble(rs.getString("precio")); %></th>
                                        </tr>                                        
                                        <tr>
                                            <th colspan="2">Motivo de la consulta:</th>
                                        </tr>  
                                        <tr>
                                          
                                            <th colspan="2"><% out.print(rs2.getString("Comentarios")); %></th>
                                        </tr> 
                                        
                                    </tbody>                                         

  
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->                 
                        
                    </div>
                            <div class="panel panel-primary">
                        <div class="panel-heading">
                            Medicamentos
                        </div>
                        <div class="panel-body">
                                                      
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Cantidad</th>
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                 <tbody>
<%
   total=Double.parseDouble(rs3.getString("total"));  
   total_medicina=Double.parseDouble(rs3.getString("total_medicina"));  
     try{
         
     rs3 = Estamento3.executeQuery("SELECT A.Nombre, B.periodo, B.Cantidad,A.precio FROM medicinas as A inner join recetas as B ON B.id_medicina = A.id and B.id_cita='"+id+"'");

    while(rs3.next()){
    
  
    
    out.print("<tr> <th>"+rs3.getString("Cantidad")+"</th> <th> "+rs3.getString("Nombre")+"</th> <th> "+rs3.getString("precio")+"</th> <th> "+rs3.getString("precio")+"</th> </tr>");
    }
    
    out.print("<tr> <th colspan='2'>Total Medicina: </th> <th colspan='2'><center>$"+total_medicina+"</center></th> </tr>");
    
     } catch(SQLException e){
     
     
         out.print("No hay medicamento recetado");
         
     }                                                 
                                                  
                                           
%>                                

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            &nbsp;
                        </div>
                            
                    </div>                    
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-dollar fa-fw"></i> Honorarios
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                        <div class="panel panel-<% out.print(estilo); %>">
                        <div class="panel-heading">
                            TOTAL A PAGAR
                        </div>
                        <div class="panel-body">
                            <center><h3>$<% out.print(total); %></h3></center>
                        </div>
                        <div class="panel-footer">

                            <%
Integer id_paciente =0;

if(paciente!=null){
    
  
  try {

         
        if(!paciente.equals("") ){
              String[] str1 = paciente.split(",");
              
              
                    rs3 = Estamento3.executeQuery("select *  from personal where nombres='"+str1[0]+"' and apellidos='"+str1[1].substring(1,str1[1].length())+"'");
           
          rs3.next();
          id_paciente = rs3.getInt("Id");
              
    Estamento3.executeUpdate("INSERT INTO factura VALUES (0,'"+id+"','"+id_paciente+"',"+total_medicina+","+total_consulta+","+total+")");
    Estamento3.executeUpdate("UPDATE `clinica`.`citas` SET `id_estado`='2' where id="+id);
                   
               estado=2;
            
  out.print("<script> window.location.href = 'factura_seguimiento.jsp?estado=2&id="+id+"';</script>");
    }
    
   }catch (SQLException e){
                   
               estado=1;
               
      
               mensaje = "Datos No Actualizados";
      
               estilo="red";
               out.println("Error sql");
    }
}                
if(estado!=2 && rs2.getInt("id_estado")==1){
    

                            %>
                            
                                <center><input type="submit" value="Pagar" class="btn btn-success"> </center>
                                
                                <%}
                                
else if(rs2.getInt("id_estado")==2 || estado==2 ){
    out.print("<p> <b>PAGADA </b> </p>");
}else if(rs2.getInt("id_estado")==3){
    out.print("<p> <b>CITA NO EFECTIVA</b> </p>");
    
}
                                
                                %>
                            </form>
                        </div>
                        </div>
                            <!-- /. fin especialidad -->
                       
                           
                            
                            <!-- /.list-group -->
                            
                        </div>
                            
                        <!-- /.panel-body -->
                    </div>

                </div>                          
                </div>

                    <!-- /.panel -->

                    <!-- /.panel -->    
 <jsp:include page="../comunes/foot.jsp"></jsp:include>
    
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
        $('#impr').click(function(){
window.open("factura.jsp?id=<% out.print(id); %>&id_paciente=<% out.print(id_paciente); %>");
});
        
    });
    </script>
<% 
}
%>                             
     
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
  <% 
conexion.close();  %>                     <!-- /.panel-heading -->