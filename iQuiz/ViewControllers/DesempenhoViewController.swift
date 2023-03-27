//
//  DesempenhoViewController.swift
//  iQuiz
//
//  Created by Davi De jesus cruz on 26/03/23.
//

import UIKit

class DesempenhoViewController: UIViewController {
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    var pontuacao: Int?
    
    @IBOutlet weak var porcentagemCorreta: UILabel!
    @IBOutlet weak var respostasCorretas: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configureDesempenho()
    }
    

    func configurarLayout(){
        navigationItem.hidesBackButton = true
        botaoReiniciarQuiz.layer.cornerRadius = 16.0
    }
    
    func configureDesempenho(){
        guard let pontuacao = pontuacao else { return }
        respostasCorretas.text = "Você Acertou \(pontuacao) de \(Questoes.count)"
        porcentagemCorreta.text = "Percentual final: \((pontuacao * 100)/Questoes.count)%"
    }

}
