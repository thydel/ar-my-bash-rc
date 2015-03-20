BEGIN { m = "^+pipe$" }
$1 ~ m && $2 { $1 = ""; p = $0; $0 = "" }
!p
$0 ~ m { close(p); p = 0 }
p { print | p }
