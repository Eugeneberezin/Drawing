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
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    
    @objc fileprivate func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    override func loadView() {
        self.view = canvas
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        setupStackLayout()
    }
    
    fileprivate func setupStackLayout() {
        let colorStackView = UIStackView(arrangedSubviews: [yellowButton, redButton, blueButton])
        colorStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearButton, colorStackView, slider])
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }

}

