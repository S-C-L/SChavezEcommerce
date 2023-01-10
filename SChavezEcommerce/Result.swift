//
//  Result.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 04/01/23.
//

import Foundation

struct Result{
    var Correct: Bool
    var Ex: Error?
    var ErrorMessage: String
    var Object: Any?
    var Objects: [Any]?
    
    
    init(Correct: Bool, Ex: Error?, ErrorMessage: String, Object: Any?, Objects: [Any]?) {
        self.Correct = Correct
        self.Ex = Ex
        self.ErrorMessage = ErrorMessage
        self.Object = Object
        self.Objects = Objects
    }
    
    init(){
        self.Correct = false
        self.Ex = nil
        self.ErrorMessage = ""
        self.Object = nil
        self.Objects = nil
    }
}

