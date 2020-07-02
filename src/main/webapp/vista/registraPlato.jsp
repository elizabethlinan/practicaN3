<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%><!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Elizabeth Liñan </title>
</head>
<body>
<div class="container">
<h1>Registra Plato</h1>
	<form action="registraPlato" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_precio">Precio</label>
				<input class="form-control" id="id_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_stock">Stock</label>
				<input class="form-control" id="id_stock" name="stock" placeholder="Ingrese elstock" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_restaurant">Restaurant</label>
				<input class="form-control" id="id_restaurant" name="restaurant" placeholder="Ingrese restaurant" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaVencimiento">Fecha Vencimiento</label>
				<input class="form-control" id="id_fechaVencimiento" name="fechaVencimiento" placeholder="Ingrese la fechaVencimiento" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ingrediente">Ingrediente</label>
				<input class="form-control" id="id_ingrediente" name="ingrediente" placeholder="Ingrese ingrediente" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">Pais</label>
				<select id="id_deporte" name="pais.idPais" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Plato</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
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
        precio: {
    		selector : '#id_precio',
            validators: {
                notEmpty: {
                    message: 'El precio es un campo obligatorio'
                },
               
            }
        },
        stock: {
    		selector : '#id_stock',
            validators: {
            	notEmpty: {
                    message: 'El stock es un campo obligatorio'
                },
            }
        },
        restaurant: {
    		selector : '#id_restaurant',
            validators: {
            	notEmpty: {
                    message: 'el restaurantes un campo obligatorio'
                },
                
            }
        },
        fechaVencimiento: {
    		selector : '#id_fechaVencimiento',
            validators: {
            	notEmpty: {
                    message: 'La fechaVencimiento es un campo obligatorio'
                },
                
            }
        },
        ingrediente: {
    		selector : '#id_ingrediente',
            validators: {
            	notEmpty: {
                    message: 'El ingrediente es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 10 a 100 caracteres',
                	min : 10,
                	max : 100
                }
            }
        },

        
        pais: {
    		selector : '#id_pais',
            validators: {
            	notEmpty: {
                    message: 'El pais un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




