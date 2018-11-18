//
//  LoginController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 18/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class LoginCOntroller{
    
    var realm = try! Realm()
    
    init() {
        
    }
    
    func login(email: String, senha: String) -> Bool {
        
        do {
            let usuario = try realm.objects(Usuario.self).filter("email == '\(email)' AND senha == '\(senha)'")
            
            if !usuario.isEmpty{
                return true
                
            }else{
                return false
            }
            
        } catch let erro {
            print(erro)
            return false
        }
    }
}
