package com.redsocial.entidad;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Plato {
	private int idPlato;
	private String nombre;
	private double precio;
	private int stock;
	private String restaurant;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaVencimiento;
	private String ingrediente;
	private Pais pais;
	public int getIdPlato() {
		return idPlato;
	}
	public void setIdPlato(int idPlato) {
		this.idPlato = idPlato;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}
	public String getIngrediente() {
		return ingrediente;
	}
	public void setIngrediente(String ingrediente) {
		this.ingrediente = ingrediente;
	}
	public Pais getPais() {
		return pais;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	
	
	

}
