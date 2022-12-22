//
//  UserProfileHeaderView.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

class UserProfileHeaderView: UIView {

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center

        return stackView
    }()

    let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar-placeholder")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {

        let label = UILabel()
        label.text = "Dmitry Loginov"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let agencyLabel: UILabel = {

        let label = UILabel()
        label.text = "Agency 1337"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let accountLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Account 123456-7"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let bankLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gazprom Bank"
        label.font = UIFont.systemFont(ofSize: 15)

        return label
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(agencyLabel)
        stackView.addArrangedSubview(accountLabel)
        stackView.addArrangedSubview(bankLabel)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
