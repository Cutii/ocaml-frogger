(* We define our test case below *)

(* TESTS for frogger functions *)

let test_same_string () =
  Alcotest.(check string) "same string" "hello!" "hello!"


(* TEST SET for frogger functions *)
let frogger_set =
  let open Alcotest in
  [ test_case "Same string" `Quick test_same_string ]
