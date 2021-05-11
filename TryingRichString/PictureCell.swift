//
//  PictureCell.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 22.04.2021.
//

import UIKit


class TableCell: UITableViewCell {

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        commonInit()
//    }
    
    var images: [String] = [String]()

    var isExpand = false
    
    let list = [String](repeating: "Task_", count: 10)
    
    lazy var expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "equal"), for: .normal)
//        button.addTarget(self, action: #selector(expandPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var zoomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
//        button.addTarget(self, action: #selector(expandPressed), for: .touchUpInside)
        return button
    }()
    
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        v.delegate = self
        v.dataSource = self
//        v.isPagingEnabled = true
        v.backgroundColor = .white
        return v
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(expandButton)
        expandButton.anchor(left: leftAnchor,bottom: bottomAnchor, right: rightAnchor,
                            paddingBottom: 5)
        expandButton.setHeight(20)
        
        contentView.addSubview(zoomButton)
        zoomButton.anchor(top: topAnchor, right: rightAnchor,
                          paddingTop: 5, paddingRight: 5)
//        expandButton.setDimensions(height: 30, width: 30)
        
        contentView.addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: expandButton.topAnchor, right: rightAnchor,
                              paddingTop: 5, paddingLeft: 40,paddingBottom: 5, paddingRight: 40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc private func expandPressed() {
//        isExpand = !isExpand
//        collectionView.reloadData()
//    }
    
  
}


extension TableCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
//        cell.imageButton.setImage(UIImage(named: images[indexPath.row]), for: .normal)
        cell.imageView.image = UIImage(named: images[indexPath.row])
        
        
        
        return cell
    }
}

extension TableCell: UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: ",indexPath.row)
        
        
        
//        let controller = SecondController()
//        
//        let vc1 = HomeController()
//        
//        vc1.present(controller, animated: true, completion: nil)
        
        
        
        
    }
    
    
}


extension TableCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height*1.2, height: collectionView.frame.height)
//        if isExpand {
//            return CGSize(width: UIScreen.main.bounds.width-80, height: collectionView.frame.height)
//        } else {
//            return CGSize(width: collectionView.frame.height*1.2, height: collectionView.frame.height)
//        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
//        if isExpand {
//            return 0
//        } else {
//            return 5
//        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        guard previousTraitCollection != nil else { return }
        collectionView.collectionViewLayout.invalidateLayout()
        
    }
    

}

