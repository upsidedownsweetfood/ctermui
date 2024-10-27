import ctermlib
import gleam/io
import gleam/list
import gleam/string

pub fn run(
  init: fn() -> Nil,
  update: fn(String, String) -> String,
  view: fn(String, String) -> String,
) {
  init()
  loop("", "", update, view)
  Nil
}

fn loop(state, msg, update, view) {
  let new_state = update(msg, state) |> view(state)
  display(state, new_state)
  loop(new_state, msg, update, view)
}

fn display(_previous: String, new: String) {
  let diff = new
  io.print(diff)
}

pub fn table(fields: List(String)) -> String {
  let header =
    fields
    |> list.reduce(fn(x, y) { string.append(x, y) })

  case header {
    Ok(x) -> x
    Error(_) -> panic
  }

  ctermlib.ciao()
}
