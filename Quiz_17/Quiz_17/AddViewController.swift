//
//  AddViewController.swift
//  Quiz_17
//
//  Created by 이민우 on 2021/02/10.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtCellName: UITextField!
    @IBOutlet weak var pickerImage: UIPickerView!
    
    
    let MAX_ARRAY_NUM = 3 // 전체 이미지 개수
    let PICKER_VIEW_COLUMN = 1 // PickerVIew의 컬럼 개수
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var imageArray = [UIImage(named: "cart.png"), UIImage(named: "clock.png"), UIImage(named: "pencil.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // pickerView에 파일명 배치
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
//
//    // pickerView에 파일명 대신 이미지 배치
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let letImageView = UIImageView(image: imageArray[row])
//        letImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
//        return letImageView
//    }
//
//    // pickerVIew로 선택된 파일명의 이미지 출력
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        ImgView.image = UIImage(named: imageFileName[row])
//    }
}
