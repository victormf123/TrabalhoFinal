//
//  ListaLojaTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 24/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ListaLojaTableViewController: UITableViewController {
    
    var nomeLista: String!
    var realm = try! Realm()
    var logo = UIImage(named: "header-bahianinho")
    var videogame = UIImage(named: "video-game")
    var pc = UIImage(named: "pc")
    var like = UIImage(named: "like")
    var liked = UIImage(named: "liked")
    var lojas: Results<Loja>!
    var lojasController: LojasController = LojasController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lojas = self.lojasController.BuscarListaLojas()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let item = self.lojas[indexPath.row]
        let viewControllerDestino = segue.destination as! ListaDescricaoProdutoServicoTableViewControle
        viewControllerDestino.nomeItem = item.nome
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lojas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let itemLoja = self.lojas[indexPath.row]
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ListaCelula
        celula.logo.image = UIImage(named: itemLoja.iconePequeno)
        celula.videogames.image = itemLoja.vendeJogos ? videogame : nil
        celula.computador.image = itemLoja.vendeComputador ? pc : nil
        celula.like.image = itemLoja.favorita ? liked : like
        celula.titulo.text = itemLoja.nome
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
