//
//  CadastroViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 24/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class CadastroViewController: UIViewController {
    var realm = try! Realm()
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    @IBOutlet weak var telefone: UITextField!
    
    @IBOutlet weak var idade: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cadastro(_ sender: Any) {
        let user = Usuario(value:["nome": "\(self.nome.text!)", "foto" : "user-logo", "email": "\(self.email.text!)", "senha" : "\(self.senha.text!)", "telefone" : "\(self.idade.text!)"])
        
        do {
            try! realm.write {
                realm.add(user)
                self.dismiss(animated: true, completion: nil)
            }
        } catch let error {
            let alert = UIAlertController(title: "Erro!", message: "\(error).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    /*@IBAction func exit(_ sender: Any) {
     
     }*/
    
    
}
