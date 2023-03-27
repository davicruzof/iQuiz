//
//  QUestionViewController.swift
//  iQuiz
//
//  Created by Davi De jesus cruz on 26/03/23.
//

import UIKit

class QUestionViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0
    
    @IBOutlet var botoesRespostas: [UIButton]!
    @IBOutlet weak var titleQuestionLabel: UILabel!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertou = sender.tag == Questoes[numeroQuestao].respostaCorreta
        
        if usuarioAcertou {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 165/255, blue: 53/255, alpha: 1.0)
        }else{
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if numeroQuestao < Questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configureQuestion), userInfo: nil, repeats: false)
        }else{
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureQuestion()
    }
    
    func configureLayout(){
        navigationItem.hidesBackButton = true
        titleQuestionLabel.numberOfLines = 0
        titleQuestionLabel.textAlignment = .center
        for button in botoesRespostas {
            button.layer.cornerRadius = 16.0
        }
    }
    
    @objc func configureQuestion() {
        titleQuestionLabel.text = Questoes[numeroQuestao].titulo
        for button in botoesRespostas {
            let titleButton = Questoes[numeroQuestao].respostas[button.tag];
            button.setTitle(titleButton, for: .normal)
            button.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else{ return }
        desempenhoVC.pontuacao = pontuacao
    }
}
