# fn = () ->
#     res = await fetch('https://jsonplaceholder.typicode.com/todos/1')
#     rs = await res.json()
#     console.log(rs)
# fn()

fn = () ->
    fetch('https://jsonplaceholder.typicode.com/todos/1').then((res) -> res.json()).then((rs)-> console.log(rs))
fn()