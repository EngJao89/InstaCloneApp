//
//  PostagemViewController.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 28/01/25.
//

import UIKit

import UIKit
import FirebaseStorage

class PostagemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    var imagePicker = UIImagePickerController()
    var storage: Storage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage = Storage.storage()
        imagePicker.delegate = self
        
    }
    
    @IBAction func selecionarImagem(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.imagem.image = imagemRecuperada
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func salvarPostagem(_ sender: Any) {
        
        let imagens = storage.reference()
        .child("imagens")
        
        let imagemSelecionada = self.imagem.image
        if let imagemUpload = imagemSelecionada?.jpegData(compressionQuality: 0.3) {
            
            let identificadorUnico = UUID().uuidString
            
            let imagemPostagemRef = imagens
            .child("postagens")
            .child("\(identificadorUnico).jpg")
            
            imagemPostagemRef.putData(imagemUpload, metadata: nil) { (metaData, erro) in
                if erro == nil {
                    print("sucesso")
                }else{
                    print("Erro ao fazer upload")
                }
            }
            
        }
        
    }
    

}
