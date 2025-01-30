//
//  GaleriaCollectionViewController.swift
//  InstaCloneApp
//
//  Created by João Ricardo Martins Ribeiro on 30/01/25.
//

import UIKit


class GaleriaCollectionViewController: UICollectionViewController {
    
    var usuario: Dictionary<String, Any>!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaGaleria", for: indexPath) as! GaleriaCollectionViewCell
        
        celula.foto.image = UIImage(named: "padrao")
        celula.descricao.text = "Texto..."
        
        return celula
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}
