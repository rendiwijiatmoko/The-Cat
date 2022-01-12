//
//  BreedFetcher.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        errorMessage = nil
        
        let service = APIService()
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        
        service.fetchBreeds(url: url) {[unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    //print error description
                    print(error)
                case.success(let breeds):
                    self.breeds = breeds
                }
            }
        }
    }
    
    // Preview Helpers
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func succssesState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.example1(),Breed.example1()]
        return fetcher
    }
}
