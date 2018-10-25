//
//  ListaLojaTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 24/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit

class ListaLojaTableViewController: UITableViewController {
    var itens: [ItemListaLoja] = []
    var logo = UIImage(named: "header-bahianinho")
    var videogame = UIImage(named: "video-game")
    var pc = UIImage(named: "pc")
    var like = UIImage(named: "like")
    var liked = UIImage(named: "liked")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var item: ItemListaLoja
        
        item = ItemListaLoja(titulo: "Casas Bahia", image: logo, image1: videogame, image2: pc, like: like)
        itens.append(item)

        item = ItemListaLoja(titulo: "Juninho Systems", image: logo, image1: videogame, image2: pc, like: liked)
        itens.append(item)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.itens[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ListaCelula
        celula.logo.image = item.image
        celula.videogames.image = item.image1
        celula.computador.image = item.image2
        celula.like.image = item.like
        celula.titulo.text = item.titulo
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
