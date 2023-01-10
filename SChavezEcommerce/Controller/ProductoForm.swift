//
//  ProductoForm.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation

import UIKit

class ProductoForm: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var PrecioField: UITextField!
    @IBOutlet weak var StockField: UITextField!
    @IBOutlet weak var IdProveedorField: UITextField!
    @IBOutlet weak var IdDepartamentoField: UITextField!
    @IBOutlet weak var DescripcionField: UITextField!
    @IBOutlet weak var IdProductoField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var idProducto : Int? = nil
    let productoViewModel = ProductoViewModel()
    var productoModel : Producto? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let db = DB.init()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.isEditing = false
        validar()
    }
    
    func validar(){
        if idProducto == nil{
            imageView.image = UIImage(named: "")
        }else{
            
        }
        
        if self.idProducto == nil{
           // Acti2onButton.setTitle("Agregar", for: .normal)
            print("Error")
        }else{
            print("error")
            var result = Result()

             result = productoViewModel.GetById(Idproducto: idProducto!)
            
            if result.Correct{
                let producto = result.Object! as! Producto
                NombreField.text = producto.Nombre
                PrecioField.text = String(producto.PrecioUnitario)
                StockField.text = String(producto.Stock)
                IdProductoField.text = String(producto.Proveedor.IdProveedor)
                IdDepartamentoField.text = String(producto.Departamento.IdDepartamento)
                DescripcionField.text = producto.Descripcion
                
                  }else{
                      print("Error")
                  }
        }
      
       
      
        
            //if self.idDepartamento == nil {
       // ActionButton.setTitle("Agregar", for: .normal)
    }
    
    @IBAction func ActionButton(_ sender: UIButton) {
        guard let Nombre = NombreField.text, Nombre != "" else{
            NombreField.placeholder = "Ingrese un nombre"
            return
        }
        
        guard let stock = StockField.text, stock != "" else{
                  PrecioField.placeholder = "Ingrese el precio"
                  return
              }
        }
    
    @IBAction func btnImage() { //Boton Get All
       
        self.present(imagePicker,animated: true)
        
    }
    
    @IBAction func GetAllButton(_ sender: UIButton) { //Boton Get All
       //Get All Producto
       // let result = productoViewModel.GetAll()
        
        //GetById Producto
        var idproducto = Int(IdProductoField.text!)!
      /*  var result = productoViewModel.GetById(producto: Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "", Imagen: ""))*/
        
        var result = productoViewModel.GetById(Idproducto: idProducto!)
        
       

        
        
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        let nombreproducto = NombreField.text! //
        var preciounitario = Double(PrecioField.text!)
        var stock = Int(StockField.text!)!
        var idproveedor = Int(IdProveedorField.text!)!
        var iddepartamento = Int(IdDepartamentoField.text!)!
        let descripcion = DescripcionField.text!
       // ProductoViewModel.Add(ProductoViewModel)
        let image = imageView.image!
        let imageString : String!
        if imageView.restorationIdentifier == "User"{
            imageString = ""
        }else{
            //let imagenData = image?.pngData()
            let imageData = image.pngData()! as NSData
            imageString = imageData.base64EncodedString(options: .lineLength64Characters)
           // imageString = imagenData?.base64EncodedString(options: .lineLength64Characters)
        }
    
    
        
        productoModel = Producto(IdProducto: 0, Nombre: nombreproducto, PrecioUnitario: preciounitario!, Stock: stock.self, Proveedor:Proveedor.init(IdProveedor: idproveedor, Nombre: "", Telefono: ""), Departamento: Departamento.init(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: descripcion, Imagen: imageString)
        
        let result = productoViewModel.Add(producto: productoModel!)
        if result.Correct{
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Producto Agregado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.NombreField.text = ""
                       self.PrecioField.text = ""
                       self.StockField.text = ""
                       self.IdProveedorField.text = ""
                       self.IdDepartamentoField.text = ""
                       self.DescripcionField.text = ""
                       self.imageView.image = nil
                      
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
       
            
               }
               else{
                   let alert = UIAlertController(title: "Error", message: "Error al agregar el Producto " + result.ErrorMessage, preferredStyle: .alert)
                   let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                     })
                   
                   alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
               }
        
    }
    
 
    
    @IBAction func NombreEndEdit(_ sender: UITextField) {
          if NombreField.text == ""{
              NombreField.placeholder = "Escribe un nombre"
              NombreField.backgroundColor = .red
          }else
          {
              NombreField.placeholder = ""
              NombreField.backgroundColor = .tertiarySystemFill
          }
        
      }
    
    @IBAction func PrecioEndEdit(_ sender: UITextField) {
        
            if PrecioField.text == ""{
            PrecioField.placeholder = "Escribe el precio Unitario"
            PrecioField.backgroundColor = .red
        }else{
            PrecioField.placeholder = ""
            PrecioField.backgroundColor = .tertiarySystemFill
        }

      }

    @IBAction func StockEndEdit(_ sender: UITextField) {
        
        if StockField.text == ""{
            StockField.placeholder = "Escribe el Stock"
            StockField.backgroundColor = .red
        
        }else{
            StockField.placeholder = ""
            StockField.backgroundColor = .tertiarySystemFill
         
        }
      }
    
    
    @IBAction func IdProveedorEndEdit(_ sender: UITextField) {
        if IdProveedorField.text == ""{
            IdProveedorField.placeholder = "Escribe el Id del Proveedor"
            IdProveedorField.backgroundColor = .red
        }else{
            IdProveedorField.placeholder = ""
            IdProveedorField.backgroundColor = .tertiarySystemFill
        }
    }
    
    
    @IBAction func IdDepartamentoEndEdit(_ sender: UITextField) {
        if IdDepartamentoField.text == ""{
            IdDepartamentoField.placeholder = "Escribe el Id del departamento"
            IdDepartamentoField.backgroundColor = .red
        }else{
            IdDepartamentoField.placeholder = ""
            IdDepartamentoField.backgroundColor = .tertiarySystemFill
        }
    }
    
    
    @IBAction func DewscripcionEndEdit(_ sender: UITextField) {
        if DescripcionField.text == ""{
            DescripcionField.placeholder = "Escribe la descripcion"
            DescripcionField.backgroundColor = .red
        }else{
            DescripcionField.placeholder = ""
            DescripcionField.backgroundColor = .tertiarySystemFill
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true,completion: nil)
    }
    
    
    @IBAction func UpdateButton(_ sender: UIButton) { //Boton Actualizar
        var idproducto = Int(IdProductoField.text!)!
        let nombreproducto = NombreField.text!
        var preciounitario = Double(PrecioField.text!)!
        var stock = Int(StockField.text!)!
        var idproveedor = Int(IdProveedorField.text!)!
        var iddepartamento = Int(IdDepartamentoField.text!)!
        let descripcion = DescripcionField.text!
        
       productoModel =  Producto(IdProducto: idproducto, Nombre: nombreproducto, PrecioUnitario: preciounitario, Stock: stock, Proveedor: Proveedor.init(IdProveedor: idproveedor, Nombre: "", Telefono: ""), Departamento: Departamento.init(IdDepartamento: iddepartamento, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: descripcion,Imagen: "")
        
        let result = productoViewModel.Update(producto: productoModel!)
        
      
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Producto Actualizado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.NombreField.text = ""
                       self.PrecioField.text = ""
                       self.StockField.text = ""
                       self.IdProveedorField.text = ""
                       self.IdDepartamentoField.text = ""
                       self.DescripcionField.text = ""
                     })
                   
                  // alert.addAction(ok)
                   alert.addAction(Aceptar)
                   self.present(alert,animated: false)
       
        
               
    }
    
    
    @IBAction func DeleteButton(_ sender: UIButton) {
        var idproducto = Int(IdProductoField.text!)!
        
        productoModel =  Producto(IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Proveedor: Proveedor.init(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento.init(IdDepartamento: 0, NombreDepartamento: "", IdArea: Area(IdArea: 0, Nombre: "")), Descripcion: "",Imagen: "")
        
        let result = productoViewModel.Delete(producto: productoModel!)
        
        if idproducto == nil{
            //Mensaje de Confirmacion
            let alert = UIAlertController(title: "Atencion", message: "Colocar un Id de Producto"+result.ErrorMessage, preferredStyle: .alert)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                self.IdProductoField.text = ""
               
              })
            
           // alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
        
        if result.Correct{
                   //Mensaje de Confirmacion
                   let alert = UIAlertController(title: "Confirmación", message: "Producto Eliminado Correctamente"+result.ErrorMessage, preferredStyle: .alert)
                  // let ok = UIAlertAction(title: "Cerrar", style: .default)
                   
                   let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                       self.IdProductoField.text = ""
                       self.NombreField.text = ""
                       self.PrecioField.text = ""
                       self.StockField.text = ""
                       self.IdProveedorField.text = ""
                       self.IdDepartamentoField.text = ""
                       self.DescripcionField.text = ""
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
