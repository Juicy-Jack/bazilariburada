//
//  ViewController.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 15.11.2024.
//

import UIKit

class ViewController: UIViewController {

    let autService = AuthenticationService()
    let cartService = CartService()
    let orderService = OrderService()
    let productService = ProductService()
    let reviewService = ReviewService()
    let userService = UserService()
    
    var userToken: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    ///MARK: Authentication testing
    @IBAction func testRegister(_ sender: UIButton) {
        autService.register(username: "furkitolki", email: "furkndognn@gmail.com", password: "12345678")
    }
    
    @IBAction func testActivate(_ sender: UIButton) {
        autService.activateAccount(email: "furkndognn@gmail.com", activationCode: "123123")
    }
    
    @IBAction func testLogin(_ sender: UIButton) {
        autService.login(username: "furkitolki", password: "12345678")
        userToken = autService.loginData?.accessToken ?? ""
    }
   
    @IBAction func testforget(_ sender: UIButton) {
        autService.forgetPassword(email: "furkndognn@gmail.com")
    }
    
    @IBAction func testReset(_ sender: UIButton) {
        autService.resetPassword(resetPasswordCode: "123512", newPassword: "12345678")
    }
    
    ///MARK: Cart Testing
    @IBAction func testGetCart(_ sender: UIButton) {
        cartService.getUsersCart(token: userToken)
    }
    
    @IBAction func testAddItem(_ sender: UIButton) {
        cartService.addItemToCart(token: userToken, productID: "672ca178803e6ff577ae0b39", quantity: 3)
    }
    
    @IBAction func testUpdateQuantity(_ sender: UIButton) {
        cartService.updateCartItemQuantity(token: userToken, productID: "672ca178803e6ff577ae0b39", quantity: 5)
    }
    
    @IBAction func testRemoveItem(_ sender: UIButton) {
        cartService.removeItemFromCart(token: userToken, productID: "672ca178803e6ff577ae0b39")
    }
    
    @IBAction func testClearCart(_ sender: UIButton) {
        cartService.clearCartItems(token: userToken)
    }
    
    ///MARK: Order Testing
    @IBAction func testPlaceOrder(_ sender: UIButton) {
    }
    
    @IBAction func testGetOrderByID(_ sender: UIButton) {
    }
    
    @IBAction func testGetAllOrders(_ sender: UIButton) {
    }
    
    ///MARK: Product Testing
    @IBAction func testGetAllProducts(_ sender: UIButton) {
    }
    
    @IBAction func testGetByID(_ sender: UIButton) {
    }
    
    ///MARK: Review Testing
    @IBAction func testGetProductReviews(_ sender: UIButton) {
    }
    
    @IBAction func testAddReview(_ sender: UIButton) {
    }
    
    @IBAction func testRemoveReview(_ sender: UIButton) {
    }
    
    ///MARK: User Testing
    
    @IBAction func testGetProfile(_ sender: UIButton) {
    }
    
    @IBAction func testUpdateProfile(_ sender: UIButton) {
    }
}

