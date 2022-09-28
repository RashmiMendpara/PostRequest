//  ViewController.swift
//  POSTRequest
//  Created by RASHMI  on 13/09/22.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    var res : [String: Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
    
    func getcall(){
        guard let url = URL(string: "https://demo.zesavi.com/api/request-otp/") else {return}
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("there was an error:\(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("the response: \(jsonRes)")
            }
            
        }.resume()
    }
    
    func postcall(){
        //"email":"h.singla@zesavi.com","is_privacy_accepted":true}
        let params = ["email" : self.txtemail.text ,"is_privacy_accepted": true] as [String : Any]
        guard let url = URL(string: "https://demo.zesavi.com/api/request-otp/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("The error was: \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!,options: []) as! [String: Any]
                print("response json is: \(jsonRes!)")
                let res = jsonRes!["reason"] as! String
                print(res)
                if res == "reason" {
                    print(res)
                    // go on login page
                } else if res == "email" {
                    print(res)
                    // go on sign up page
                }
                
            }
        }.resume()
        
    }

    @IBAction func sendAct(_ sender: Any) {
        print("guten tag**")
       // self.postcall()
        
    }
    
}

