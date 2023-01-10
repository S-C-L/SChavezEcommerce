//
//  Producto.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation

struct Producto{
    var IdProducto: Int
    var Nombre: String
    var PrecioUnitario: Double
    var Stock: Int
    var Proveedor: Proveedor
    var Departamento: Departamento
    var Descripcion: String
    var Imagen: String

    
    init(IdProducto: Int, Nombre: String, PrecioUnitario: Double, Stock: Int, Proveedor: Proveedor, Departamento: Departamento, Descripcion: String, Imagen: String) {
        self.IdProducto = IdProducto
        self.Nombre = Nombre
        self.PrecioUnitario = PrecioUnitario
        self.Stock = Stock
        self.Proveedor = Proveedor
        self.Departamento = Departamento
        self.Descripcion = Descripcion
        self.Imagen = Imagen
    }
    
}
