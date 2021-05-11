//
//  PictureItemCell.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 22.04.2021.
//

import UIKit

class CollectionCell: UICollectionViewCell, UIScrollViewDelegate{
    
    
    
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.backgroundColor = .white
        sv.minimumZoomScale = 1
        sv.maximumZoomScale = 3
        sv.autoresizingMask = .flexibleHeight
        sv.showsVerticalScrollIndicator = false
        sv.bounces = false
        return sv
    }()
    
    private let containerView = UIView()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "aboutus")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let contentViewSize = CGSize(width: self.contentView.frame.width,
                                     height: contentView.frame.height)
        
        // declare scrollView attributes and autoLayout
        scrollView.frame = contentView.bounds
        scrollView.contentSize = contentViewSize
        containerView.frame.size = contentViewSize
        
        contentView.addSubview(scrollView)
        
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        imageView.anchor(top: containerView.topAnchor,
                         left: containerView.leftAnchor,
                         bottom: containerView.bottomAnchor,
                         right: containerView.rightAnchor)
        
        scrollView.delegate = self
//        updateZoomFor(size: contentView.bounds.size)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
//
//    func updateZoomFor(size: CGSize){
//        let widthScale = size.width / imageView.bounds.width
//        let heightScale = size.height / imageView.bounds.height
//        let scale = min(widthScale,heightScale)
//        scrollView.minimumZoomScale = scale
//    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageView.image {

                let ratioW = imageView.frame.width / image.size.width
                let ratioH = imageView.frame.height / image.size.height

                let ratio = ratioW < ratioH ? ratioW : ratioH

                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio

                let left = 0.5 * (newWidth * scrollView.zoomScale > imageView.frame.width ? (newWidth - imageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                let top = 0.5 * (newHeight * scrollView.zoomScale > imageView.frame.height ? (newHeight - imageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))

                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = UIEdgeInsets.zero
        }
    }

    
    
}
