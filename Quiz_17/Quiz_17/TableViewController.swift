//
//  TableViewController.swift
//  Quiz_17
//
//  Created by 이민우 on 2021/02/10.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tvListView: UITableView!
    
    // 변수 선언을 class 정의 전에 하여야 한다. (그래야 다른 컨트롤러에서 공유해서 쓸 수 있다.)
    var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
    var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Edit 버튼을 만들고 삭제 기능 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // 표시할 섹션 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 표시할 리스트 데이터 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // cell 구성 정의
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        // cell의 label 지정
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        
        // cell의 이미지 지정
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    // edit 기능 (제거, 삽입)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // cell label 제거
            items.remove(at: (indexPath as NSIndexPath).row)
            // cell image 제거
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            // cell 행 제거
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    // cell 이동
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item의 위치
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        // 이동할 image의 위치
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 item을 삭제
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 image를 삭제
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // itesm 삽입
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        // imageFile 삽입
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // DetailViewController로 데이터 보내기
        if segue.identifier == "DetailView"{
            let cell = sender as! UITableViewCell // 클릭한 셀의 데이터 가져오기
            let indexPath = self.tvListView.indexPath(for: cell) // 클릭한 셀의 위치
            let detailView = segue.destination as! DetailViewController // 보낼 컨트롤러 설정
            
//            detailView.receiveItems(imageName: itemsImageFile[(indexPath! as NSIndexPath).row], cellName: items[(indexPath! as NSIndexPath).row])
            
            detailView.imgName = itemsImageFile[(indexPath! as NSIndexPath).row]
            detailView.cellName = items[(indexPath! as NSIndexPath).row]
        }
    }

    // Table View에 추가된 내용 불러 들이기 (viewWillAppear은 viewdidload와 달리 계속해서 화면에 들어올 떄마다 갱신)
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
}
