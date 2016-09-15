module StrMap = Map.Make(String) ;;
let map = ref StrMap.empty in

let br = [".-" ; "-..." ; "-.-." ; "-.." ; "." ; "..-." ; "--." ; "...." ; ".." ; ".---" ; "-.-" ; ".-.." ; "--" ; "-." ; "---" ; ".--." ; "--.-" ; ".-." ; "..." ; "-" ; "..-" ; "...-" ; ".--" ; "-..-" ; "-.--" ; "--.."]
in

let ch x =
    let rec to_b = function
    | "" -> ""
    | s -> let ch = String.get s 0 in (List.nth br (int_of_char ch - int_of_char 'A')) ^ to_b (String.sub s 1 (String.length s - 1)) in to_b x
in
let l = input_line stdin in
let n = int_of_string (input_line stdin) in
for i = 0 to n - 1 do
    let w = ch (input_line stdin) in
    map := StrMap.add w
        ((if StrMap.mem w !map then StrMap.find w !map else 0)+1) !map
done;
print_endline (string_of_int (StrMap.find ".-" !map))
