//
//  TableViewCon-Pro.swift
//  FavArtist
//
//  Created by supakit on 21/10/2564 BE.
//

import UIKit

class TableViewCon_Pro: UITableViewController {
    var productImages:[String] = []    //กำหนดตัวproppoty
    var productNames:[String] = []
    var webAddresses:[String] = []
    
    var plist:[String:[String]] = [:]
 
    func loadPlist(){
        let url = Bundle.main.url(forResource: "myplist", withExtension: "plist")! //ดึงไฟล์จากภายนอกเข้ามาในโปรเจ็ค forคือชื่อไฟล์ withคือนามสกุล
        let testData = try! Data(contentsOf: url) //ส่งurlเข้าไปใช้งานผ่านData(contentsOfก็คือส่งurlเข้าไปแล้วดึงdataข้อมูลที่ได้จะอยู่ในรูปแบบtestdata
        let myPlist = try! PropertyListSerialization.propertyList(from: testData, options: [] , format: nil) //แปลงตัวขอdataให้อยู่ในรูปแบบplist
        print(myPlist)
        plist=myPlist as! Dictionary //แปลง myplistให้อยู่ในรูปแบบdic และplistมาจากข้างบนkeyเป็นstring valueเป็นarray of string
        
        for (k,v) in plist {     //แยกkeyกับv โดยใช้forloop Loop หา key ใน plist เพื่อ append ค่าลง array
            if k == "product" {
                for i in v {
                    productNames.append(i)
                }
            }
            else if k == "Web" {
                for i in v {
                    webAddresses.append(i)
                }
            }
            else if k == "Img" {
                for i in v {
                    productImages.append(i)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPlist()                 //เรียกใช้เมื่อรันแอพ

                
                self.tableView.rowHeight = 100
    }

    
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productNames.count //ดึงชื่อproductไปใส่ในtableให้มันนับค่าเอา
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "webdata", for: indexPath) as! TableView_Cell //ส่งค่าไปยังtableview cell

        // Configure the cell...
        cell.imgweb.image = UIImage.init(named: productImages[indexPath.row])
        cell.lbweb.text = productNames[indexPath.row] //ให้มันโชว์ในตารางที่ต้องใส่indexpathเพราะมันเป็นarray
        return cell //เพราะเป็นmedtodแบบส่งค่ากลับ
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowData=self.tableView.indexPathForSelectedRow?.row
//
        if segue.identifier == "passdata" {
            let vc = segue.destination as! ViewController //ส่งค่าไปหน้าviewcontrol
            vc.web = webAddresses[rowData!]
     
        }
    }
}
