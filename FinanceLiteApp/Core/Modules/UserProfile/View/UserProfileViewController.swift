//
//  UserProfileViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

final class UserProfileViewController: UIViewController {
    
    var presenter: UserProfilePresenterProtocol
    
    private lazy var userProfileView: UserProfileView = {
        let userProfileView = UserProfileView()
        return userProfileView
    }()
    
    init(presenter: UserProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension UserProfileViewController: UserProfilePresenterDelegate {
    func showData(_ userProfile: UserEntity) {
        userProfileView.setupWithUserProfileData(userProfile)
    }
}
