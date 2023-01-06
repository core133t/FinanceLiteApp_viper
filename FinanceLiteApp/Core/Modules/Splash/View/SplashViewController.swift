//
//  SplashViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
   
}

class SplashViewController: UIViewController {
    
    private var image = UIImage(named: "FinanceLite_logo")
    private var splashImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private var logoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 220, height: 100))
    
    var presenter: SplashPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        splashImage.translatesAutoresizingMaskIntoConstraints = false
        splashImage.backgroundColor = .white
        splashImage.image = image
        splashImage.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        
        logoLabel.font = .systemFont(ofSize: 38, weight: .bold)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.center = CGPoint(x: view.center.x+10, y: splashImage.center.y + 100)
        logoLabel.text = "FinanceLite"
        logoLabel.textColor = .black
        logoLabel.transform = CGAffineTransform(translationX: 0, y: 100)
        
        view.addSubview(logoLabel)
        view.addSubview(splashImage)
    
        UIView.animate(withDuration: 1){
            self.logoLabel.transform = .identity
            self.splashImage.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }
        
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
   
}
 

