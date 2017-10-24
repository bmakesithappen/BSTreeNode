//
//  main.swift
//  BSTreeNode
//
//  Created by Bernard Désert on 9/11/17.
//  Copyright © 2017 Bernard Désert. All rights reserved.
//

import Foundation

/* TODO: Remove function next steps: write code for if is root , when the node you want to remove has 1 child (else if childCount() ==1  started) or 2 children , see note "the state where node is" add error to throw for this case
 
 
 
 New Concepts:
 willSet didSet (property observers)
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html
 
 https://www.devmynd.com/blog/a-swift-read-understanding-and-using-optionals/
 
 https://www.weheartswift.com/conditionals/  (has code examples / tests)
 
 https://medium.com/@abhimuralidharan/if-let-if-var-guard-let-and-defer-statements-in-swift-4f87fe857eb6

 
 ideas
 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree
 
 */


public class BSTreeNode {
    
    var parent: BSTreeNode?
    
    var rightChild: BSTreeNode? {
        willSet {
            self.rightChild?.parent = nil
        } //
        didSet{
            self.rightChild?.parent = self
        }
    }
    
    var leftChild: BSTreeNode? {
        willSet {
            self.leftChild?.parent = nil
        }
        didSet{
            self.leftChild?.parent = self
        }
    }
    
    var value: Int
    
    init(value: Int) { // return from
        self.value = value
    }
    
    public func isRoot() -> Bool {
        return self.parent == nil
    }
    
    public func isLeaf() -> Bool {
        return self.rightChild == nil && self.leftChild == nil
    }
    
    public func childCount() -> Int {
        var count = 0
        if self.leftChild != nil {
            count+=1
        }
        if self.rightChild != nil {
            count+=1
        }
        return count
    }
    
    public func insert(value: Int) -> BSTreeNode? {
        /*
         
         if value is less than root (self.value) make it leftChild
         else
         if value is greater than root (self.value) make it rightChild
         else
         Essentially the line is saying, "if you can let the new variable name equal the non-optional version of optionalName, do the following with it". As Martin pointed out, this is called Optional Binding.
         
         if value == self.value make a new
         
         */
        if value == self.value {
            return nil
        } else if value < self.value {
            if let left = leftChild {
                return  left.insert(value: value)
            } else {
                leftChild = BSTreeNode(value: value)
                return leftChild
            }
        } else {
            if let right = rightChild {
                return right.insert(value: value)
            } else {
                rightChild = BSTreeNode(value: value)
                return rightChild
            }
        }
    }
    
    public func search(value: Int) -> BSTreeNode? {  // We want to return a node
        if value < self.value {
            return leftChild?.search(value: value)
        } else if value > self.value {
            return rightChild?.search(value: value)
        } else {
            return self
        }
    }
    
    public func predecessor() {
        
    }
    
    public func sucessor() {
        
    }
    
    public func remove(value: Int) {
        if let foundNode = search(value: value) {
            if foundNode.isLeaf() {
                if foundNode.parent?.leftChild === foundNode {
                    foundNode.parent?.leftChild = nil
                } else if foundNode.parent?.rightChild === foundNode {
                    foundNode.parent?.rightChild = nil
                } else { // the state where node is detached from tree and part of a damaged tree and I want to throw an error communicating a damaged tree we do not want to run any other functions
                    
                }
            } else if foundNode.childCount() == 1 {
                // if the foundNode has one child I want to move the foundNode's child
                
            }   // if foundNode.ChildCount() == 2
                // decide between the two children which one can move and becomes the other child's  (have to decide between values)
                //
            
        } else { // whenvever you search for a value(Int) and it does not exist / found = nothing to remove
             // empty because nothing has to be done and is the last statement no return needed
        }
        
    }
}

var testNode = BSTreeNode(value: 6)

assert(testNode.isLeaf())

assert(testNode.insert(value: 10)!.value == 10)
assert(testNode.insert(value: 10) == nil)
assert(testNode.isLeaf() == false)



assert(testNode.isRoot())
assert(testNode.leftChild!.isRoot() == false)
assert(testNode.rightChild!.isRoot() == false)




