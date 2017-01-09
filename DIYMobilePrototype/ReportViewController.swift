//
//  ReportViewController.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 27/12/2016.
//  Copyright © 2016 Alex Saberdine. All rights reserved.
//

import UIKit





class ReportViewController: UIViewController {
    
    var postQueue = [Post]()
    let testDataProvider = TestDataProvider()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SmallFlowItemTableViewCell", bundle: nil), forCellReuseIdentifier: "SmallCell")
        tableView.register(UINib(nibName: "MediumFlowItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MediumCell")
        tableView.register(UINib(nibName: "LargeFlowItemTableViewCell", bundle: nil), forCellReuseIdentifier: "LargeCell")
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = UIColor(red: 249/255.0, green: 241/255.0, blue: 239/255.0, alpha: 1.0)
    
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ReportViewController.createTestEvent), userInfo: nil, repeats: true)
    
    }
    
    
    func createTestEvent() {
        let randomNumber = arc4random_uniform(3)
        switch randomNumber {
        case 0:
            let post = Post(id: Int(arc4random()), type: PostType.small, title: testDataProvider.getMessageTitle(), message: testDataProvider.getShortMessage(), image: nil, sender: testDataProvider.getName(), date: Date())
            postQueue.append(post)
            
        case 1:
            let post = Post(id: Int(arc4random()), type: PostType.medium, title: testDataProvider.getMessageTitle(), message: testDataProvider.getShortMessage(), image: nil, sender: testDataProvider.getName(), date: Date())
            postQueue.append(post)
        case 2:
            let post = Post(id: Int(arc4random()), type: PostType.large, title: testDataProvider.getMessageTitle(), message: testDataProvider.getLongMessage(), image: nil, sender: testDataProvider.getName(), date: Date())
            postQueue.append(post)
        default:
            fatalError("UNDEFINED RANDOMNUMBER IN CREATE_TEST_EVENT")
        }
        let IndexPathOfLastRow = IndexPath(row: self.postQueue.count - 1, section: 0)
        self.tableView.insertRows(at: [IndexPathOfLastRow], with: UITableViewRowAnimation.left)
        self.tableView.scrollToRow(at: IndexPathOfLastRow, at: .bottom, animated: true)
    }
    
  }


extension ReportViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        switch postQueue[indexPath.row].postType {
        case .small:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SmallCell") as! SmallFlowItemTableViewCell
            cell.backgroundColor = UIColor(red: 249/255.0, green: 241/255.0, blue: 239/255.0, alpha: 1.0)
            cell.messageTitle.text = postQueue[indexPath.row].postTitle
            cell.messageBody.text = postQueue[indexPath.row].postMessage
            return cell
            
        case .medium:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediumCell")! as! MediumFlowItemTableViewCell
            cell.backgroundColor = UIColor(red: 249/255.0, green: 241/255.0, blue: 239/255.0, alpha: 1.0)
            cell.messageTitle.text = postQueue[indexPath.row].postTitle
            cell.messageBody.text = postQueue[indexPath.row].postMessage
            return cell
        case .large:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LargeCell")! as! LargeFlowItemTableViewCell
            cell.backgroundColor = UIColor(red: 249/255.0, green: 241/255.0, blue: 239/255.0, alpha: 1.0)
            cell.messageTitle.text = postQueue[indexPath.row].postTitle
            cell.messageBody.text = postQueue[indexPath.row].postMessage
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postQueue.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch postQueue[indexPath.row].postType {
        case .small:
            return 44
        case .medium:
            return 88
        case .large:
            return 158
        }
    }
}
