# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.14"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1613af8c90d07c602615b430ec256edbd4b94c9b167eb73a361bae8852540a7b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88be26cf543e8f9c929b9a961183980545619a3e0564d1e2f9e29d465fa0cc04"
    sha256 cellar: :any_skip_relocation, sequoia: "5096272563760c5625dab13d2b9249b8114f4ad56c189044e8f130091e34f133"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cecc3a20536059ba5b7512897d3793153bc04d10aee223d1718fc7986faf9069"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "27a40603f190c8f8565556b448cdfbb8a321a097b1ad06be259439e2151e24da"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "15a626266b6ef4d0d40df4f8f7c087ff695b1329f7d1cc6876057b76ba191aca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43afc39d4e2ba0d8bf923cec6536c3dc83900baafedd3719bede8a21d094649a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa106d69fc1dacd77f4fa8d394f934f87e1c89a89ad33d9abdefcbc5bb9b4913"
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
