//
//  CrawlModel.swift
//  Quiz_18
//
//  Created by 이민우 on 2021/02/10.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownloaded(totalCount: NSArray, addCount: NSArray, names : NSArray)
}

class CrawlModel: NSObject {
    var delegate: CrawlModelProtocol!
    
    func dataCrawling(){
        let mainURL = "http://ncov.mohw.go.kr/"
        let nameArray = NSMutableArray()
        let totalcountArray = NSMutableArray()
        let addCountArray = NSMutableArray()
        var tempArray = [String]()
        
        // 유효하지 않은 경로일 경우 guard let을 이용해 걸러내기
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) dosen't seem to be a valid URL")
            return
        }
        
        // guard let을 통과한 경우
        do{
            var count = 0
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            for title in doc.xpath("//*[@id='main_maplayout']/button/span"){

                count += 1
                
                if count > 34{
                    tempArray.append(title.text!)
                }
            }
            
            // 지역 이름
            for i in stride(from: 0, through: 53, by: 3){
                nameArray.add(tempArray[i])
            }
            // 지역별 총 확진자수
            for i in stride(from: 1, through: 53, by: 3){
                totalcountArray.add(tempArray[i])
            }
            // 지역별 추가 확진자수
            for i in stride(from: 2, through: 53, by: 3){
                addCountArray.add(tempArray[i])
            }

        }catch let error{
            print("Error \(error)")
        }
        
        // 화면을 띄움과 동시에 작업 (async) - 받는 게 아니라 보내는 것!
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(totalCount: totalcountArray, addCount: addCountArray, names: nameArray)
        })
    }
}
