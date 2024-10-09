%dw 2.0
output application/json
import time from dw::util::Timer
import * from dw::core::Arrays

var items = (1 to 100000) as Array map {
    id: $$,
    criteria: randomInt(100),
    yearOfBirth: 1900 + randomInt(123)
}

fun update_item() = items map ($ update {case id at .id -> id + 1})
fun add_delete_item() = items map ({id : $.id + 1, ($ - "id")})

---
{
    update_item: (update_item())[-1],
    add_delete_item: (add_delete_item())[-1],
    update_item: time(() -> update_item()) then $.end - $.start,
    add_delete_item: time(() -> add_delete_item()) then $.end - $.start,

} 
