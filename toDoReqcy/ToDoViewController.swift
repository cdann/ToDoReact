//
//  ToDoViewController.swift
//  toDoReqcy
//
//  Created by celine dann on 16/08/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

extension Task: IdentifiableType, Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
    var identity: String {
        return id
    }
}

struct TasksSection {
    var header: String
    var items: [Task]
}

extension TasksSection : SectionModelType {
    
    init(original: TasksSection, items: [Task]) {
        self = original
        self.items = items
    }
    
    typealias Item = Task
    
}

class ToDoViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var mCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        JsonTasks.getTasksFromJson()
        mCollectionView.register(UINib.init(nibName: "TaskCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let datasource = RxCollectionViewSectionedReloadDataSource<TasksSection>(
            configureCell: { datasource, collection, index, item -> UICollectionViewCell in
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: index) as! TaskCollectionViewCell
            cell.setup(title: item.title, dueDate: item.dueDate)
            return cell
        })
        let tasks = JsonTasks.getTasksFromJson()
        let taskSections = [TasksSection(header: "blop", items: tasks)]
        Observable.just(taskSections)
            .bind(to: mCollectionView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
    }


}

