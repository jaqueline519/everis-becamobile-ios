//
//  ViewController.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 28/03/21.
//

import UIKit
import Alamofire
import AlamofireImage

class FilmesViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {

 @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    var listaDeFilmes = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
     colecaoFilmes.dataSource = self
        self.colecaoFilmes.reloadData()
        self.colecaoFilmes.delegate = self

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmesCollectionViewCell
        
        AF.request("https://api.themoviedb.org/3/trending/all/week?api_key=49cfc8f69b2e2e2394f4072c55dfbf71&language=pt-BR", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,interceptor: nil).response { [self]
            (responseData) in
            guard let data = responseData.data else {return}

            do {
                let retorno = try JSONDecoder().decode(Welcome.self, from: data)
           
                self.listaDeFilmes = retorno.results
              
            } catch {
                print("Erro ao decodificar == \(error)")
            }
            let urlParteFinalImg = self.listaDeFilmes[indexPath.row].posterPath
            print(self.listaDeFilmes)

            let urlParteInicialImg = "https://image.tmdb.org/t/p/w300/"
            let concatenaUrl = "\(urlParteInicialImg)\(urlParteFinalImg)"
            let postaImagemURL = URL(string: concatenaUrl)
            let url = self.listaDeFilmes[indexPath.item].posterPath
            
            print("\(url) === \(indexPath.item)")
            let image = UIImage(contentsOfFile: url)
            celulaFilme.ImagemFilme.af_setImage(withURL: postaImagemURL!)

            celulaFilme.clipsToBounds = true
            celulaFilme.layer.cornerRadius = 20;
            celulaFilme.layer.masksToBounds = true
            celulaFilme.contentMode = .scaleAspectFit
    
        }
        
        return celulaFilme
    }

}
