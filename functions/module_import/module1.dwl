import try, fail from dw::Runtime

var global_module="global_module1"

fun isNumber(value: Any)=try(() -> value as Number).success

fun function(value):String="module1 function"