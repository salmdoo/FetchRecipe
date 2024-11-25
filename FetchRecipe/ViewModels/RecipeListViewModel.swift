//
//  RecipeListViewModel.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import Foundation
import Combine

class RecipeListViewModel: ObservableObject {
    @Published var recipeList: [Recipe] = []
    @Published var error: ServiceError = .none
    @Published var isLoading: Bool = false
    
    private let networkProtocol: NetworkService
    private let logging: LoggingService
    private var anyCancellable = Set<AnyCancellable>()
    
    init(serviceManagement: NetworkService, logging: LoggingService) {
        self.networkProtocol = serviceManagement
        self.logging = logging
    }
    
    func fetchRecipe() {
        self.isLoading = true
        networkProtocol.fetchData()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    self?.logging.logInfo(string: "Finish Fetch Data")
                case .failure(_):
                    self?.isLoading = false
                    self?.error = .generalError
                }
            } receiveValue: { [weak self] response in
                if response.recipeList.isEmpty {
                    self?.error = .noData
                }
                self?.recipeList = response.recipeList.sorted(by: { $0.name < $1.name })
            }.store(in: &anyCancellable)

    }
}
