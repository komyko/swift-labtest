//
//  ViewController2.swift
//  FavArtist
//
//  Created by supakit on 21/10/2564 BE.
//

import UIKit
import WebKit

class ViewController2: UIViewController,WKUIDelegate {

    var web2:String = ""
   
    @IBOutlet weak var webshow2: WKWebView!
        
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        let myURL2 = URL(string: web2) //แปลง string url เป็น url และให้ webkit โหลด url
        let myRequest2 = URLRequest(url: myURL2!)
        webshow2.load(myRequest2) //แสดงผล
  
       
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
