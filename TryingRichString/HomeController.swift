//
//  HomeController.swift
//  TryingRichString
//
//  Created by Nazmi Yavuz on 22.04.2021.
//

import UIKit

private let tableCellIdentifier = "TableCell"
private let textViewCellIdentifier = "TextViewCell"


class HomeController: UIViewController {
    
    let images: [String] = ["aboutus", "computer", "istanbul" , "seagull", "aboutus", "computer", "istanbul" , "seagull", "aboutus", "computer", "istanbul" , "seagull", "aboutus", "computer", "istanbul" , "seagull"]
    
    var isExpand = false
    var isFirstTouch = true
    
    lazy var tableView: UITableView = { [unowned self] in
        let tv = UITableView.init(frame: .zero)
        tv.delegate = self
        tv.dataSource = self
        tv.isScrollEnabled = false
        tv.rowHeight = UITableView.automaticDimension
        tv.register(TableCell.self, forCellReuseIdentifier: tableCellIdentifier)
        tv.register(TextViewCell.self, forCellReuseIdentifier: textViewCellIdentifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor)
        
        tableView.reloadData()
    }
    
    @objc private func isExpandButtonPressed(_ sender: UIButton, _ event: UIEvent) {
        
//        let cell = tableView.cellForRow(at: [0,0]) as! TableCell
        
        
        isExpand = !isExpand
        
        isFirstTouch = false
        let indexPath = IndexPath(item: sender.tag, section: 0)
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
   

        
    }
    
    @objc private func isZoomButtonPressed(_ sender: UIButton, _ event: UIEvent) {
        let vc = SecondController()
        vc.images = images
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
}

extension HomeController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if isExpand {
            if indexPath.section == 0 {
                return UIScreen.main.bounds.height*0.5
            } else {
                return UIScreen.main.bounds.height*0.47
            }
        } else {
            if indexPath.section == 0 {
                return UIScreen.main.bounds.height*0.15
            } else {
                return UIScreen.main.bounds.height*0.82
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! TableCell
            cell.expandButton.addTarget(self, action: #selector(isExpandButtonPressed), for: .touchUpInside)
            cell.zoomButton.addTarget(self, action: #selector(isZoomButtonPressed), for: .touchUpInside)
            cell.expandButton.tag = indexPath.row
            cell.images = self.images
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: textViewCellIdentifier, for: indexPath) as! TextViewCell
            
            cell.textView.isScrollEnabled = true
            return cell
        }
        
    }
    
    
}



extension HomeController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 1 {
            
            print("DEBUG: textView did tap..")
            let cell = tableView.cellForRow(at: indexPath) as! TextViewCell
            
            cell.textView.isUserInteractionEnabled = true

            
        } else {
            
            
            
            
        }
        
        
    }
}
