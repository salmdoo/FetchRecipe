//
//  NetworkServiceImp.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import Foundation
import Combine

struct NetworkServiceImp: NetworkService {
    
    private let url: String
    private let session: URLSessionProtocol
    
    init(url: String, session: URLSessionProtocol = URLSession.shared) {
        self.url = url
        self.session = session
    }
    
    func fetchData() -> AnyPublisher<RecipeList, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap{ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw ServiceError.badServerResponse
                }
                return data
            }
            .decode(type: RecipeList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
