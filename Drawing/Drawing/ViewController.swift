//
//  ViewController.swift
//  Drawing
//
//  Created by Eugene Berezin on 12/10/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

import UIKit



class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(Canvas.undo), for: .touchUpInside)
        return button
    }()
    
    let clearButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Clear", for: .normal)
           button.titleLabel?.font = .boldSystemFont(ofSize: 14)
           button.addTarget(self, action: #selector(Canvas.clear), for: .touchUpInside)
           return button
       }()
    
    
    
    override func loadView() {
        self.view = canvas
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearButton])
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

