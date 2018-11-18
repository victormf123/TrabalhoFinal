//
//  PerfilController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 18/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class PerfilController{
    var realm = try! Realm()
    var user: Usuario = Usuario()
    
    init() {
        
    }
    
    func buscarDadosUsuario(email: String) -> Usuario {
        let user = Usuario()
        
        do {
            let usuario = try realm.objects(Usuario.self).filter("email LIKE '\(email)'")
            
            for item in usuario{
                user.foto = item.foto
                user.nome = item.nome
                user.email = item.email
                user.telefone = item.telefone
                user.lojasServidor = item.lojasServidor
            }
            
            return user
            
        } catch let error {
            print(error)
        }
    }
}
