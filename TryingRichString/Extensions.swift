//
//  Extensions.swift
//  ConnectIst
//
//  Created by Nazmi Yavuz on 15.02.2021.
//

import UIKit
//import JGProgressHUD


//MARK: - UIViewController


extension UIViewController {
//    static let hud = JGProgressHUD(style: .dark)
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
//    func showLoader(_ show: Bool) {
//        view.endEditing(true)
//
//        if show {
//            UIViewController.hud.show(in: view)
//        } else {
//            UIViewController.hud.dismiss()
//        }
//    }
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UILabel

extension UILabel {
    
    func attributedDetailText(firstPart: String, secondPart: String) {
        
        let boldText = firstPart
        let firstAttrs = [NSAttributedString.Key.font : UIFont(name: "Georgia", size: 15),
                          .foregroundColor: UIColor.red]
        let attributedString = NSMutableAttributedString(string:"\(boldText) ", attributes:firstAttrs as [NSAttributedString.Key : Any])
        let normalText = secondPart
        let secondAttrs = [NSAttributedString.Key.font : UIFont(name: "Georgia", size: 15),
                           .foregroundColor: UIColor.systemBlue]
        let normalString = NSMutableAttributedString(string:normalText, attributes: secondAttrs as [NSAttributedString.Key : Any])
        attributedString.append(normalString)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .justified
        
    }
}


//MARK: - UITextField




//MARK: - UIButton


// To cut more line of codes for creating UIButtons instead of creating new class and swift file.
extension UIButton {
    
    
    
    
    
    
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    
    
    
}

//MARK: - UIView

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                isActive: Bool = true) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = isActive
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = isActive
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = isActive
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = isActive
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = isActive
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = isActive
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil, isActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = isActive
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = isActive
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = isActive
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = isActive
        }
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                 bottomAnchor: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat? = 0,
                 width: CGFloat? = nil,
                 height: CGFloat? = nil,
                 isActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = isActive
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = isActive
        }
        
        if let bottomAnchor = bottomAnchor {
            bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingBottom!).isActive = isActive
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = isActive
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = isActive
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 rightAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0,
                 paddingRight: CGFloat = 0, constant: CGFloat = 0,
                 isActive: Bool = true) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = isActive
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
        
        if let right = rightAnchor {
            anchor(right: right, paddingRight: paddingRight)
        }
        
        
    }
    
    func setDimensions(height: CGFloat, width: CGFloat, isActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = isActive
        widthAnchor.constraint(equalToConstant: width).isActive = isActive
    }
    
    func setHeight(_ height: CGFloat, isActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = isActive
    }
    
    func setWidth(_ width: CGFloat, isActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = isActive
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    //MARK: Animation
    // i have created this in order to execute animation for related view
    func setButtonAnimation(scaleXY sxy: CGFloat, duration: TimeInterval) {
        // animation of zooming / popping
        UIView.animate(withDuration: duration) {
            // scale by 30% -> 1.3
            self.transform = CGAffineTransform(scaleX: sxy, y: sxy)
        } completion: { (completed) in
            // return the initial state
            UIView.animate(withDuration: duration) {
                self.transform = CGAffineTransform.identity
            }
        }
    }
    
    
}


// MARK: - Hide Keyboard
// called when the screen is tapped (outside of any obj-s)

extension UIViewController {
    // add this function related viewController's viewDidLoad that we want to hide keyboard 
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIStackView {
    
    func createShowStack() {
        axis = .vertical
        spacing = 5
        alignment = .fill
        distribution = .fill
        layer.cornerRadius = 5
        layer.borderWidth = 2
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    }
    
    
    func setNumberStack(_ ax: NSLayoutConstraint.Axis) {
        axis = ax
        alignment = .fill
        distribution = .fillEqually
        spacing = 2
    }
    
    func setEditVCStack() {
        axis = .vertical
        alignment = .fill
        spacing = 10
        
        
    }
    
}


extension UITableViewCell {
    /// Set accessory image to any UIImage.
    /// - Made by:
    ///  Ori HPT
    /// - Parameters:
    ///   - image: The image to set.
    ///   - color: The tint color of the image.
    ///   - selector: The action of the accessory.
    ///   - target: The target of the action. (self)
    func setAccessoryImage(to image: UIImage, color: UIColor, selector: Selector?, target: Any?) {
        self.accessoryType = .none
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        let size = self.textLabel?.font.pointSize ?? UIFont.preferredFont(forTextStyle: .body).pointSize
        button.setPreferredSymbolConfiguration(.init(pointSize: size, weight: .regular, scale: UIImage.SymbolScale.small), forImageIn: .normal)
        button.sizeToFit()
        if selector != nil {
            button.addTarget(target, action: selector!, for: .touchUpInside)
        }
        button.tintColor = color
        self.accessoryView = button
    }
}
