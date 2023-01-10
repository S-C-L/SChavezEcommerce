//
//  DepartamentoForm.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 05/01/23.
//

import Foundation
import UIKit

class DepartamentoForm: UIViewController{
    /*@IBOutlet weak var NombreAreaField: UITextField!
    @IBAction func NombreAreaField(_ sender: UITextField) {
    }*/
    
    @IBOutlet weak var IdDepartamentoField: UITextField!
    @IBOutlet weak var IdAreaField: UITextField!
    @IBOutlet weak var NombreDepaField: UITextField!
    
     var idDepartamento : Int? = nil
     let departamentoViewModel = DepartamentoViewModel()
     var departamentoModel : Departamento? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // let db = DB.init()
        validar()
    }
    
    func validar(){
        let db = DB.init()
    }
    
    @IBAction func DepartamentoGetAll(_ sender: UIButton) {
        //Get All Departamento
        let result = departamentoViewModel.GetAll()
        
        //GetById Departamento
       /* var iddepartamento = Int(IdDepartamentoField.text!)!
        var resul = departamentoViewModel.GetById(departamento: Departamento(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")))*/
    
        
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        let nombredepartamento = NombreDepaField.text!
        var IdArea = Int(IdAreaField.text!)!
        
        departamentoModel = Departamento(IdDepartamento: 0, NombreDepartamento: nombredepartamento, IdArea: Area(IdArea: IdArea, Nombre: ""))
        
        let result = departamentoViewModel.Add(departamento: departamentoModel!)
        
        if result.Correct{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Confirmación", message: "Departamento Agregado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
           // let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.NombreDepaField.text = ""
                self.IdAreaField.text = ""
              })
            // alert.addAction(ok)
             alert.addAction(Aceptar)
             self.present(alert,animated: false)
        }else{
            let alert = UIAlertController(title: "Error", message: "Error al agregar el Producto " + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
    }
    
    @IBAction func UpdateButton(_ sender: UIButton) { //Boton Actualizar
        let nombredepartamento = NombreDepaField.text!
        var IdArea = Int(IdAreaField.text!)!
        var iddepartamento = Int(IdDepartamentoField.text!)!
        
        
        departamentoModel = Departamento(IdDepartamento: iddepartamento, NombreDepartamento: nombredepartamento, IdArea: Area(IdArea: IdArea, Nombre: ""))
        
       // departamentoModel = Departamento(IdDepartamento: <#T##Int#>, NombreDepartamento: <#T##String#>, IdArea: Area())
    
        let result = departamentoViewModel.Update(departamento: departamentoModel!)
    
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Departamento Actualizado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.IdDepartamentoField.text = ""
                       self.NombreDepaField.text = ""
                       self.IdAreaField.text = ""
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
    }
    
    
    @IBAction func DeleteButton(_ sender: UIButton) {
        var iddepartamento = Int(IdDepartamentoField.text!)!
        
     /*   productoModel =  Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor.init(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento.init(IdDepartamento: 0, Nombre: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "",Imagen: "")*/
        
       // departamentoModel = Departamento()
        departamentoModel = Departamento(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: ""))
        
        let result = departamentoViewModel.Delete(departamento: departamentoModel!)
        
        if iddepartamento == nil{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Atencion", message: "Colocar un Id de Departamento"+result.ErrorMessage, preferredStyle: .alert)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.IdDepartamentoField.text = ""
              })
            
           // alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        
        if result.Correct{
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Departamento Eliminado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.IdDepartamentoField.text = ""
                       self.NombreDepaField.text = ""
                       self.IdAreaField.text = ""
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
       
            
               }
               else{
                   let alert = UIAlertController(title: "Error", message: "Error al Eliminar el Producto " + result.ErrorMessage, preferredStyle: .alert)
                 //  let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
               }
       
        
    }
    
 

    
    
}
