//
//  ReviewService.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 21.11.2024.
//

import Foundation
import Combine

class ReviewService {
    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var productReviews: [Review]?
    @Published var sentReview: Review?
    
    func getProductReviews(productID: String) {
        networkManager.request(endpoint: "products/\(productID)/reviews", method: .GET)
            .decode(type: ApiResponse<[Review]>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: { [weak self] response in
                print(response.message)
                self?.productReviews = response.data
            })
            .store(in: &cancellables)
    }
    
    func addProductReview(token: String, productID: String, comment: String, rating: Int) {
        let body = ["comment": comment, "rating": rating] as [String : Any]
        networkManager.request(endpoint: "products/\(productID)/reviews", method: .POST, body: body, requiresAuthentication: true, token: token)
            .decode(type: ApiResponse<Review>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: { [weak self] response in
                print(response.message)
                self?.sentReview = response.data
            })
            .store(in: &cancellables)
    }
    
    func deleteUserReview(token: String, productID: String) {
        networkManager.request(endpoint: "products/\(productID)/reviews", method: .DELETE, requiresAuthentication: true, token: token)
            .decode(type: ApiResponse<EmptyResponseData>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: { response in
                print(response.message)
            })
            .store(in: &cancellables)
    }
}
