//
//  HomeVc.swift
//  ConnectIst
//
//  Created by Nazmi Yavuz on 17.02.2021.
//

import UIKit
import SwiftRichString

class Home2VC: UIViewController, UIScrollViewDelegate {

    // MARK: - Properties
    
    
    var labelHeight: CGFloat = 0
    
    var isHeightActive = false
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.backgroundColor = .white
        sv.autoresizingMask = .flexibleHeight
        sv.showsVerticalScrollIndicator = false
        sv.bounces = false
        return sv
    }()
    
    
    private let containerView = UIView()
    
    private let coverImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "aboutus"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let expandButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(UIImage(systemName: "rectangle.expand.vertical"), for: .normal)
        btn.tintColor = .red
        btn.setDimensions(height: 50, width: 50)
        btn.addTarget(self, action: #selector(expandPressed), for: .touchUpInside)
        return btn
    }()
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.bounces = false
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    
    // create name and lastName label under the ava imageView
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    

    //MARK: - LifeCycle

    // executed once the Auto-Layout has been applied / executed
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(isActive: isHeightActive)
        
        scrollView.delegate = self
        
        showText()
    }
    
    // executed everytime when view will appear to the screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    //MARK: - API
    
    
    
    // MARK: - Action
    
   
    // handle up function to go the upper part of the screen for looking pictures
    @objc func expandPressed() {
        print("DEBUG: Button pressed..")
        print("DEBUG: isHeightActive..\(isHeightActive)")
        isHeightActive = !isHeightActive
        configureUI(isActive: isHeightActive)
    }
    
    // MARK: - Helpers
    
    // declaring UI obj auto layout properties
    private func configureUI(isActive: Bool) {
        // hide navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
     
        // fetch the screen height and width
//        let screenWidth = self.view.frame.width
        
        let contentViewSize = CGSize(width: self.view.frame.width, height: 1600)
        
        // declare scrollView attributes and autoLayout
        scrollView.frame = view.bounds
        scrollView.contentSize = contentViewSize
        containerView.frame.size = contentViewSize
        
        view.addSubview(scrollView)
        
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(coverImageView)
        coverImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor,
                              right: containerView.rightAnchor)
        
        containerView.addSubview(expandButton)
        expandButton.anchor(top: coverImageView.bottomAnchor, right: containerView.rightAnchor)
        
        containerView.addSubview(textView)
        
        textView.anchor(top: expandButton.bottomAnchor, left: containerView.leftAnchor,
                        bottom: containerView.bottomAnchor,
                        right: containerView.rightAnchor)
        
        
        coverImageView.setHeight(300, isActive: !isActive)
        coverImageView.setHeight(700, isActive: isActive)
        textView.setHeight(1000, isActive: !isActive)
        textView.setHeight(600, isActive: isActive)

        
        
        
//        containerView.addSubview(nameLabel)
//        nameLabel.anchor(top: coverImageView.bottomAnchor, left: containerView.leftAnchor,
//                        right: containerView.rightAnchor)
        
    }
    
    
}


extension Home2VC {
    
    private func showText() {
        
        let apu = """
                <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.

                <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.
                """
        
        
        let mainText = """
            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.
            
            \(apu)
            """
        
        let groupStyle = TextViewStyle.groupStyle
        
        self.textView.attributedText = mainText.set(style: groupStyle)
        
    }
}


