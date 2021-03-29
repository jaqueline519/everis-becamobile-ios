//
//  File.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 28/03/21.
//

import Foundation
import Alamofire

class Service {
    
    fileprivate var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    //MARK:- getFilmesSemana
    func getFilmesSemana(endPoint: String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let filmes = try JSONDecoder().decode(Welcome.self, from: data)
                let resultado = filmes.results
                print(resultado.count)
                print(resultado[0].posterPath)
//                print("Filmes == \(filmes)")
            } catch {
                print("Erro ao decodificar == \(error)")
            }
        }
    }
    
}
