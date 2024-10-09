%dw 2.0
output application/json
var global_var1 = "global_var"

var global_var2 = do {
    var local_var = 100
---
    local_var    
}

fun global_fun1(value : String) : String =  "$(value) global_function1"
fun global_fun2(value : String) : String = "$(value) $(global_var2) global_function2"

fun global_fun3(value : String): String = do {
    var local_var = "local_var"
    var local_var2 = do {
        var local_var = "nested_var"
    ---
        local_var    
    }
    fun local_fun(v) =  "$(value) $(v) $(local_var) $(local_var2)"
---    
    local_fun("local_arg")
}


---
{
    global_var1 : global_var1,
    global_var2 : global_var2,
    global_fun1 : global_fun1("fun1"),
    global_fun2 : global_fun2("fun2"),
    global_fun3 : global_fun3("fun3"),

}