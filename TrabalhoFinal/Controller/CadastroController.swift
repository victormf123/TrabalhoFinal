//
//  CadastroController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 17/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class CadastroController{
    var realm = try! Realm()
    var bool: Bool
    
    init() {
       self.bool = false
    }
    
    func cadastrarUsuario(nome: String, foto: String, email: String, senha: String, telefone: String, idade: Int) -> Bool{
        
        
        let user = Usuario(value:["nome": nome, "foto" : foto, "email": email, "senha" : senha, "telefone" : telefone, "idade": idade])
        //"user-logo"
        do {
            try realm.write {
                realm.add(user)
                self.bool = true
            }
        } catch {
            self.bool = false
        }
        
        return self.bool
    }
}
