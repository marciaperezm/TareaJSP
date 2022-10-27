<%-- 
    Document   : index
    Created on : 25/10/2022, 22:23:02
    Author     : Usuario
--%>
<%@page import ="modelo.Puesto" %>
<%@page import ="modelo.Empleado" %>
<%@page import ="java.util.HashMap" %>
<%@page import ="javax.swing.table.DefaultTableModel;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()" >Nuevo</button>
        
    <div class="container">
            <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
                      <form action="sr_empleado" method="post" class="form-group">
                
                <label for="lbl_id"><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                
                <label for="lbl_codigo"><b>Codigo</b></label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                <label for="lbl_nombres"><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                <label for="lbl_apellidos"><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                <label for="lbl_direccion"><b>Direccion</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #casa calle zona ciudad" required>
                <label for="lbl_telefono"><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555 5555" required>
                <label for="lbl_fn"><b>Fecha Nacimiento</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                <label for="lbl_puesto"><b>Puesto</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <% 
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_sangre();
                        for (String i: drop.keySet()){
                            out.println("<option value='" + i + "' >" + drop.get(i) + "</option>");
                    }
                    %>
                </select>
                <br> 
                <button name="bt_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                <button name="bt_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                <button name="bt_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger " onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
        
      </div>
      
    </div>
  </div>
            

                <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Nacimiento</th>
                        <th>Puesto</th>
                    </tr>
                    </thead>
                    <tbody id="tbl_empleados">
                        <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for(int t=0;t<tabla.getRowCount();t++){
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,8) +">");
                            out.println("<td>" + tabla.getValueAt(t,1) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,5) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,6) +"</td>");
                            out.println("<td>" + tabla.getValueAt(t,7) +"</td>");
                            out.println("</tr>");
                        
                        }
                        %>
                        
                    </tbody>
                </table>
                
                </div>
            
        
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
               $("#txt_id").val(0);
               $("#txt_codigo").val('');
               $("#txt_nombres").val('');
               $("#txt_apellidos").val('');
               $("#txt_direccion").val('');
               $("#txt_telefono").val('');
               $("#txt_fn").val('');
               $("#drop_puesto").val(1);
            }    
    
            $('#tbl_empleados').on('click','tr','td',function(evt){
               var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
               target = $(event.target);
               id = target.parent().data('id');
               id_p = target.parent().data('id_p');
               codigo = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               nacimiento = target.parent("tr").find("td").eq(5).html();
               $("#txt_id").val(id);
               $("#txt_codigo").val(codigo);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_fn").val(nacimiento);
               $("#drop_puesto").val(id_p);
               $("#modal_empleado").modal('show');
               
               
            });
            
        </script>
        
        </body>
</html>

