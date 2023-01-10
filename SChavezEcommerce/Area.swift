//
//  Area.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation



struct Area{
    var IdArea: Int
    var Nombre: String
    
    init(IdArea: Int, Nombre: String) {
        self.IdArea = IdArea
        self.Nombre = Nombre
    }
    
    init(){
        self.IdArea = 0
        self.Nombre = ""
    }
}
