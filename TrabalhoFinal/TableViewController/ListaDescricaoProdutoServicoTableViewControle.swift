//
//  ListaDescricaoProdutoServicoTableViewControle.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 29/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ListaDescricaoProdutoServicoTableViewControle: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itens: [ItemCelulaDescricaoProdutosServicos] = []
    var iphone = UIImage(named: "iphonex")
    var android = UIImage(named: "android")
    var nomeItem: String!
    var realm = try! Realm()
    var loja: Results<Loja>!
    var listaProdutos: List<Produto>!
    var lojasController: LojasController = LojasController()
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nome = self.nomeItem {
            self.loja = self.lojasController.BuscarItemListasLoja(nome: nome)
        }
        for  item in self.loja {
            self.listaProdutos = item.produtos
            self.logo.image = UIImage(named: item.iconeGrande)
            self.titulo.text = item.nome
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var item: ItemCelulaDescricaoProdutosServicos
        
        item = ItemCelulaDescricaoProdutosServicos(logo: iphone, titulo: "Troca de Tela", subdescricao: "iPhone")
        itens.append(item)
        
        item = ItemCelulaDescricaoProdutosServicos(logo: android, titulo: "Troca de Bateria", subdescricao: "Android")
        itens.append(item)
    }
    
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaProdutos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.listaProdutos[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! ListaDescricaoProdutosServicosViewCell
        celula.logo.image =  UIImage(named: item.imagem)
        celula.titulo.text = item.titulo
        celula.subdescricao.text = item.descricao
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
