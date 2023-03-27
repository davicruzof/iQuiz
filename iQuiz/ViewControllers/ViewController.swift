//
//  ViewController.swift
//  iQuiz
//
//  Created by Davi De jesus cruz on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botao foi pressionado")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
    
    func configuraLayout () {
        navigationItem.hidesBackButton = true
        botaoIniciarQuiz.layer.cornerRadius = 16.0
    }
}

