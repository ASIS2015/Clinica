<%
    
    response.setContentType("text/html");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    
    request.getSession().removeAttribute("id");
 
    session.invalidate();
    
    response.sendRedirect("login.jsp");
    
    
%>
    
    