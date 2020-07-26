//
//  ViewController.swift
//  PracticeCodeView
//
//  Created by IJ . on 2020/07/25.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
import SnapKit
import Then
class ViewController: UIViewController {

    
    let nameLabel = UILabel().then {
        $0.text = "nameLabel"
        $0.textColor = .blue
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    let nameTextField = UITextField()
    let changeButton = UIButton().then {
        $0.backgroundColor = .lightGray
        $0.setTitle("Test Button normal", for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .systemRed
        self.view.addSubview(redView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(changeButton)
        redView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        changeButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            redView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
//            redView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
//            redView.widthAnchor.constraint(equalToConstant: 100),
//            redView.heightAnchor.constraint(equalToConstant: 600)
//        ])
        redView.snp.makeConstraints {
           // $0.centerX.centerY.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.height.equalTo(150)
        }
        changeButton.snp.makeConstraints {
            
            $0.bottom.equalToSuperview().offset(-20)
            $0.left.equalToSuperview().offset(30)
        }
        self.nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }


}

