//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mihail on 16.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

var isAnimating: Bool = false

class ProfileHeaderView: UIView {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "cat"))
    private let profileLabel = UILabel()
    private let statusLabel = UILabel()
    private let profileButton = UIButton(type: .system)
    private let textField = UITextField()
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        setupAvater()
        
        addSubview(profileLabel)
        setupNameLabel()
        
        addSubview(statusLabel)
        setupStatusLabel()
        
        addSubview(profileButton)
        setupButton()
        
        addSubview(textField)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAvater() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 120/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
    }
    
    private func setupNameLabel() {
        profileLabel.text = "Normal Cat"
        profileLabel.textColor = .black
        profileLabel.font.withSize(18)
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private func setupStatusLabel() {
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font.withSize(14)
    }
 
    private func setupButton() {
        profileButton.backgroundColor = .blue
        profileButton.setTitle("Show status", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOpacity = 0.7
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private func setupTextField() {
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.font?.withSize(15)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isAnimating {
            imageView.snp.makeConstraints {
                $0.top.equalTo(safeAreaInsets.top + 16)
                $0.leading.equalTo(safeAreaInsets.left + 16)
                $0.width.equalTo(120)
                $0.height.equalTo(120)
            }
            
            profileLabel.snp.makeConstraints {
                $0.top.equalTo(safeAreaInsets.top + 27)
                $0.leading.equalTo(safeAreaInsets.left + 152)
                $0.width.equalTo(200)
                $0.height.equalTo(50)
            }
            
            statusLabel.snp.makeConstraints {
                $0.top.equalTo(imageView.snp.bottom).offset(-50)
                $0.leading.equalTo(safeAreaInsets.left + 152)
                $0.width.equalTo(200)
                $0.height.equalTo(50)
            }
            
            profileButton.snp.makeConstraints {
                $0.top.equalTo(textField.snp.bottom).offset(16)
                $0.leading.equalTo(safeAreaInsets.left + 16)
                $0.width.equalToSuperview().offset(-32)
                $0.height.equalTo(50)
            }
            
            textField.snp.makeConstraints {
                $0.top.equalTo(statusLabel.snp.bottom)
                $0.leading.equalTo(safeAreaInsets.left + 152)
                $0.width.equalToSuperview().offset(-168)
                $0.height.equalTo(40)
            }
        }
    }
    
    @objc private func buttonPressed() {
        print(statusLabel.text!)
        statusLabel.text = statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        if (textField.text != "") {
            statusText = textField.text!
        } else {
            statusText = "Waiting for something..."
        }
    }
}
