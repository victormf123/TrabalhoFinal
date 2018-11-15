//
//  PerfilTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 14/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class PerfilTableViewController: UITableViewController {
    var emailUsuario: String!
     var realm = try! Realm()
    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var numero: UILabel!
    @IBOutlet weak var qtdList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("emailUsuario PerfilTableViewCOntroller: \(emailUsuario)")
        let usuario = try! realm.objects(Usuario.self).filter("email LIKE '\(self.emailUsuario!)'")
        for item in usuario{
            self.imgUsuario.image = UIImage(named: item.foto)
            self.nome.text = item.nome
            self.email.text = item.email
            self.numero.text = item.telefone
            self.qtdList.text = "\(item.lojasServidor.count) Lojas"
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
