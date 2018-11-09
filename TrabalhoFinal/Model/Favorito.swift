//
//  Favorito.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 08/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Favorito: Object {
    @objc dynamic var nome: String = ""
    let lojas = List<Loja>()
    
    override static func primaryKey() -> String? {
        return "nome"
    }
    
    convenience init(nome: String, lojas: List<Loja> = List<Loja>()) {
        self.init()
        self.nome = nome
        self.lojas.append(objectsIn: lojas)
    }
}
