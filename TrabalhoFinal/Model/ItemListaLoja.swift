//
//  ItemListaLoja.swift
//  TrabalhoFinal
//
//  Created by Matheus Freitas on 24/10/18.
//  Copyright © 2018 Matheus Freitas. All rights reserved.
//

import UIKit

class ItemListaLoja {
    var titulo: String!
    var image: UIImage!
    var image1: UIImage!
    var image2: UIImage!
    var like: UIImage!
    
    init(titulo: String!, image: UIImage!, image1: UIImage!, image2: UIImage!) {
        self.titulo = titulo
        self.image = image
        self.image1 = image1
        self.image2 = image2
    }
    
    init(titulo: String!, image: UIImage!, image1: UIImage!, image2: UIImage!, like: UIImage!) {
        self.titulo = titulo
        self.image = image
        self.image1 = image1
        self.image2 = image2
        self.like = like
    }
}
