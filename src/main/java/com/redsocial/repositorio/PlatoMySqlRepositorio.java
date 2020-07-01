package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Pais;
import com.redsocial.entidad.Plato;
@Repository
public class PlatoMySqlRepositorio implements PlatoRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<Plato>mapperPlato=new RowMapper<Plato>() {
		@Override
		public Plato mapRow(ResultSet rs, int rowNum) throws SQLException {
         Plato obj = new Plato();
         obj.setIdPlato(rs.getInt(1));
         obj.setNombre(rs.getString(2));
			obj.setPrecio(rs.getDouble(3));
			obj.setStock(rs.getInt(4));
			obj.setRestaurant(rs.getString(5));
			obj.setFechaVencimiento(rs.getDate(6));
			obj.setIngrediente(rs.getString(7));
			
			Pais objPais=new Pais();
			objPais.setIdPais(rs.getInt(8));
			objPais.setNombre(rs.getString(9));
			
			obj.setPais(objPais);
			return obj;
		}	
	};
	
	@Override
	public Plato insertaActualizaPlato(Plato obj) {
		Plato salida = null;
		if (obj.getIdPlato() == 0) {
			jdbcTemplate.update("insert into plato values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getPrecio(), obj.getStock(), obj.getRestaurant(),obj.getFechaVencimiento(),obj.getIngrediente(),obj.getPais().getIdPais()});	
			List<Plato> lista = jdbcTemplate.query("select m.*,p.nombre from plato m inner join pais p on m.idPais = p.idpais order by m.idplato desc limit 0, 1",new Object[] {} ,mapperPlato);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update plato set nombre=?,precio=?,stock=?,restaurant=?,fechaVencimiento=?, ingrediente=? ,idpais = ? where idplato=?", new Object[] {obj.getNombre(), obj.getPrecio(), obj.getStock(), obj.getRestaurant(),obj.getFechaVencimiento(),obj.getIngrediente(),obj.getPais().getIdPais(), obj.getIdPlato()});
			List<Plato> lista = jdbcTemplate.query("select m.*,p.nombre from plato m inner join pais p on m.idPais =  p.idpais where idplato =?",new Object[] {obj.getIdPlato()} ,mapperPlato);
			salida = lista.get(0);
		}
         	return salida;
	}

	@Override
	public void eliminaPlato(int idPlato) {
		jdbcTemplate.update("delete from plato where idplato = ?",new Object[] {idPlato});
		
	}

	@Override
	public List<Plato> listaPlato() {
		List<Plato> lista = jdbcTemplate.query("select m.*,p.nombre from plato m inner join pais p on m.idpais = p.idplato", new Object[] {} ,mapperPlato);
		return lista;
	}

	@Override
	public List<Plato> listaPlatoPorNombre(String filtro) {
		List<Plato> lista = jdbcTemplate.query("select m.*,p.nombre from plato m inner join pais p on m.idpais = p.idplato where m.nombre like ?", new Object[] {filtro} ,mapperPlato);
		return lista;
	}

	@Override
	public List<Plato> listaPlato(int idPais, String nombre) {
		List<Plato> lista = jdbcTemplate.query("select m.*,p.nombre from plato m inner join pais p on m.idpais = p.idpais where m.p.idpais =? and m.nombre like ? ", new Object[] {idPais, nombre} ,mapperPlato);
		return lista;
	}

}
