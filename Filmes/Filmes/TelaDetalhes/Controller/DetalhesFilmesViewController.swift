//
//  DetalhesFilmesViewController.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 30/03/21.
//

import UIKit
import Alamofire
import AlamofireImage

class DetalhesFilmesViewController: UIViewController {
    
    // MARK -IBOutlet
    @IBOutlet weak var scrolDetalhes: UIScrollView!
    
    @IBOutlet weak var imagemDetalhes: UIImageView!
    
    @IBOutlet weak var filmeSelecionado: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var tituloOriginal: UILabel!
    @IBOutlet weak var detalhes: UILabel!
    
    // MARK -Variáveis
    var id = 0
    var detalhesFilmeSelecionado : DetalhesFilmes? = nil
    var filmesViewController : FilmesViewController?
    var uiImages = [UIImage]()
    
    //MARK -Ciclo de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.request()
    }
    
    // MARK - Métodos
        func request(){
        print("identificador: \(id)")
        let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=49cfc8f69b2e2e2394f4072c55dfbf71"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {return}
            
            do {
                let retorno = try JSONDecoder().decode(DetalhesFilmes.self, from: data)
                print("dados: \(retorno)")
                self.detalhesFilmeSelecionado = retorno
                
            } catch {
                print("Erro ao decodificar == \(error)")
                
            }
            guard let urlParteFinalImg = self.detalhesFilmeSelecionado?.posterPath else {return}
            let id = self.id
            
            let urlStr = "https://image.tmdb.org/t/p/w500\(urlParteFinalImg)"
            guard let imageUrl:URL = URL(string: urlStr) else {return}
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let image = UIImage(data: imageData as Data)
//            print("URL: \(urlStr)")
            if let detalhesDoFilme = self.detalhesFilmeSelecionado{
                self.imagemDetalhes.image = image
                self.filmeSelecionado.text = detalhesDoFilme.title
                self.tituloOriginal.text = detalhesDoFilme.originalTitle
                self.rating.text = "\(detalhesDoFilme.popularity)"
                self.detalhes.text = detalhesDoFilme.overview
            }
        }
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        
    }
    
    
}
