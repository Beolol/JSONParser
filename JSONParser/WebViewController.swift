//
//  WebViewController.swift
//  JSONParser
//
//  Created by user on 19.11.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import Alamofire

class WebViewController: UIViewController {
    
    
    
    @IBOutlet weak var webView: UIWebView!
    
    var titleStory: String = ""
    var http: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleStory

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print(http)
        self.webView.loadRequest(URLRequest(url: URL(string: http)!))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
