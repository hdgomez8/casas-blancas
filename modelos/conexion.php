<?php

Class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost;dbname=u313789561_reservasHotel",
						"u313789561_root",
						"Orion1225***");

		$link->exec("set names utf8");

		return $link;

	}


}