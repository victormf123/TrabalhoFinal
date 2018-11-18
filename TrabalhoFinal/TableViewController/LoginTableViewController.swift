//
//  LoginTableViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 14/11/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    var loginController: LoginCOntroller = LoginCOntroller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func entrar(_ sender: Any) {
        var alert: UIAlertController
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
//        print("email: \(!), senha: \(!)")
        var emailNotOptional: String = ""
        var senhaNotOptional: String = ""
        if let email = self.email.text { emailNotOptional = email }
        
        if let senha = self.senha.text { senhaNotOptional = senha}
        
        if let login: Bool = self.loginController.login(email: emailNotOptional, senha: senhaNotOptional){
            
            if login {
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
}
