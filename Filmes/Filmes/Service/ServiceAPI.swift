//
//  File.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 28/03/21.
//

import Foundation
import Alamofire

//class Service {
//    var filmes : [Result] = []
//    fileprivate var baseUrl = ""
//    
//    init(baseUrl: String) {
//        self.baseUrl = baseUrl
//    }
//    
    //MARK:- getFilmesSemana
//    func getFilmesSemana(endPoint: String) -> [Result] {
//        AF.request("https://api.themoviedb.org/3/trending/all/week?api_key=49cfc8f69b2e2e2394f4072c55dfbf71&language=pt-BR", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,interceptor: nil).response { [self]
//            (responseData) in
//            guard let data = responseData.data else {return}
//            
//            do {
//                let retorno = try JSONDecoder().decode(Welcome.self, from: data)
//                //print("Filmes == \(retorno)")
//                self.filmes = retorno.results
//                //print(self.filmes)
//            } catch {
//                print("Erro ao decodificar == \(error)")
//            }
//        }
//        
//    }
    
//}
