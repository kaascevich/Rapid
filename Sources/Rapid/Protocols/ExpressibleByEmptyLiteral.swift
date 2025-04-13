// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

/// A type that can be initialized using an empty array literal.
///
/// An empty array literal always has an element type of `Never`. This provides
/// a compile-time guarantee that the literal is indeed empty, since `Never` is
/// uninhabited and therefore can't be instantiated.
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
