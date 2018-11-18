//
//  PerfilTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 14/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit


class PerfilTableViewController: UITableViewController {
    var emailUsuario: String!
    var perfilController: PerfilController = PerfilController()
    
    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var numero: UILabel!
    @IBOutlet weak var qtdList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let usuario = perfilController.buscarDadosUsuario(email: emailUsuario) as? Usuario {
            self.imgUsuario.image = UIImage(named: usuario.foto)
            self.nome.text = usuario.nome
            self.email.text = usuario.email
            self.numero.text = usuario.telefone
            self.qtdList.text = "\(usuario.lojasServidor.count) Lojas"
        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
