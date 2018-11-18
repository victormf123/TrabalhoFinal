//
//  CadastroViewController.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 24/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit



class CadastroViewController: UIViewController {
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var idade: UITextField!
    var cadastroController: CadastroController = CadastroController()
    
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
        var valorIdade: Int = 0
        if let idade = self.idade.text {
            valorIdade = Int(idade)!
        }
        
        let cadastro: Bool  = self.cadastroController.cadastrarUsuario(nome: self.nome.text!, foto: "user-logo", email: self.email.text!, senha: self.senha.text!, telefone: self.telefone.text!, idade: valorIdade)
        
        if cadastro{
             self.dismiss(animated: true, completion: nil)
            }else{
            let alert = UIAlertController(title: "Erro!", message: "Ocorreu um erro.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            }
    }
    
}

