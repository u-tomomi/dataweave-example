%dw 2.0
output application/json

var object1 ={
    "key1" : "value1",
    "key2" : {
        "key3" : "value3"
    }
}

var object2 ={
    "key4" : "value4",
    "key5" : {
        "key6" : "value6"
    }
}
var str1 = "Hello"
var str2 = "everyone"
var str3 = "in"
var str4 = "the"
var str5 = "future"
var str6 = "!"

---
{
    "object_concat1(++)" : object1 ++ object2,
    "object_concat1(++)" : ++(object1,object2),
    "object_concat2{()}" : {(object1), (object2)},
    // "object_concat2{()}" : {(object1, object2)}, //NG
    "object_concat3()" : {([object1, object2])},

    str_concat1 : str1 ++ " " ++ str2 ++ " "  ++ str3 ++ " "  ++ str4 ++ " "  ++ str5 ++ str6,
    str_concat2 : "$(str1) $(str2) $(str3) $(str4) $(str5)$(str6)" ,
    // str_concat3 : "$([1,2,3])" , //NG
    str_concat3 : "$((1 + 2 + 3) as String)" ,


}