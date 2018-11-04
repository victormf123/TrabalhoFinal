//
//  ListaDescricaoProdutoServicoTableViewControle.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 29/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
class ListaDescricaoProdutoServicoTableViewControle: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itens: [ItemCelulaDescricaoProdutosServicos] = []
    var iphone = UIImage(named: "iphonex")
    var android = UIImage(named: "android")
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var item: ItemCelulaDescricaoProdutosServicos
        
        item = ItemCelulaDescricaoProdutosServicos(logo: iphone, titulo: "Troca de Tela", subdescricao: "iPhone")
        itens.append(item)
        
        item = ItemCelulaDescricaoProdutosServicos(logo: android, titulo: "Troca de Bateria", subdescricao: "Android")
        itens.append(item)
    }
    
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.itens[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ListaDescricaoProdutosServicosViewCell
        celula.logo.image = item.logo
        celula.titulo.text = item.titulo
        celula.subdescricao.text = item.subdescricao
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
