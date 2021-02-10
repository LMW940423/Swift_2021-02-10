//
//  CrawlModel.swift
//  Kanna_04
//
//  Created by 이민우 on 2021/02/10.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownloaded(items: NSArray, itemsAddress: NSArray) // NSArray는 재사용 불가능
}

class CrawlModel: NSObject {
    var delegate: CrawlModelProtocol!
    
    func dataCrawling(year: String){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=\(year)"
        let locations = NSMutableArray() // 재사용 가능
        let locationsAddress = NSMutableArray()
        
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
            var count = 0
            
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                count += 1
                let tempAddress = "https://www.rottentomatoes.com\(String(describing: title["href"]!))" // Detail로 보내기 위함
                let countStr = String(format: "%3d", count)
                let tempStr = "\(countStr) : \(String(title.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                locations.add(tempStr)
                locationsAddress.add(tempAddress)
            }
            
        }catch let error{
            print("Error \(error)")
        }
        
        // 화면을 띄움과 동시에 작업 (async) - 받는 게 아니라 보내는 것!
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations, itemsAddress: locationsAddress)
        })
    }
}
