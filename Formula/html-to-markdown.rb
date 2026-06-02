# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2b3210dc9b5de97d6ec81a2e491bd16f3357d75bad4908284839d4c1981879d6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "870baea23b6c03474c77c27e1b7dafd64ae6cbfa773f9a9337f2191ffda527fd"
    sha256 cellar: :any_skip_relocation, sequoia: "3203a8f9fd443bc995a74ff364897c29fbc0c8fd519f73c09fe6b8074eb8a370"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "05031db00a31fa7bf9eeaf17ba52e78e544042eeef7b34e8cf625e92d7837507"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "17468929ec8395ae60865bfe4e269114b259aa84af77c2eaceb04277a19d9f04"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "d2ae20c9abb3e3304c19a030a5545da6a902038603924be2bd3e1619a85bb4e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c36db475daf51573b7c99b8982ac5ac572d9498990797cbc5476b058e47a12b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bb99553b30f4b8762a2ef73ebceacc6272c106ee445623cad5fbd55e843d0e7"
    end
  end

  def install
    bin.install "html-to-markdown"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
