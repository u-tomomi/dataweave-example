%dw 2.0
output application/json
import module1
import module2

import module1 as mod1
import module2 as mod2

import * from module1
import * from module2

import function,global_module from module1
import function,global_module from module2

---
{
    fn1 : module1::function(payload.message),
    fn2 : module2::function(payload.message),
    vars : module1::global_module,
    vars : module2::global_module,

    fn1 : mod1::function(payload.message),
    fn2 : mod2::function(payload.message),
    vars : mod1::global_module,
    vars : mod2::global_module,

    fn1 : function(payload.message),
    fn2 : function(payload.message),
    vars : global_module,
    vars : global_module,

}