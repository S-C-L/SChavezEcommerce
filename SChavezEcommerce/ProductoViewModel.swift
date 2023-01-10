//
//  ProductoViewModel.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation
import SQLite3

class ProductoViewModel{
    
    let ProductoModel: Producto? = nil //Concatenamos el Modelo de producto para tener acceso a sus propiedades.
    
    func Add(producto: Producto)-> Result { //Funcion Agregar
        var result = Result()
        let context = DB.init()
        var idproducto: Int
        //let db = DB.init()
        let query = "INSERT INTO Producto(Nombre,PrecioUnitario,Stock,IdProveedor,IdDepartamento,Descripcion,Imagen) VALUES(?,?,?,?,?,?,?)"
        var statement : OpaquePointer? = nil
        
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (producto.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_double(statement, 2, producto.PrecioUnitario)
                sqlite3_bind_int(statement, 3, (producto.Stock as NSNumber).int32Value)
                sqlite3_bind_int(statement, 4, (producto.Proveedor.IdProveedor as NSNumber).int32Value)
                sqlite3_bind_int(statement, 5, (producto.Departamento.IdDepartamento as NSNumber).int32Value)
                sqlite3_bind_text(statement, 6, (producto.Descripcion as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 7, (producto.Imagen as NSString).utf8String, -1, nil)
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
            print(statement)
                print("Producto agregado correctamente")
                print(producto.Nombre)
                print(producto.PrecioUnitario)
                print(producto.Stock)
                print(producto.Proveedor.IdProveedor)
                print(producto.Departamento.IdDepartamento)
                print(producto.Descripcion)
                print(producto.Imagen)
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error no se pudo agregar el producto")
            
        }
        return result
    }
    
    func Update(producto: Producto)-> Result{ //Funcion Actualizar?
        var result = Result()
        let context = DB.init()
        let query = "UPDATE Producto SET Nombre=?,PrecioUnitario=?,Stock=?,IdProveedor=?,IdDepartamento=?,Descripcion=?, Imagen=? WHERE IdProducto=\(producto.IdProducto)"
        //NSString *sqlString = @"UPDATE field SET name=?, type=?, state=? where _id=?";
        var statement : OpaquePointer? = nil
        
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
               // sqlite3_bind_int(statement, 0, (producto.IdProducto as NSNumber).int32Value)
                sqlite3_bind_text(statement, 1, (producto.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_double(statement, 2, producto.PrecioUnitario)
                sqlite3_bind_int(statement, 3, (producto.Stock as NSNumber).int32Value)
                sqlite3_bind_int(statement, 4, (producto.Proveedor.IdProveedor as NSNumber).int32Value)
                sqlite3_bind_int(statement, 5, (producto.Departamento.IdDepartamento as NSNumber).int32Value)
                sqlite3_bind_text(statement, 6, (producto.Descripcion as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 7, (producto.Imagen as NSString).utf8String, -1, nil)
                
                print("Producto Actualizado correctamente")
               // print(producto.IdProducto)
                print(producto.Nombre)
                print(producto.PrecioUnitario)
                print(producto.Stock)
                print(producto.Proveedor.IdProveedor)
                print(producto.Departamento.IdDepartamento)
                print(producto.Descripcion)
                
                if (sqlite3_step(statement) > 0)
                                   {
                                       print("Correcto")
                                   }
                                   else
                                   {
                                       result.Correct = false;
                                       result.ErrorMessage = "Error al Actualizar Usuario";
                                   }
                
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                } else{
                    result.Correct = false
                }
                
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error al actualizar registro")
        }
        return result
    }
    
    func Delete(producto: Producto) -> Result{ //Funcion Eliminar
        var result = Result()
        let context = DB.init()
        let query = "Delete From Producto Where IdProducto = \(producto.IdProducto)"
        //Delete from Producto Where IdProducto = 9;
        var statement : OpaquePointer? = nil
        
        do{
                if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                    sqlite3_bind_int(statement, 0, (producto.IdProducto as NSNumber).int32Value)
                    
                  /* sqlite3_bind_text(statement, 1, (producto.Nombre as NSString).utf8String, -1, nil)
                    sqlite3_bind_double(statement, 2, producto.PrecioUnitario)
                    sqlite3_bind_int(statement, 3, (producto.Stock as NSNumber).int32Value)
                    sqlite3_bind_int(statement, 4, (producto.Proveedor.IdProveedor as NSNumber).int32Value)
                    sqlite3_bind_int(statement, 5, (producto.Departamento.IdDepartamento as NSNumber).int32Value)
                    sqlite3_bind_text(statement, 6, (producto.Descripcion as NSString).utf8String, -1, nil)*/
                              
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
                print ("Registro Eliminado Correctamente")
            }
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
            print("Error al eliminar registro")
        }
        return result
        
    }
    
    
    func GetAll()-> Result{ // Funcion Mostrar todos los registros
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdProducto,Nombre, PrecioUnitario,Stock,Descripcion,Imagen FROM Producto"
        var statement : OpaquePointer? = nil
     
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
  
                    var producto = Producto(IdProducto: 0, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "",Imagen: "")
                    producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                    producto.Nombre = String(cString: sqlite3_column_text(statement, 1))
                    producto.PrecioUnitario = Double(sqlite3_column_double(statement, 2))
                    producto.Stock = Int(sqlite3_column_int(statement, 3))
                    producto.Descripcion = String(cString: sqlite3_column_text(statement, 4))
                    
                   
                    
                  //  producto.Imagen = String(cString: sqlite3_column_text(statement, 7))
                    if sqlite3_column_text(statement, 5) != nil{
                        producto.Imagen = String(cString: sqlite3_column_text(statement, 5))
                    }else{
                        producto.Imagen = ""
                        
                    }
                    
                    /*if sqlite3_column_text(statement, 7) != nil {
                        //producto.Imagen = "Nombre por default"
                        producto.Imagen = String(cString: sqlite3_column_text(statement, 7))
                    
                    }else{
                        producto.Imagen = "Nombre por default"
                    }*/
                  
                    result.Objects?.append(producto)
                  // print(producto)
                   // print(producto.Imagen)
                    
                }
                result.Correct = true
            }
                
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetById(Idproducto: Int)-> Result{ // Funcion Mostrar todos los registros
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdProducto,Nombre, PrecioUnitario,Stock,Descripcion FROM Producto WHERE IdProducto = \(Idproducto)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var producto = Producto(IdProducto: 0, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento:"", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: "")
                    producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                    producto.Nombre = String(cString: sqlite3_column_text(statement, 1))
                    producto.PrecioUnitario = Double(sqlite3_column_double(statement, 2))
                    producto.Stock = Int(sqlite3_column_int(statement, 3))
                    producto.Descripcion = String(cString: sqlite3_column_text(statement, 4))
                    //producto.Imagen = String(cString: sqlite3_column_text(statement, 5))
                    
                    
                /*    result.Objects?.append(producto)
                    print(producto)*/
                    result.Object = producto
                    print(producto)
                }
                result.Correct = true
            }
                
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
}
