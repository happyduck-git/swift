// RUN: %target-swift-frontend -strict-concurrency=complete -dump-ast %s | %FileCheck %s
// REQUIRES: concurrency, OS=macosx

@available(SwiftStdlib 5.1, *)
func f<S: AsyncSequence>(s: S) async throws {
  // CHECK-NOT: nextElement()
  // CHECK: next()
  for try await x in s { }
}
