//
//  UsuarioForm.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 10/01/23.
//

import Foundation
import UIKit

class UsuarioForm: UIViewController{
    
    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var FechaNacimiento: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var SexoField: UITextField!
    @IBOutlet weak var TelefonoField: UITextField!
    @IBOutlet weak var CelularField: UITextField!
    @IBOutlet weak var CurpField: UITextField!
    @IBOutlet weak var RolField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var IdUsuario: UITextField!
    
    
    var idUsuario : Int? = nil
    let usuarioViewModel = UsuarioViewModel()
    var usuarioModel : Usuarios? = nil
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
      /*  var usuario = Usuarios()
         usuario.nombre = "Samuel"
         usuario.apellidoPaterno = "Chavez"
         // usuario.fechaNacimiento =
         usuario.email = "prueba1@gmail.com"
         usuario.password = "123456"
         
         
         usuarioViewModel.Add(usuario: usuario)*/
         
    }
    
    @IBAction func AddButtonRol(_ sender: UIButton) { //Boton Get All
        let nombrerol = NombreField.text!
        
    }
    
    @IBAction func AddButton(_ sender: UIButton) { //Boton Get All
        let nombreusuario = NombreField.text!
        let apellidopaterno = ApellidoPaternoField.text!
        let apellidomaterno = ApellidoMaternoField.text!
        let fechanacimiento = Date()
        let email = Email.text!
        let password = Password.text!
        let username = UserNameField.text!
        let sexo = SexoField.text!
        let telefono = TelefonoField.text!
        let celular = CelularField.text!
        let curp = CurpField.text!
        let rol = Int(RolField.text!)!
     
        let usuario = Usuarios(nombre: nombreusuario, apellidoPaterno: apellidopaterno, apellidoMaterno: apellidomaterno,fechaNacimiento: Date(), email: email, password: password, userName: username, sexo: sexo, telefono: telefono, celular: celular, curp: curp, imagen: "", rol: Rols(nombreRol: "", idRol: rol))
        
        //usuarioViewModel.Add(usuario: usuario)
       // usuarioViewModel.Add(nombre: nombreusuario, apellidoPaterno: apellidopaterno, fechaNacimiento: Date(), email: email, password: password)
        
      //  let result2 = usuarioViewModel.Add(usuario: usuario)
        let result =   usuarioViewModel.Add(nombre: nombreusuario, apellidoPaterno: apellidomaterno, apellidoMaterno: apellidomaterno, fechaNacimiento: fechanacimiento, email: email, password: password, userName: username, sexo: sexo, telefono: telefono, celular: celular, curp: curp, rol: rol)
        
        if result.Correct{
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Usuario Agregado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.NombreField.text = ""
                       self.ApellidoPaternoField.text = ""
                       self.FechaNacimiento.text = ""
                       self.Email.text = ""
                       self.Password.text = ""
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
       
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Error al agregar el Usuario " + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        
    }
    
    
    
    @IBAction func GetAllButton(_ sender: UIButton) { //Boton Get All
        let result = usuarioViewModel.GetAll()
 
            }
    
    
    @IBAction func GetByIdButton(_ sender: UIButton) { //Boton Get All
        //GetById Producto
        //var idproducto = Int(IdProductoField.text!)!
      /*  var result = productoViewModel.GetById(producto: Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))*/
        var idusuario = Int(IdUsuario.text!)!
        let result = usuarioViewModel.GetById(IdUsuario: idusuario)
 
            }
    
    
    @IBAction func UpdateButton(_ sender: UIButton) { //Boton Update
       // let result = usuarioViewModel.GetAll()
        var idusuario = Int(IdUsuario.text!)!
        let nombreusuario = NombreField.text!
        let apellidopaterno = ApellidoPaternoField.text!
        let apellidomaterno = ApellidoMaternoField.text!
        let email = Email.text!
        let password = Password.text!
        let username = UserNameField.text!
        let sexo = SexoField.text!
        let telefono = TelefonoField.text!
        let celular = CelularField.text!
        let curp = CurpField.text!
    
        
      
        let usuario = Usuarios(nombre: nombreusuario, apellidoPaterno: apellidopaterno, apellidoMaterno: "" ,fechaNacimiento: Date(), email: email, password: password, userName: "", sexo: "", telefono: "", celular: "", curp: "", imagen: "", rol: Rols(nombreRol: "", idRol: 0))
        
       
      //  usuarioViewModel.Update(IdUsuario: idusuario, Nombre: nombreusuario, Apaterno: apellidopaterno, Email: email, Password: password)
       
        let result = usuarioViewModel.Update(IdUsuario: idusuario, Nombre: nombreusuario, Apaterno: apellidopaterno, Amaterno: apellidomaterno, Email: email, Password: password, Username: username, Sexo: sexo, Telefono: telefono, Celular: celular, CURP: curp)
        
        if result.Correct == true{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Confirmación", message: "Usuario Actualizado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
           // let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.IdUsuario.text = ""
                self.NombreField.text = ""
                self.ApellidoPaternoField.text = ""
                self.ApellidoMaternoField.text = ""
                self.FechaNacimiento.text = ""
                self.Email.text = ""
                self.Password.text = ""
                self.UserNameField.text = ""
                self.SexoField.text = ""
                self.TelefonoField.text = ""
                self.CelularField.text = ""
                self.RolField.text = ""
                self.CurpField.text = ""
              })
            
           // alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)

        }else{
            let alert = UIAlertController(title: "Error", message: "Error al actualizar el Usuario " + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        
            }
    
    @IBAction func DeleteButton(_ sender: UIButton) { //Boton Get All]
      
        var idusuario = Int(IdUsuario.text!)!
        let result = usuarioViewModel.Delete(IdUsuario: idusuario)
        
        if result.Correct == false{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Confirmación", message: "Usuario Eliminado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
           // let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.IdUsuario.text = ""
              })
            
           // alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)

        }else{
            
            let alert = UIAlertController(title: "Error", message: "Error al eliminar el Usuario " + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)

        }
    }
}
