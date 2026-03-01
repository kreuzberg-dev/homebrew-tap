class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.27.0.tar.gz"
  sha256 "fc673a594409a794ce396bc4519718ff50736dd34afda870cad7587baf3a8e33"
  license "MIT"





























































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.27.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fb9d7aa56907d31d162ec9dfd6009a9ba29debf36f72b2a4738de1281afae341"
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
