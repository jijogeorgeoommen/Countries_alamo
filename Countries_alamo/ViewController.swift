//
//  ViewController.swift
//  Countries_alamo
//
//  Created by sics on 25/06/19.
//  Copyright © 2019 sics. All rights reserved.
//

import UIKit
import Alamofire

//-------------- Creating ModelClass ----------------//

class Model : NSObject {
    
    var name : String?
    var two_code : String?
    var three_code : String?
    
     init(obj : NSDictionary) {
        
        name = obj.value(forKey: "name")as! String
        two_code = obj.value(forKey: "alpha2_code")as! String
        three_code = obj.value(forKey: "alpha3_code") as! String
    }
    
}
//------------------- Model class created -------------//


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableviewoutlet: UITableView!
    
    var carray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
  //------------- Alamofire parsing program --------------//
    func getdata(){
        
        Alamofire.request("http://services.groupkt.com/country/get/all").responseJSON { (response) in
            
           // print(response)
            
            let mainobject = response.result.value as! NSDictionary
           // print(mainobject)
           
            let restresponseobject = mainobject.value(forKey: "RestResponse") as! NSDictionary
            
            let country_array = restresponseobject.value(forKey: "result") as! NSArray
            
           print(country_array)
            
            
            for i in country_array {
                
                self.carray.append(Model(obj: i as! NSDictionary))
            }
            self.tableviewoutlet.reloadData()
            
        }
    }
    
//---------------- Tableview Functions -----------------------//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return carray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewoutlet.dequeueReusableCell(withIdentifier: "TableViewCellid", for: indexPath)as! TableViewCell
        
        cell.nameoutlet.text = carray[indexPath.row].name as! String
        cell.threecodeoutlet.text = carray[indexPath.row].three_code as! String
        cell.two_outlet.text = carray[indexPath.row].two_code as! String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    


}

