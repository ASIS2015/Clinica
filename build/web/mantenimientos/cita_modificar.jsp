
<%@page import="java.sql.SQLException"%>
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
     
     String paciente = request.getParameter("paciente");
     String medico =  request.getParameter("medico");
     String fecha = request.getParameter("fecha");
     String hora = request.getParameter("hora");
     String comentarios =  request.getParameter("comentarios");
     String id =  request.getParameter("id");
     String opc =  request.getParameter("opc");
  // String id_tipo =  request.getParameter("id_tipo");
     
     String mensaje = "Error", estilo="success";
     Integer estado=0;
          
    if(request.getParameter("mensaje")!=null) mensaje = request.getParameter("mensaje");
    if(request.getParameter("estado")!=null) estado=Integer.parseInt(request.getParameter("estado"));
     

            Connection  conexion = DBConexion.obtener();
    
             Statement Estamento = conexion.createStatement();
             Statement Estamento2 = conexion.createStatement();
              Statement Estamento3 = conexion.createStatement();
             
      if(opc.equals("2")){
    
                    Estamento3.executeUpdate("UPDATE citas SET id_estado='3'  WHERE id='"+id+"';");
               
 
                out.print("<script> window.location.href = 'cita_listar.jsp?estado=1&mensaje=Datos%20Guardados';</script>");
  
    
    } else {
         
               
             ResultSet rs2;
             
     if(paciente!=null && medico!=null && fecha!=null && hora!=null && paciente.length()>5  && medico.length()>5 ){
          String[] str1 = paciente.split(",");
          String[] str2 = medico.split(",");
        try{
            
        
      
          rs2 = Estamento2.executeQuery("select *  from personal where nombres='"+str1[0]+"' and apellidos='"+str1[1].substring(1,str1[1].length())+"'");
           
          rs2.next();
          Integer id_paciente = rs2.getInt("Id");
        
          rs2 = Estamento2.executeQuery("select *  from personal where nombres='"+str2[0]+"' and apellidos='"+str2[1].substring(1,str2[1].length())+"'");
           
          rs2.next();
          Integer id_medico = rs2.getInt("Id");
   
         if(DBConexion.obtener() !=null)

         {
         //  out.println("Paciente Id: "+id_paciente);
         

            

 // out.print("UPADTE citas SET fecha='"+fecha+" "+hora+"',id_personal='"+id_paciente+"',id_personal_medico='"+id_medico+"',Comentarios='"+comentarios+"'  WHERE `id`='"+id+"';");
               
                
                try{
                    
                Estamento3.executeUpdate("UPDATE citas SET fecha='"+fecha+" "+hora+"',id_personal='"+id_paciente+"',id_personal_medico='"+id_medico+"',Comentarios='"+comentarios+"'  WHERE id='"+id+"';");
               
 
              //  out.print("<script> window.location.href = 'cita_nuevo.jsp?estado=1&mensaje=Datos%20Guardados';</script>");
                estado=1;
               
      
               mensaje = "Datos Actualizados";
      
               estilo="success";
  
               //conexion.close();            
                } catch (SQLException e){
                
               estado=1;
               mensaje = "Datos No Guardados";
      
               estilo="danger";
               
                out.println("Error: "+e);
                }                
                
     } else {
             estado=1;
         estilo="danger";
         mensaje="Error conectando la BD";
         }        
  
         
         
        } catch (SQLException e){
                
               estado=1;
               mensaje = "Error en la consulta";
      
               estilo="danger";
               

                }
            

  
     }
     
     
%>
            <div class="row">
                <div class="col-lg-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Modificar Cita
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
        
 if(DBConexion.obtener() !=null)
{
 
    
 

 
    Estamento = conexion.createStatement();
    ResultSet rs = Estamento.executeQuery("select A.id,A.Fecha,CONCAT( B.Nombres,', ',B.Apellidos) as 'paciente',  CONCAT(C.Nombres,', ',C.Apellidos) as 'medico',A.Comentarios, D.estado from citas as A inner join personal as B ON B.id=A.id_personal inner join personal as C ON C.id=A.id_personal_medico inner join estado as D ON D.id=A.id_estado and A.id="+id+" order by A.Fecha Desc");
    
   

rs.next();
%>
                            <div class="table-responsive">
                               
                                <table class="table table-striped table-bordered table-hover">
<form action="" name="frmusuarios" method="POST">
     <input type='hidden' name='opc' value='1'>
                                         <tbody>
                                             <tr> <input type="hidden" name="id" value="<% out.print(rs.getInt("id")); %>" />
                                            <th>Paciente:</th>
                                            <th> 
                                           
                                                  <input type="search" id="brand-filter" placeholder="Buscar..." name="paciente" data-list="brands-list" value="<% out.print(rs.getString("paciente")); %>" autocomplete="off" required />
    <label for="brand-filter" data-icon="&#128269;"></label>
    <datalist id="brands-list">
      <select>
     
                                                          <%
                                    
         rs2 = Estamento2.executeQuery("select * from personal order by Nombres Asc");
                                                    
        while(rs2.next()){
                                                        
                                                        
            out.println("<option value=\""+rs2.getString("Nombres")+", "+rs2.getString("Apellidos")+"\" /></option>");
                                                        
                                                    
        }
                                                    %>
      </select>
    </datalist>  

                                            </th>
                                        </tr>
                                        <tr>
                                            <th>M&eacute;dico:</th>
                                            <th>
                                                <input type="search" id="brand-filter-medico" placeholder="Buscar..." name="medico" data-list="brands-list-medico" value="<% out.print(rs.getString("medico")); %>"  autocomplete="off" required />
    <label for="brand-filter-medico" data-icon="&#128269;"></label>
    <datalist id="brands-list-medico">
      <select>
     
                                                          <%
                                    
         rs2 = Estamento2.executeQuery("select * from personal where id_tipo=2 order by Nombres Asc");
                                                    
        while(rs2.next()){
                                                        
                                                        
            out.println("<option value=\""+rs2.getString("Nombres")+", "+rs2.getString("Apellidos")+"\" /></option>");
                                                        
                                                    
        }
                                                    %>
      </select>
    </datalist>                                              
                                            </th>
                                        </tr>                                        <tr>
                                            <th>Fecha:</th>
                                            <th><input type="date" name="fecha" value="<% out.print(rs.getString("fecha").substring(0,10)); %>"  required > </th>
                                        </tr>
                                        <tr>
                                            <th>Hora:</th>
                                            <th><input type="time" name="hora" value="<% out.print(rs.getString("fecha").substring(11,16)); %>"   required > </th>
                                        </tr>                                          <tr>
                                            <th>Comentarios:</th>
                                            <th><textarea rows="6" cols="50" name="comentarios" required ><% out.print(rs.getString("Comentarios")); %></textarea> </th>
                                        </tr>                                          <tr>
                                            
                                         
                                        <tr> <th colspan="2"><center><input type="submit" value="Guardar" class="btn btn-success"> </center></th></tr>
                                        
                                    </tbody>
</form>
<% 


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
<center>

  <form>

  </form>
</center>
 <jsp:include page="../comunes/foot.jsp"></jsp:include>
    
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
<script src='//codepen.io/assets/editor/live/css_live_reload_init.js'></script>
</html>
