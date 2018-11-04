//
//  MinhasListasTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 04/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit

class MinhasListasTableViewController: UITableViewController {
    var itens: [ItemMinhaLista] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var item: ItemMinhaLista
        
        item = ItemMinhaLista(titulo: "LOJA JOGOS", descricao: "30 DIAS")
        itens.append(item)
        
        item = ItemMinhaLista(titulo: "LOJA JOGOS", descricao: "30 DIAS")
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
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ItemMinhasListasTableViewCell
        celula.titulo.text = item.titulo
        celula.descricao.text = item.descricao
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
