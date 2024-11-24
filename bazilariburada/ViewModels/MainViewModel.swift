//
//  MainScreenViewController.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 23.11.2024.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    private let productService: ProductService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var allProducts: [Product]?
    @Published var productByID: Product?
    
    init(productService: ProductService = ProductService()) {
        self.productService = productService
        addSubscribers()
    }
    
    func getProducts() {
        productService.getAllProducts()
    }
    
    func getProductByID(productID: String) {
        productService.getProductByID(productID: productID)
    }
    
    private func addSubscribers() {
        productService.$allProducts
            .sink { [weak self] returnedProducts in
                self?.allProducts = returnedProducts?.products
            }
            .store(in: &cancellables)
        
        productService.$productByID
            .sink { [weak self] returnedProduct in
                self?.productByID = returnedProduct
            }
            .store(in: &cancellables)
    }
}
