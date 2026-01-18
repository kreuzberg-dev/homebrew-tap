class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.23.0.tar.gz"
  sha256 "bf0a57143aaa0a733ec69d1a86471dd61cd09d46dc77d913a92505e61ab64a87"
  license "MIT"




















  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.23.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "811222a47518bc085ae3e8581cb5703809598f598db76e16e6a229ca014908b8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/html-to-markdown-cli")
  end

  test do
    # Create a test HTML file
    (testpath/"test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    # Run html-to-markdown on the test file
    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
