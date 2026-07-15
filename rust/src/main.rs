use fzf_wrapped::Fzf;

fn main() {
    let colours = vec![
        "red", "orange", "yellow", "green", "blue", "indigo", "violet",
    ];
    let mut fzf = Fzf::default();
    fzf.run().expect("Failed to start fzf")
}
