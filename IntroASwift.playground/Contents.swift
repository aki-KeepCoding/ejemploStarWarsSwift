/*: 
# Intro a Swift
## Comentarios
Se pueden escribir en markdown si ponemos //: o /*: */

*/

import Foundation

//: ## Las variables pueden ser inferidas
var size : Float = 42.0
var size2 = 42 //: Infiere que es de tipo Float

//: ## Constantes -> con let
let name = "Anakin"


//: ## Todo es un objeto
Int.max
Double.abs(-42.0)

//: ## Conversiones
let a = Int(size)
let s = String(size)
//let sizef : Int = Int(name) => Kaske


//: ## Typealias -> para dar otros nombres a un tipo
typealias Integer = Int
var i : Integer = 1