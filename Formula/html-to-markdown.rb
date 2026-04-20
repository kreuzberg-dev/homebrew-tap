# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc 'High-performance HTML to Markdown converter powered by Rust'
  homepage 'https://github.com/kreuzberg-dev/html-to-markdown'
  url 'https://github.com/kreuzberg-dev/html-to-markdown/archive/v3.2.5.tar.gz'
  sha256 'c6cdbedea7fb4c73d85537db69a2a9c8b95f13c504f1f6f7c8520716853f3555'
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.2.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "02e4b44b450841a06eceddcfee8f9c39c60b4b5ccab050fb62e83f5d1ef0e322"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/html-to-markdown-cli')
  end

  test do
    # Create a test HTML file
    (testpath / 'test.html').write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    # Run html-to-markdown on the test file
    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match 'Hello World', output
    assert_match '**bold**', output
  end
end
