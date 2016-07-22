/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

extension ViewController {
  func removeAnimatorObservers(animator: UIViewPropertyAnimator?) {
    guard let animator = animator else { return }
    animator.removeObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.state))
    animator.removeObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.isRunning))
    animator.removeObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.isReversed))
  }
  
  func addAnimatorObservers(animator: UIViewPropertyAnimator?) {
    guard let animator = animator else { return }
    animator.addObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.state), options: .new, context: nil)
    animator.addObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.isRunning), options: .new, context: nil)
    animator.addObserver(self, forKeyPath: #keyPath(UIViewPropertyAnimator.isReversed), options: .new, context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: AnyObject?, change: [NSKeyValueChangeKey : AnyObject]?, context: UnsafeMutablePointer<Void>?) {
    switch keyPath {
    case .some(#keyPath(UIViewPropertyAnimator.state)):
      stateSegment.selectedSegmentIndex = imageMoveAnimator?.state.rawValue ?? 0
    case .some(#keyPath(UIViewPropertyAnimator.isRunning)):
      runningSegment.selectedSegmentIndex = Int(imageMoveAnimator?.isRunning ?? false)
    case .some(#keyPath(UIViewPropertyAnimator.isReversed)):
      reversedSegment.selectedSegmentIndex = Int(imageMoveAnimator?.isReversed ?? false)
    default:
      break
    }
  }
}
