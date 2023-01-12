//
//  Rol.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 12/01/23.
//

import Foundation

struct Rols{
    var idRol: Int
    var nombreRol: String
    
    init(nombreRol: String, idRol: Int) {
        self.nombreRol = nombreRol
        self.idRol = idRol
    }
    
    init(){
        self.idRol = 0
        self.nombreRol = ""
    }
}
