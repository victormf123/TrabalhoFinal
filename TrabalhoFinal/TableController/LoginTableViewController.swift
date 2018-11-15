//
//  LoginTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 14/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
     var realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func entrar(_ sender: Any) {
        var alert: UIAlertController
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        print("email: \(self.email.text!), senha: \(self.senha.text!)")
        let usuario = try! realm.objects(Usuario.self).filter("email == '\(self.email.text!)' AND senha == '\(self.senha.text!)'")
        if !usuario.isEmpty{
            
            if let perfilTableViewController = storyboardMain.instantiateViewController(withIdentifier: "PerfilStoryboardID") as? PerfilTableViewController{
                perfilTableViewController.emailUsuario = self.email.text!
            self.navigationController?.pushViewController(perfilTableViewController, animated: true)
            }
            
        }else{
            alert = UIAlertController(title: "Atenção", message: "Você não possui cadastro.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        
    }
}
