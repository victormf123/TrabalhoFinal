//
//  LojasController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 18/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class LojasController{
    var favoritos: Results<Favorito>!
    var realm = try! Realm()
    
    init() {
        
    }
    
    func BuscarListasFavoritosUsuario() ->  Results<Favorito>{
        let listaFavoritos: Results<Favorito> = realm.objects(Favorito.self).sorted(byKeyPath: "nome", ascending: true)
        
        return listaFavoritos
    }
    
    func BuscarListaLojas() -> Results<Loja> {
        let listaLojas: Results<Loja> = realm.objects(Loja.self).sorted(byKeyPath: "nome", ascending: true)
        
        return listaLojas
    }
    
    func BuscarItemListasLoja(nome: String) -> Results<Loja> {
        let listaLojasJogos: Results<Loja> = realm.objects(Loja.self).filter("nome LIKE '\(nome )'")
        
        return listaLojasJogos
    }
    func BuscarItensListasFavoritos(nome: String) -> Results<Favorito> {
        let listaJogos: Results<Favorito> = realm.objects(Favorito.self).filter("nome LIKE '\(nome)'")
        return listaJogos
    }
    
    
    
    
}
