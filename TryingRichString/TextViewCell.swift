//
//  TextViewCell.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 22.04.2021.
//

import UIKit

class TextViewCell: UITableViewCell, UITextViewDelegate {
    
    // MARK: - Properties
    
//    var viewModel: TextViewCellViewModel? {
//        didSet { configure() }
//    }
    
    
    // MARK: - Views
    
    lazy var textView: UITextView = {
        let tv = UITextView()
//        tv.bounces = false
        tv.isEditable = false
        tv.isSelectable = false
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        tv.bounds.inset(by: padding)
        return tv
    }()
    
    
    
    //MARK: - LifeCycle
    
    // first loading func
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textView)
        
        textView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                        paddingLeft: 5, paddingBottom: 10, paddingRight: 5)

        textView.isUserInteractionEnabled = true
        textView.delegate = self
        showText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension TextViewCell {
    
    private func showText() {
        
        let apu = """
                <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.

                <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.
                """
        
        
        let mainText = """
            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.
            
            \(apu)
            """
        
        
        let text1 = """
            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor.
            """
        
        let groupStyle = TextViewStyle.groupStyle
        
        self.textView.attributedText = mainText.set(style: groupStyle)
        
    }
}
