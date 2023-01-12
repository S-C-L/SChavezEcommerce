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
    var fechaNacimiento: Date?
    var email: String
    var password: String
    
    init(nombre: String, apellidoPaterno: String, fechaNacimiento: Date, email: String, password: String) {
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.fechaNacimiento = fechaNacimiento
        self.email = email
        self.password = password
    }
    
    init(){
        self.nombre = ""
        self.apellidoPaterno = ""
        self.fechaNacimiento = nil
        self.email = ""
        self.password = ""
    }
}
