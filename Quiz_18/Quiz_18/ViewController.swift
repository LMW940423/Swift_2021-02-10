//
//  ViewController.swift
//  Quiz_18
//
//  Created by 이민우 on 2021/02/10.
//

import UIKit

class ViewController: UIViewController, CrawlModelProtocol {
 
    @IBOutlet weak var lblGyeongi: UITextView!
    @IBOutlet weak var lblIncheon: UITextView!
    @IBOutlet weak var lblSeoul: UITextView!
    @IBOutlet weak var lblGangwon: UITextView!
    @IBOutlet weak var lblChungBook: UITextView!
    @IBOutlet weak var lblSejong: UITextView!
    @IBOutlet weak var lblChungNam: UITextView!
    @IBOutlet weak var lblGyeongBook: UITextView!
    @IBOutlet weak var lblGyeongNam: UITextView!
    @IBOutlet weak var lblDaejeon: UITextView!
    @IBOutlet weak var lblDaegu: UITextView!
    @IBOutlet weak var lblJeonBook: UITextView!
    @IBOutlet weak var lblJeonNam: UITextView!
    @IBOutlet weak var lblGwangju: UITextView!
    @IBOutlet weak var lblBusan: UITextView!
    @IBOutlet weak var lblUlsan: UITextView!
    @IBOutlet weak var lblJeju: UITextView!
    @IBOutlet weak var lblOthers: UITextView!
    
    var feedItemTotalCount: NSArray = NSArray() // 총 확진자수
    var feedItemAddCount: NSArray = NSArray() // 추가 확진자수
    var feedItemNames: NSArray = NSArray() // 지역명
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let crawlModel = CrawlModel()
        crawlModel.delegate = self
        crawlModel.dataCrawling()
       
    }
    
    func itemDownloaded(totalCount: NSArray, addCount: NSArray, names: NSArray) {
        feedItemTotalCount = totalCount
        feedItemAddCount = addCount
        feedItemNames = names

        // 라벨에 적기
        setTextLabel()
       
    }
    
    func setTextLabel(){
      
        lblSeoul.text = "\(feedItemNames[0])\n\(feedItemTotalCount[0])\n\(feedItemAddCount[0])"
        lblBusan.text = "\(feedItemNames[1])\n\(feedItemTotalCount[1])\n\(feedItemAddCount[1])"
        lblDaegu.text = "\(feedItemNames[2])\n\(feedItemTotalCount[2])\n\(feedItemAddCount[2])"
        lblIncheon.text = "\(feedItemNames[3])\n\(feedItemTotalCount[3])\n\(feedItemAddCount[3])"
        lblGwangju.text = "\(feedItemNames[4])\n\(feedItemTotalCount[4])\n\(feedItemAddCount[4])"
        lblDaejeon.text = "\(feedItemNames[5])\n\(feedItemTotalCount[5])\n\(feedItemAddCount[5])"
        lblUlsan.text = "\(feedItemNames[6])\n\(feedItemTotalCount[6])\n\(feedItemAddCount[6])"
        lblSejong.text = "\(feedItemNames[7])\n\(feedItemTotalCount[7])\n\(feedItemAddCount[7])"
        lblGyeongi.text = "\(feedItemNames[8])\n\(feedItemTotalCount[8])\n\(feedItemAddCount[8])"
        lblGangwon.text = "\(feedItemNames[9])\n\(feedItemTotalCount[9])\n\(feedItemAddCount[9])"
        lblChungBook.text = "\(feedItemNames[10])\n\(feedItemTotalCount[10])\n\(feedItemAddCount[10])"
        lblChungNam.text = "\(feedItemNames[11])\n\(feedItemTotalCount[11])\n\(feedItemAddCount[11])"
        lblJeonBook.text = "\(feedItemNames[12])\n\(feedItemTotalCount[12])\n\(feedItemAddCount[12])"
        lblJeonNam.text = "\(feedItemNames[13])\n\(feedItemTotalCount[13])\n\(feedItemAddCount[13])"
        lblGyeongBook.text = "\(feedItemNames[14])\n\(feedItemTotalCount[14])\n\(feedItemAddCount[14])"
        lblGyeongNam.text = "\(feedItemNames[15])\n\(feedItemTotalCount[15])\n\(feedItemAddCount[15])"
        lblJeju.text = "\(feedItemNames[16])\n\(feedItemTotalCount[16])\n\(feedItemAddCount[16])"
        lblOthers.text = "\(feedItemNames[17])\n\(feedItemTotalCount[17])\n\(feedItemAddCount[17])"

        
    }


}

