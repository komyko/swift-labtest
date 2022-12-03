//
//  ViewController.swift
//  FavArtist
//
//  Created by supakit on 21/10/2564 BE.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate {
    
    var web:String=""                //กำหนดpropoty
    var youtube:String = ""
    var plist:[String:[String]] = [:]
    
    @IBOutlet weak var webshow: WKWebView!

 
    func loadPlist(){
        let url = Bundle.main.url(forResource: "myplist", withExtension: "plist")! //ดึงไฟล์จากภายนอกเข้ามาในโปรเจ็ค forคือชื่อไฟล์ withคือนามสกุล
        let testData = try! Data(contentsOf: url) //ส่งurlเข้าไปใช้งานผ่านData(contentsOfก็คือส่งurlเข้าไปแล้วดึงdataข้อมูลที่ได้จะอยู่ในรูปแบบtestdata
        let myPlist = try! PropertyListSerialization.propertyList(from: testData, options: [] , format: nil) //แปลงตัวขอdataให้อยู่ในรูปแบบplist
        print(myPlist)
        plist=myPlist as! Dictionary //แปลง myplistให้อยู่ในรูปแบบdic และplistมาจากข้างบนkeyเป็นstring valueเป็นarray of string
        
        for (k,v) in plist {          //Loop หา key ใน plist เพื่อ append ค่าลง array
            if k == "youtube" {
                for i in v {
                    youtube.append(i)
                }
            }
        }
    }
    
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movetoyou" {
            let vc = segue.destination as! ViewController2 //ส่งค่าไปหน้าviewcontroller2
            vc.web2 = youtube
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPlist()
       

        let encodedUrl = web.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let myURL = URL(string: encodedUrl)
        let myRequest = URLRequest(url: myURL!) //แปลง string url เป็น url และให้ webkit โหลด url
        
        webshow.load(myRequest) //แสดงผล
    }


}

