//
//  TableViewController.swift
//  JSONParser
//
//  Created by user on 19.11.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TableViewController: UITableViewController {
    

    var title_list: [String] = []
    var text_list: [String] = []
    var html_list: [String] = []
    var date_list: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Истории";
        DispatchQueue.global(qos: .background).async {

            self.loadTableInfo()
            /*DispatchQueue.main.async {

            }*/
        }
       // Uncomment the following line to preserve selection between presentations
    }
    
    func loadTableInfo() {
        let url = "https://dl.dropboxusercontent.com/s/vtah37wynalczbs/stories.json?dl=0"
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_, key) in json["stories"] {
                    for (value1, key1) in key
                    {
                        let data = String(describing: key1)
                        switch value1 {
                        case "title" : self.title_list.append(data)
                        case "link" : self.html_list.append(data)
                        case "description" : self.text_list.append(data)
                        case "pubDate" : self.date_list.append(data)
                        default : print()
                    }
                }
                }
                print("JSON: \(json)")
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return title_list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! StoriesTableViewCell
        
        cell.titleLabel?.text = title_list[indexPath.row]
        cell.htmlLabel?.text = html_list[indexPath.row]
        cell.storyLabel?.text = text_list[indexPath.row]
        cell.dateLabel?.text = date_list[indexPath.row]
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                let webPage: WebViewController = segue.destination as! WebViewController
                webPage.titleStory = title_list[IndexPath.row]
                webPage.http = html_list[IndexPath.row]
            }
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
