import ctermui

pub fn main() {
  ctermui.run(init, update, view)
}

fn init() {
  Nil
}

fn update(msg, state) {
  ""
}

fn view(msg: String, state: String) {
  ctermui.table(["ciao"])
}
