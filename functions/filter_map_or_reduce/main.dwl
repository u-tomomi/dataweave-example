%dw 2.0
output application/json
import time from dw::util::Timer
import * from dw::core::Arrays

var items = (1 to 100000) as Array map {
    id: $$,
    criteria: randomInt(100),
    yearOfBirth: 1900 + randomInt(123)
}
fun arrayLast() = items[-1]
fun mapLast()= (items map($))[-1]
fun reduceLast() = items reduce(item, acc)-> item


---
{
    arrayLast: time(() -> arrayLast()) then $.end - $.start,
    mapLast: time(() -> mapLast()) then $.end - $.start,
    reduceLast: time(() -> reduceLast()) then $.end - $.start,
    arrayLast: time(() -> arrayLast()) then $.end - $.start,
    mapLast: time(() -> mapLast()) then $.end - $.start,
    reduceLast: time(() -> reduceLast()) then $.end - $.start,
    arrayLast: arrayLast(),
    mapLast: mapLast(),
    reduceLast: reduceLast(),

} 
