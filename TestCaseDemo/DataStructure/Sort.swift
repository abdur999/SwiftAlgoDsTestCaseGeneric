//
//  Sort.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 19/09/22.
//

import Foundation
//BubbleSort Alogorithm
/*
 This algorithm nowadays has just an educational meaning because it’s always slow (with always I mean it’s slow in the best or worst case), it’s O(n²) in time complexity. This means that it needs always n² steps to converge to the solution (i.e. input N = 50, number of steps to reach the solution = 1000).
 
 */
extension Array where Element: Comparable {
    
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
}

func swap<T: Comparable>(left: inout T, right: inout T) {
    print("Swapping \(left) and \(right)")
    let temp = right
    right = left
    left = temp
}

//InsertionSort Alogorithm
/*
To quickly understand how insertion sort works, think that it’s the usual way in which the human being sorts cards. Starting from the first one, we look for a place in which put the current card in order. Then we move to the second, looking for sorting that card and so on until the last one.
*/
extension Array where Element: Comparable {
        
    func insertionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 1..<data.count { // 1
            let key = data[i] // 2
            var j = i - 1
            
            while j >= 0 && areInIncreasingOrder(key, data[j]) { // 3
                data[j+1] = data[j] // 4
                
                j = j - 1
            }
            
            data[j + 1] = key // 5
        }
        
        return data
    }
}

//Selection Sort
/*
 This it the third common algorithm that is easy to be implemented but it’s still quite slow. The selection sort is just a variation of the insertion sort but it works in a slightly different way.
 */
extension Array where Element: Comparable {
    func selectionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) {
            var key = i // 1
            
            for j in i+1..<data.count where areInIncreasingOrder(data[j], data[key]) { // 2
                key = j
            }
            
            guard i != key else { continue }
            
            data.swapAt(i, key) // 3
        }
        
        return data
    }
}

// Merge Sort
/*
 The Merge Sort is, in this implementation, a usual divide-and-conquer algorithm. The idea behind this algorithm is that it proceeds with a top-down splitting of the array. Once this operation is completed, the array is sorted bottom-up, sorting initially every couple of adjacent elements and then proceeding up to the entire array.
 */
extension Array where Element: Comparable {
    private func merge(left: [Element], right: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var output: [Element] = []
        
        var mutableLeft = left
        var mutableRight = right
        while mutableLeft.count > 0 && mutableRight.count > 0 {
            
            if let firstElement = mutableLeft.first, let secondElement = mutableRight.first {
                
                if !areInIncreasingOrder(firstElement, secondElement) {
                    output.append(secondElement)
                    mutableRight.remove(at: 0)
                } else {
                    output.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
            }
        }
        
        output.append(contentsOf: mutableLeft)
        output.append(contentsOf: mutableRight)
        
        return output
    }
    
    /*
     The Merge Sort is, in this implementation, a usual divide-and-conquer algorithm. The idea behind this algorithm is that it proceeds with a top-down splitting of the array. Once this operation is completed, the array is sorted bottom-up, sorting initially every couple of adjacent elements and then proceeding up to the entire array.
     */
    private func _emMergeSort(data: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        if data.count < 2 { return data }
        
        let leftArray = Array(data[..<Int(data.count / 2)]) // 1
        let rightArray = Array(data[Int(data.count / 2)..<data.count]) // 2
        return merge(left: _emMergeSort(data: leftArray, by: areInIncreasingOrder), right: _emMergeSort(data: rightArray, by: areInIncreasingOrder), by: areInIncreasingOrder) // 3
    }
    
    func emMergeSort(by: ((Element, Element) -> Bool) = (<)) -> [Element] {
        let data = self
        
        return _emMergeSort(data: data, by: by)
    }
    
    private func _quickSort(_ array: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool)) -> [Element] {
            if array.count < 2 { return array } // 0
            
            var data = array
            
            let pivot = data.remove(at: 0) // 1
            let left = data.filter { areInIncreasingOrder($0, pivot) } // 2
            let right = data.filter { !areInIncreasingOrder($0, pivot) } // 3
            let middle = [pivot]
            
            return _quickSort(left, by: areInIncreasingOrder) + middle + _quickSort(right, by: areInIncreasingOrder) // 4
        }
        
        func quickSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
            return _quickSort(self, by: areInIncreasingOrder)
        }
}

/*
 As we have seen every algorithm has its own qualities but sometimes there are algorithms that work really well for specific context.
 I always focused on the following algorithm because a professor during an exam asked me if O(nlogn) is the best performance possible for sorting. And the answer is no! ☺️ (well, this could happen also during the interviews!)
 */
extension Array where Element == Int {
    func bucketSort(reverse: Bool = false) -> [Element] {
        var data = self
        
        guard data.count > 0 else { return [] }
        
        let max = data.max()!
        var buckets = [Int](repeating: 0, count: (max + 1))
        var out = [Int]()
        
        for i in 0..<data.count {
            buckets[data[i]] = buckets[data[i]] + 1
        }

        buckets.enumerated().forEach { index, value in
            guard value > 0 else { return }
            
            out.append(contentsOf: [Int](repeating: index, count: value))
        }

        return reverse == true ? out.reversed() : out
    }
}

class QuickSortX {
     func quicksortLomuto<T: Comparable>(_ a: inout [T],
                                               low: Int, high: Int) {
      if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
          print("pivot \(pivot) high \(high) low \(low)")
      }
    }
    // MARK: - Lomuto
    /*
      Lomuto's partitioning algorithm.
      This is conceptually simpler than Hoare's original scheme but less efficient.
      The return value is the index of the pivot element in the new array. The left
      partition is [low...p-1]; the right partition is [p+1...high], where p is the
      return value.
      The left partition includes all values smaller than or equal to the pivot, so
      if the pivot value occurs more than once, its duplicates will be found in the
      left partition.
    */
    func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
      // We always use the highest item as the pivot.
      let pivot = a[high]

      // This loop partitions the array into four (possibly empty) regions:
      //   [low  ...      i] contains all values <= pivot,
      //   [i+1  ...    j-1] contains all values > pivot,
      //   [j    ... high-1] are values we haven't looked at yet,
      //   [high           ] is the pivot value.
      var i = low
      for j in low..<high {
        if a[j] <= pivot {
          (a[i], a[j]) = (a[j], a[i])
          i += 1
        }
      }
        // Swap the pivot element with the first element that is greater than
          // the pivot. Now the pivot sits between the <= and > regions and the
          // array is properly partitioned.
          (a[i], a[high]) = (a[high], a[i])
        print("pivot = \(i)")
          return i
    }
    
    // MARK: - Hoare partitioning
    /*
      Hoare's partitioning scheme.
      The return value is NOT necessarily the index of the pivot element in the
      new array. Instead, the array is partitioned into [low...p] and [p+1...high],
      where p is the return value. The pivot value is placed somewhere inside one
      of the two partitions, but the algorithm doesn't tell you which one or where.
      If the pivot value occurs more than once, then some instances may appear in
      the left partition and others may appear in the right partition.
      Hoare scheme is more efficient than Lomuto's partition scheme; it performs
      fewer swaps.
    */
    func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
      let pivot = a[low]
      var i = low - 1
      var j = high + 1

      while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot

        if i < j {
            a.swapAt(i, j)
        } else {
          return j
        }
      }
    }

    /*
      Recursive, in-place version that uses Hoare's partioning scheme. Because of
      the choice of pivot, this performs badly if the array is already sorted.
    */
    func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
      if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
      }
    }
    
    // MARK: - Randomized sort
    /* Returns a random integer in the range min...max, inclusive. */
    public func random(min: Int, max: Int) -> Int {
      assert(min < max)
      return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }

    /*
      Uses a random pivot index. On average, this results in a well-balanced split
      of the input array.
    */
    func quicksortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
      if low < high {
        // Create a random pivot index in the range [low...high].
        let pivotIndex = random(min: low, max: high)

        // Because the Lomuto scheme expects a[high] to be the pivot entry, swap
        // a[pivotIndex] with a[high] to put the pivot element at the end.
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])

        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1)
        quicksortRandom(&a, low: p + 1, high: high)
      }
    }
}
class ExecuteQuickSort {
    
   var arr = [10, 11, 55, 66, 77, 88, 09, 34, 35, 27, 92, 87, 34, 43, 54]
    let quickSortX = QuickSortX()
    func executeQickSort() {
    quickSortX.quicksortLomuto(&arr, low: 0, high: arr.count-1)
        print("item is \(arr)")
    }
    var arr2 = [10, 11, 55, 66, 77, 88, 09, 34, 35, 27, 92, 87, 34, 43, 54]
    func executeQickSortHoare() {
    quickSortX.quicksortHoare(&arr2, low: 0, high: arr2.count-1)
        print("item is \(arr)")
    }
    
    var arr3 = [10, 11, 55, 66, 77, 88, 09, 34, 35, 27, 92, 87, 34, 43, 54]
    func executeQickSortRandom() {
        quickSortX.quicksortRandom(&arr3, low: 0, high:  arr3.count-1)
        print("item is \(arr)")
    }
}
