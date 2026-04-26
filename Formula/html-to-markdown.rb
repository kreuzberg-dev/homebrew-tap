# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc 'High-performance HTML to Markdown converter powered by Rust'
  homepage 'https://github.com/kreuzberg-dev/html-to-markdown'
  url 'https://github.com/kreuzberg-dev/html-to-markdown/archive/v3.2.5.tar.gz'
  sha256 '394276e22a1624065a373c17ea37c632e7659bde9b6067473c3486acf70b85ef'
  license 'MIT'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.0-rc.2'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: 'fb3eddac324eab6065e178bc3a27865545a39e3e1308ca44cbe4a23ce74a94d8'
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
