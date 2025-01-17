//  ProjectManager - HistoryViewModel.swift
//  created by zhilly on 2023/01/27

import Foundation

final class HistoryViewModel {
    
    let model: Observable<[History]> = Observable([])
    private let historyCoreDataManager = HistoryManager.shared
    
    init() {
        setupNotification()
        fetchToCoreData()
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appendDeletedHistory(_:)),
                                               name: .deleted,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appendAddedHistory(_:)),
                                               name: .added,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appendMovedHistory(_:)),
                                               name: .moved,
                                               object: nil)
    }
    
    private func fetchToCoreData() {
        var fetchedData: [History]
        
        do {
            fetchedData = try historyCoreDataManager.fetchObjects()
            setToDoData(item: fetchedData)
        } catch {
            print("CoreData fetched data Fail!")
        }
    }
    
    private func setToDoData(item: [History]) {
        item.forEach { item in
            model.value.insert(item, at: 0)
        }
    }
    
    private func addToCoreData(item: History) {
        do {
            try historyCoreDataManager.add(item)
        } catch {
            print("CoreData Add Error!")
        }
    }
    
    @objc
    func appendDeletedHistory(_ notification: Notification) {
        guard let data = notification.userInfo,
              let deletedTitle = data["Title"] as? String,
              let from = data["State"] as? String else {
            return
        }
        
        let title = "Removed '\(deletedTitle)' from \(from)."
        let history = History(title: title,
                              createdAt: Date())
        
        model.value.insert(history, at: 0)
        addToCoreData(item: history)
    }
    
    @objc
    func appendAddedHistory(_ notification: Notification) {
        guard let data = notification.userInfo,
              let addedTitle = data["Title"] as? String else {
            return
        }
        
        let title = "Added '\(addedTitle)'."
        let history = History(title: title,
                              createdAt: Date())
        
        model.value.insert(history, at: 0)
        addToCoreData(item: history)
    }
    
    @objc
    func appendMovedHistory(_ notification: Notification) {
        guard let data = notification.userInfo,
              let deletedTitle = data["Title"] as? String,
              let pastState = data["PastState"] as? String,
              let currentState = data["CurrentState"] as? String else {
            return
        }
        
        let title = "Moved '\(deletedTitle)' from \(pastState) to \(currentState)."
        let history = History(title: title,
                              createdAt: Date())
        
        model.value.insert(history, at: 0)
        addToCoreData(item: history)
    }
}
