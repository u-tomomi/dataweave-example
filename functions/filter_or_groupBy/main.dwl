%dw 2.0
output application/json
import time from dw::util::Timer


var items = 1 to 10 map {
    "id" : $,
    "type"  : randomInt(5) + 1
}

fun filter_cnt()={
    "1" : sizeOf(items filter ($."type" == 1)),
    "2" : sizeOf(items filter ($."type" == 2)),
    "3" : sizeOf(items filter ($."type" == 3)),
    "4" : sizeOf(items filter ($."type" == 4)),
    "5" : sizeOf(items filter ($."type" == 5))
}

fun group_cnt()=do {
    var group_list =  items groupBy($."type")
    --- 
    {
        "1" : sizeOf(group_list."1") default 0,
        "2" : sizeOf(group_list."2") default 0,
        "3" : sizeOf(group_list."3") default 0,
        "4" : sizeOf(group_list."4") default 0,
        "5" : sizeOf(group_list."5") default 0,
    }    

}
fun group_cnt2()=  items groupBy($."type") pluck( ( ($$) : sizeOf($)) ) reduce((item, acc={})-> acc ++ item)



---
{
    filter_cnt  : filter_cnt(),
    group_cnt : group_cnt(),
    group_cnt2 : group_cnt2(),
    filter_cnt: time(() -> filter_cnt()) then $.end - $.start,
    group_cnt: time(() -> group_cnt()) then $.end -  $.start,
    group_cnt2: time(() -> group_cnt2()) then $.end -  $.start,
}
