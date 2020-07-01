<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Elizabeth Liñan </title>
</head>
<body> 

 <div class="container">
 <h1>Crud de Plato</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudPlato">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudPlato" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Stock</th>
												<th>Restaurant</th>
												<th>Fecha Vencimiento</th>
												<th>Ingrediente</th>
												<th>Pais</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${platos}" var="x">
													<tr>
														<td>${x.idPlato}</td>
														<td>${x.nombre}</td>
														<td>${x.precio}</td>
														<td>${x.stock}</td>
														<td>${x.restaurant}</td>
														<td>${x.fechaVencimiento}</td>
														<td>${x.ingrediente}</td>
														<td>${x.pais.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idPlato}','${x.nombre}','${x.precio}','${x.stock}','${x.restaurant}','${x.fechaVencimiento}','${ x.ingrediente}','${x.pais.idPais}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idPlato}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de plato</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudPlato" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Plato</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_stock" name="stock" placeholder="Ingrese el stock" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_restaurant">Restaurant</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_restaurant" name="restaurant" placeholder="Ingrese la edad máxima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaVencimiento">Fecha Vencimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaVencimiento" name="fechaVencimiento" placeholder="Ingrese Fecha Vencimiento" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ingrediente">Ingrediente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_ingrediente" name="ingrediente" placeholder="Ingrese Ingrediente" type="text" maxlength="2"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_deporte" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Plato</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudPlato" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Plato</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idPlato" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_stock" name="stock" placeholder="Ingrese el stock" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_restaurant">Restaurant</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_restaurant" name="restaurant" placeholder="Ingrese restaurant" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaVencimiento">Fecha Vencimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaVencimiento" name="fechaVencimiento" placeholder="Ingrese la fechaVencimiento" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ingrediente">Ingrediente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_ingrediente" name="ingrediente" placeholder="Ingrese ingrediente" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_act_deporte" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,precio,stock,restaurant, fechaVencimiento, ingrediente,idPais){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_precio]').val(precio);
	$('input[id=id_act_stock]').val(stock);
	$('input[id=id_act_restaurant]').val(restaurant);
	$('input[id=id_act_fechaVencimiento]').val(fechaVencimiento);
	$('input[id=id_act_ingrediente]').val(ingrediente);
	$('select[id=id_act_pais]').val(idPais);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "precio": {
        		selector : '#id_reg_precio',
                validators: {
                    notEmpty: {
                        message: 'El precio es un campo obligatorio'
                    },
                   
                }
            },
            "stock": {
        		selector : '#id_reg_stock',
                validators: {
                	notEmpty: {
                        message: 'El stock  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El stock es de 1 a 100 caracteres',
                    	min : 1,
                    	max : 100
                    }
                  
                }
            },
            "restaurant": {
        		selector : '#id_reg_restaurant',
                validators: {
                	notEmpty: {
                        message: 'El restaurant  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El restaurant es de 10 a 100 caracteres',
                    	min : 10,
                    	max : 100
                    }
                    
                }
            },
            
            "fechaVencimiento": {
        		selector : '#id_reg_fechaVencimiento',
                validators: {
                	notEmpty: {
                        message: 'La fechaVencimiento es un campo obligatorio'
                    },
                   
                }
            },

            "ingrediente": {
        		selector : '#id_reg_ingrediente',
                validators: {
                	notEmpty: {
                        message: 'El ingrediente es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El ingrediente es de 10 a 100 caracteres',
                    	min : 10,
                    	max : 100
                    }
                   
                }
            },
            
            "pais.idPais": {
        		selector : '#id_reg_pais',
                validators: {
                	notEmpty: {
                        message: 'El pais es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "precio": {
        		selector : '#id_act_precio',
                validators: {
                    notEmpty: {
                        message: 'El precio es un campo obligatorio'
                    },
                   
                }
            },
            "stock": {
        		selector : '#id_act_stock',
                validators: {
                	notEmpty: {
                        message: 'El stock  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El stock es de 1 a 100 caracteres',
                    	min : 1,
                    	max : 100
                    }
                  
                }
            },
            "restaurant": {
        		selector : '#id_act_restaurant',
                validators: {
                	notEmpty: {
                        message: 'El restaurant  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El restaurant es de 10 a 100 caracteres',
                    	min : 10,
                    	max : 100
                    }
                    
                }
            },
            
            "fechaVencimiento": {
        		selector : '#id_act_fechaVencimiento',
                validators: {
                	notEmpty: {
                        message: 'La fechaVencimiento es un campo obligatorio'
                    },
                   
                }
            },

            "ingrediente": {
        		selector : '#id_act_ingrediente',
                validators: {
                	notEmpty: {
                        message: 'El ingrediente es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El ingrediente es de 10 a 100 caracteres',
                    	min : 10,
                    	max : 100
                    }
                   
                }
            },
            
            "pais.idPais": {
        		selector : '#id_act_pais',
                validators: {
                	notEmpty: {
                        message: 'El Pais un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 