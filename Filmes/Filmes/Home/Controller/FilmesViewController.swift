//
//  ViewController.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 28/03/21.
//

import UIKit

class FilmesViewController: UIViewController, UICollectionViewDataSource{

    @IBOutlet weak var ColecaoFilmes: UICollectionView!
    
    let filmes = [FilmesSemana]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ColecaoFilmes.dataSource = self
        
        
        let service = Service(baseUrl: "https://api.themoviedb.org/3/trending/all/week?api_key=49cfc8f69b2e2e2394f4072c55dfbf71&language=pt-BR")
        service.getFilmesSemana(endPoint: "")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmesSemana
        
        let filmeAtual = filmes[indexPath.item]
        
    
        
        
        }
    
   
}

