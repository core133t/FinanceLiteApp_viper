//
//  SplashViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
    func noInternetConnection()
}

class SplashViewController: UIViewController {
    
    private var image = UIImage(named: "finance_logo")
    //private weak var v:UIImageView!
    //private var splashImage:UIImageView!
    private var splashImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
    //private var image = UIImage(named: "finance_logo")
    
    
    var presenter: SplashPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        //splashImage.frame = self.view.bounds
        //splashImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        //splashImage.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        self.view.backgroundColor = .white
        splashImage.center = view.center
        splashImage.backgroundColor = .white
        splashImage.image = image
        view.addSubview(splashImage)
        presenter.viewDidAppear()
        setAccessibilityIdentifiers()
    }

}

extension SplashViewController {
    func setAccessibilityIdentifiers() {
        splashImage.accessibilityIdentifier = "splashImage"
    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
    func noInternetConnection() {
        
    }
}

