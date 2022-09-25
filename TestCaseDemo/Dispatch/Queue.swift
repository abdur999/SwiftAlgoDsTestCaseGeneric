//
//  Queue.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 09/09/22.
//

import Foundation

class ExecQueue {
    // Serial Queue
    // Serial queues execute one task at a time in the order in which they are added to the queue.
    // So a serial queue guarantees that a task will finish first before another task will start.
    let serialQueue = DispatchQueue(label: "serialQueue")
    
    // Concurrent Queue
    // Concurrent queues allow multiple tasks to run at the same time.
    // The code below shows how these two types of queues are created.
    let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    // What is the difference between asynchronous and synchronous tasks?
    // Synchronously starting a task blocks the calling thread until the task is finished. Asynchronously starting a task returns directly on the calling thread without blocking.
    
    
    //In GCD, you can achieve that with DispatchWorkItem. By setting it up with the task that needs to be done asynchroniously and calling the cancel method when needed
    func dipatchQueueCancelable() {
        let workItem = DispatchWorkItem { [weak self] in
            // Execute time consuming code.
        }
        
        // Start the task.
        DispatchQueue.main.async(execute: workItem)
        
        // Cancel the task.
        workItem.cancel()
    }
    
    func say(_ text: String, completion: @escaping () -> Void) {
        let delay = Double.random(in: 1...2)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            print(text)
            completion()
        }
    }
    
    //How can you group asynchronous tasks?
    //By using GCD, you can use DispatchGroup to achieve this.
    func groupAsyncTask() {
        let group = DispatchGroup()

        // The 'enter' method increments the group's task count.
        group.enter()
        say("I love cookies") {
            // Save the result.
            group.leave()
        }

        group.enter()
        say("Goodbye") {
            // Save the result.
            group.leave()
        }

        // This closure is called when the group's task count reaches 0.
        group.notify(queue: .main) { [weak self] in
            // Show the loaded results.
        }
    }
    
    //By using Operations, it's almost the same as with GCD. You can use the cancel method on the operation.
    func cancelableOperation() {
        let queue = OperationQueue()
        let blockOperation = BlockOperation {
            // Execute time consuming code.
        }

        // Start the operation.
        queue.addOperation(blockOperation)

        // Cancel the operation.
        blockOperation.cancel()
    }
    
    
    //When working with operations, you can add dependencies between them.
    func setDependentOperation() {
        let operation1 = BlockOperation {
            // Execute time consuming code.
        }
        let operation2 = BlockOperation {
            // Execute time consuming code.
        }
        let operation3 = BlockOperation {
            // operation1 and operation2 are finished.
        }
        operation3.addDependency(operation1)
        operation3.addDependency(operation2)
    }
    
    
    // What is a race condition?
    // A race condition can occur when multiple threads access the same data without synchronization and at least one access is a write.
    // For example if you read values from an array from the main thread while a background thread is adding new values to that same array.
    // Data races can be the root cause behind unpredicatable program behaviours and weird crashes that are hard to find
    
    // How can you avoid race conditions?
    //  To avoid race conditions you can access the data on the same serial queue or you can use a concurrent queue with a barrier flag.
    //  A barrier flag makes access to the data thread-safe.
    func avoidRaceCondition() {
        var queue = DispatchQueue(label: "messages.queue", attributes: .concurrent)

        queue.sync {
            // Code for accessing data
        }

        queue.sync(flags: .barrier) {
            // Code for writing data
        }
    }
    
    //Execute tasks in background and main thread combination
    func executeTask() {
        DispatchQueue.global(qos: .background).async {
            //Long running task execute here
            
            DispatchQueue.main.async {
                //UIUpdate done here
            }
        }
    }
}


//  How can you find and debug race conditions?
//  You can use Apples Thread Sanitizer to debug race conditions, it detects them at runtime.
//  The Thread Sanitizer can be enabled from the scheme configuration.
