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
    var realm = try! Realm()
    var favoritos: Results<Favorito>!
    var lojasContoller: LojasController = LojasController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoritos = lojasContoller.BuscarListasFavoritosUsuario()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let item = self.favoritos[indexPath.row]
        let viewControllerDestino = segue.destination as! ListaLojaJogosTableViewController
        viewControllerDestino.nomeLista = item.nome
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !self.favoritos.isEmpty {
            return favoritos.count
        }else{
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !self.favoritos.isEmpty {
            let celulaReuso = "celulaReuso"
            let item = self.favoritos[indexPath.row]
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
