//
//  CadastroViewController.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 27/01/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    var firestore: Firestore!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        auth = Auth.auth()
        firestore = Firestore.firestore()
        
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        
        if let nome = campoNome.text {
            if let email = campoEmail.text {
                if let senha = campoSenha.text {
                    
                    auth.createUser(withEmail: email, password: senha) { (dadosResultado, erro) in
                        if erro == nil {
                            
                            if let idUsuario = dadosResultado?.user.uid {
                                //salvar dados do usuário
                                self.firestore.collection("usuarios")
                                .document( idUsuario )
                                .setData([
                                    "nome": nome,
                                    "email": email,
                                    "id": idUsuario
                                ])
                            }
                            
                        }else{
                            print("Erro ao cadastrar usuario")
                        }
                    }
                    
                }else{
                    print("Preencha a senha")
                }
            }else{
                print("Preencha o email")
            }
        }else{
            print("Preencha o nome")
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
