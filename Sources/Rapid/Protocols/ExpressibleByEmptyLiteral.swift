// ExpressibleByEmptyLiteral.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

/// A type that can be initialized using an empty array literal.
///
/// An empty array literal always has an element type of `Never`. This provides
/// a compile-time guarantee that the literal is indeed empty, since `Never`
/// is uninhabited and therefore can't be instantiated.
public protocol ExpressibleByEmptyArrayLiteral: ExpressibleByArrayLiteral {
  init(emptyArrayLiteral: Nothing)
}

public extension ExpressibleByEmptyArrayLiteral {
  init(arrayLiteral _: Never...) {
    self.init(emptyArrayLiteral: ())
  }
}

/// A type that can be initialized using an empty dictionary literal.
///
/// An empty dictionary literal always has element types of `Never`. This
/// provides a compile-time guarantee that the literal is indeed empty, since
/// `Never` is uninhabited and therefore can't be instantiated.
public protocol ExpressibleByEmptyDictionaryLiteral: ExpressibleByDictionaryLiteral {
  init(emptyDictionaryLiteral: Nothing)
}

public extension ExpressibleByEmptyDictionaryLiteral {
  init(dictionaryLiteral _: (Never, Never)...) {
    self.init(emptyDictionaryLiteral: ())
  }
}
