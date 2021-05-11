//
//  SecondController.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 23.04.2021.
//

import UIKit

class SecondController: UIViewController, UIScrollViewDelegate {
    
    
    // MARK: - Properties
    var images: [String] = [String]()
    
    
    // MARK: - Views
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        v.delegate = self
        v.dataSource = self
        v.isPagingEnabled = true
        v.backgroundColor = .white
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = images.count
        page.currentPage = 0
        page.backgroundColor = .systemGray5
        page.layer.cornerRadius = 15
        page.addTarget(self, action: #selector(pageControlTapHandler), for: .touchUpInside)
        return page
    }()
    
    
    //MARK: - LifeCycle
    
    // first loading func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavBar()
        
        
        
    }
    
    
    //MARK: - API
    
    
    @objc private func pageControlTapHandler(_ sender: UIPageControl) {
        
        collectionView.scrollToItem(at: [0,sender.currentPage], at: .left, animated: true)
        
        
    }
    
    
    //MARK: - Private Functions
    
    
    
    
    // MARK: - Action
    
    
    
    // MARK: - Helpers
    
    
    private func configureUI() {
        view.backgroundColor = .systemBlue
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor,
                              paddingTop: 5, paddingLeft: 5,
                              paddingBottom: 5, paddingRight: 5)
        
        view.addSubview(pageControl)
        pageControl.centerX(inView: view)
        pageControl.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 5)
        
    }
    
    private func configureNavBar() {
        
        
    }
    
    
}

//MARK: - UICollectionViewDataSource

extension SecondController: UICollectionViewDataSource{
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

//MARK: - UICollectionViewDelegate

extension SecondController: UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: ",indexPath.row)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(collectionView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    
}

//MARK: - FlowLayout

extension SecondController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//        if isExpand {
//            return CGSize(width: UIScreen.main.bounds.width-80, height: collectionView.frame.height)
//        } else {
//            return CGSize(width: collectionView.frame.height*1.2, height: collectionView.frame.height)
//        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
