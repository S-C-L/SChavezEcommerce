//
//  Usuario.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 10/01/23.
//

import Foundation


struct Usuarios{
    var nombre: String
    var apellidoPaterno: String
    var apellidoMaterno: String
    var fechaNacimiento: Date?
    var email: String
    var password: String
    var userName: String
    var sexo: String
    var telefono: String
    var celular: String
    var curp: String
    var imagen: String
    var rol: Rols
   
    
    init(nombre: String, apellidoPaterno: String, apellidoMaterno: String, fechaNacimiento: Date, email: String, password: String, userName: String,sexo: String, telefono: String, celular: String,curp: String,imagen:String, rol: Rols) {
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.fechaNacimiento = fechaNacimiento
        self.email = email
        self.password = password
        self.userName = userName
        self.sexo = sexo
        self.telefono = telefono
        self.celular = celular
        self.curp = curp
        self.imagen = imagen
        self.rol = rol
    }
    
    init(){
        self.init(nombre: "", apellidoPaterno: "", apellidoMaterno: "", fechaNacimiento: Date(), email: "", password: "", userName: "", sexo: "", telefono: "", celular: "", curp: "", imagen: "", rol: Rols(nombreRol: "", idRol: 0))
    }
}
