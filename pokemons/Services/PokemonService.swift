//
//  PokemonService.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation

struct PokemonService {
    
    func getPokemons(completion: @escaping ([Pokemon]?, Error?) -> Void) {
        guard let url = URL(string: "\(BASE_URL)/pokemon.json") else {
            completion(nil, APIError.invalidUrl)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let replaceNullData = data?.parseData(removeString: "null,") else {
                completion(nil, error)
                return
            }
            guard let detail = try? JSONDecoder().decode([Pokemon].self, from: replaceNullData) else {
                completion(nil, error)
                return
            }
            
            DispatchQueue.main.async {
                completion(detail, nil)
            }
            
        }.resume()
    }
}
