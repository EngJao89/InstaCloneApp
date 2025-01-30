//
//  UsuariosViewController.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 27/01/25.
//

import UIKit
import FirebaseFirestore

class UsuariosViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewUsuarios: UITableView!
    @IBOutlet weak var searchBarUsuario: UISearchBar!
    var firestore: Firestore!
    var usuarios: [Dictionary<String, Any>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firestore = Firestore.firestore()
        
    }
    
    /*Métodos para listagem na tabela*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.usuarios.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaUsuario", for: indexPath)
        
        celula.textLabel?.text = "Nome"
        celula.detailTextLabel?.text = "email"
        
        return celula
        
    }
    
}

