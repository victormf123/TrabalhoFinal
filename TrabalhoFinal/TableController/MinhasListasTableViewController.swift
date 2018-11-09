//
//  MinhasListasTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 04/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class MinhasListasTableViewController: UITableViewController {
    var itens: [ItemMinhaLista] = []
    var realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var item: ItemMinhaLista
        
        item = ItemMinhaLista(titulo: "LOJA JOGOS", descricao: "30 DIAS")
        itens.append(item)
        
        item = ItemMinhaLista(titulo: "LOJA JOGOS", descricao: "30 DIAS")
        itens.append(item)
        
//        print("Realm location ")
//        print(Realm.Configuration.defaultConfiguration.fileURL)

//        let casaBahia = Loja("Casas Bahia", iconePequeno: "header-bahianinho", iconeGrande: "header-bahianinho", vendeComputador: false, vendeJogos: true, favorita: true)
//        let juninhoSystems = Loja("Juninho Systems", iconePequeno: "header-bahianinho", iconeGrande: "header-bahianinho", vendeComputador: true, vendeJogos: true, favorita: true)
//        let ricadoEletro = Loja("Ricardo Eletro", iconePequeno: "header-ricardo", iconeGrande: "header-ricardo", vendeComputador: true, vendeJogos: false, favorita: true)
//
//        try! realm.write {
//            realm.add(casaBahia)
//            realm.add(juninhoSystems)
//            realm.add(ricadoEletro)
//        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let favoritos = realm.objects(Favorito.self).sorted(byKeyPath: "nome", ascending: true)
        if !favoritos.isEmpty {
            return itens.count
        }else{
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favoritos = realm.objects(Favorito.self).sorted(byKeyPath: "nome", ascending: true)
        if !favoritos.isEmpty {
            let celulaReuso = "celulaReuso"
            let favoritos = realm.objects(Favorito.self).sorted(byKeyPath: "nome", ascending: true)
            let item = favoritos[indexPath.row]
            let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ItemMinhasListasTableViewCell
            celula.titulo.text = item.nome.uppercased()
            celula.descricao.text = "\(item.lojas.count) LOJAS"
            return celula
        }else{
            let add = "add_list"
            let celula = tableView.dequeueReusableCell(withIdentifier: add, for: indexPath)
            return celula
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
