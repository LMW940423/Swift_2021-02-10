//
//  ViewController.swift
//  Kanna_03
//
//  Created by 이민우 on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCrawling()
    }
    
    func dataCrawling(){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        
        // 유효하지 않은 경로일 경우 guard let을 이용해 걸러내기
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) dosen't seem to be a valid URL")
            return
        }
        
        // guard let을 통과한 경우
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
            var count = 1
            
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                print(count, " : ", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            
        }catch let error{
            print("Error \(error)")
    }
}


}

