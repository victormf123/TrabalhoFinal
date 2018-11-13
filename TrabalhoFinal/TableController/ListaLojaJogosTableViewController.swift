//
//  ListaLojaJogosTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 13/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ListaLojaJogosTableViewController: UITableViewController {
    var nomeLista: String!
    var realm = try! Realm()
    var listaLojas: List<Loja>!
    var logo = UIImage(named: "header-bahianinho")
    var videogame = UIImage(named: "video-game")
    var pc = UIImage(named: "pc")
    var like = UIImage(named: "like")
    var liked = UIImage(named: "liked")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lojas = realm.objects(Favorito.self).filter("nome LIKE '\(self.nomeLista! )'")
        for item in lojas {
            listaLojas = item.lojas
        }
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaLojas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let itemLoja = listaLojas[indexPath.row]
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ListaCelula
        celula.logo.image = UIImage(named: itemLoja.iconeGrande)
        celula.videogames.image = itemLoja.vendeJogos ? videogame : nil
        celula.computador.image = itemLoja.vendeComputador ? pc : nil
        celula.like.image = itemLoja.favorita ? liked : like
        celula.titulo.text = itemLoja.nome
        return celula
    }
}
