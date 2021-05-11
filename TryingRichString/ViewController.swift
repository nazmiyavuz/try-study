//
//  ViewController.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 21.04.2021.
//

import UIKit
import SwiftRichString

//class NoSwipeSegmentedControl: UISegmentedControl {
//    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}


class ViewController: UIViewController, UIScrollViewDelegate {
    
    let isStoreImage = true
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.contentSize = self.contentView.frame.size
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        scrollView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        showText()
        
    }
    
    
//    override func viewDidLayoutSubviews() {
//
//            scrollView.contentSize = self.contentView.frame.size
//        }
    
    
    private func showText() {
        let mainText = """
            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.

            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.

            <b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u>\nPenatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit.\n\nEt sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit "scelerisque mauris pellentesque". Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem.
            """

        let groupStyle = TextViewStyle.groupStyle
                self.label?.attributedText = mainText.set(style: groupStyle)
    }
    
    private func mainTextBody() {
        
        // We can render our string
        _ = "<b>Lorem ipsum</b> dolor sit amet, <i>consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i> Mauris in aliquam sem fringilla ut. Tellus cras adipiscing enim eu turpis egestas pretium. <u>Consectetur adipiscing</u> elit pellentesque habitant morbi tristique senectus. Ultrices tincidunt arcu non sodales neque sodales. Sed viverra ipsum nunc aliquet bibendum enim. Ornare arcu dui vivamus arcu felis bibendum ut tristique. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Lorem donec massa sapien faucibus et molestie ac feugiat. Aliquet risus feugiat in ante metus dictum at tempor. Habitant morbi tristique senectus et netus et malesuada. A erat nam at lectus urna duis convallis. Elit duis tristique sollicitudin nibh sit amet. \n\nSed felis eget velit aliquet sagittis id. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Iaculis eu non diam phasellus. Eu tincidunt tortor aliquam nulla facilisi cras fermentum. Est placerat in egestas erat imperdiet sed euismod nisi porta. Amet nulla facilisi morbi tempus iaculis urna id. Lectus proin nibh nisl condimentum id venenatis a. Penatibus et magnis dis parturient montes nascetur ridiculus mus. Varius vel pharetra vel turpis nunc eget lorem dolor. Sed euismod nisi porta lorem mollis aliquam ut porttitor. Bibendum neque egestas congue quisque. Amet massa vitae tortor condimentum lacinia. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Vel orci porta non pulvinar. Elit eget gravida cum sociis. Nunc mi ipsum faucibus vitae aliquet. Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae.\n\nDiam vulputate ut pharetra sit. Ante in nibh mauris cursus mattis molestie a iaculis. Amet massa vitae tortor condimentum lacinia quis vel eros donec. Et sollicitudin ac orci phasellus. Ornare quam viverra orci sagittis eu volutpat. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Fames ac turpis egestas integer eget aliquet nibh praesent. Mauris rhoncus aenean vel elit scelerisque mauris pellentesque. Viverra justo nec ultrices dui sapien eget mi proin. Dignissim sodales ut eu sem."
        
    }
    

}

//extension ViewController: UIScrollViewDelegate {
//
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//
////
////    func scrollViewDidZoom(_ scrollView: UIScrollView) {
////        if scrollView.zoomScale > 1 {
////                    if let image = imageView.image {
////                        let ratioW = imageView.frame.width / image.size.width
////                        let ratioH = imageView.frame.height / image.size.height
////
////                        let ratio = ratioW < ratioH ? ratioW : ratioH
////                        let newWidth = image.size.width * ratio
////                        let newHeight = image.size.height * ratio
////                        let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
////                        let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
////                        let conditioTop = newHeight*scrollView.zoomScale > imageView.frame.height
////
////                        let top = 0.5 * (conditioTop ? newHeight - imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
////
////                        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
////
////                    }
////                } else {
////                    scrollView.contentInset = .zero
////                }
////    }
////
//
//}
