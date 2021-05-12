//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var coordinator: FeedCoordinator?
    let urlString = "https://jsonplaceholder.typicode.com/todos/42"
    
    private lazy var showAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("show alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getData()
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        view.addSubview(showAlertButton)
        view.addSubview(infoLabel)
        
        let constraints = [
            showAlertButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            showAlertButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showAlertButton.widthAnchor.constraint(equalToConstant: 150),
            showAlertButton.heightAnchor.constraint(equalToConstant: 50),
            
            infoLabel.topAnchor.constraint(equalTo: showAlertButton.bottomAnchor, constant: 15),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    @objc private func showAlert(_ sender: Any) {
        coordinator?.showAlert()
    }
    
    private func getData() {
        let url = URL(string: urlString)
        NetworkService.infoDataTask(url: url!, block: printInLabel)
    }
    
    private func printInLabel(json: Data) {
        let result = try! JSONSerialization.jsonObject(with: json, options: .mutableContainers) as? [String: Any]
        if result != nil {
            infoLabel.text = result!["title"] as? String
        }
    }
}
