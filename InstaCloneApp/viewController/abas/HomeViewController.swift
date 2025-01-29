//
//  HomeViewController.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 27/01/25.
//

import UIKit

class HomeViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewPostagens: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPostagens.separatorStyle = .none
        
    }
    
    /*Métodos para listagem na tabela*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaPostagens", for: indexPath) as! PostagemTableViewCell
        
        celula.descricaoPostagem.text = "Descrição..."
        celula.fotoPostagem.image = UIImage(named: "padrao")
        
        return celula
        
    }

}

