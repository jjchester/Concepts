import UIKit
import CoreData

class TodoManager {
    static let shared = TodoManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        })
        return container
    }()
    
    var managedContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save changes to Core Data
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
            print("Data saved successfully!")
        } catch {
            fatalError("Failed to save Core Data context: \(error)")
        }
    }
    
    // Save a Todo object to Core Data
    func saveTodo(text: String, isDone: Bool) {
        let managedContext = self.managedContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Todo", in: managedContext) else {
            fatalError("Failed to retrieve entity description")
        }
        
        let newTodo = NSManagedObject(entity: entity, insertInto: managedContext)
        newTodo.setValue(text, forKey: "text")
        newTodo.setValue(isDone, forKey: "isDone")
        saveContext()
    }
    
    func createTodo(text: String, isDone: Bool = false) -> Todo {
        let managedContext = self.managedContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Todo", in: managedContext) else {
            fatalError("Failed to retrieve entity description")
        }
        
        let newTodo = NSManagedObject(entity: entity, insertInto: managedContext)
        newTodo.setValue(text, forKey: "text")
        newTodo.setValue(isDone, forKey: "isDone")
        
        let Todo = newTodo as! Todo
        return Todo
    }
    
    // Load all Todo objects from Core Data
    func loadTodos() -> [Todo]? {
        let managedContext = self.managedContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            let Todos = results as! [Todo]
            return Todos
        } catch {
            fatalError("Failed to fetch Todos from Core Data: \(error)")
        }
    }
    
    func deleteTodo(_ todo: Todo) {
        managedContext.delete(todo)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error While Deleting Todo: \(error.userInfo)")
        }
    }
}
