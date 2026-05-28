# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.5"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "98b08215fd70102f0021059b200a9998751e6d773f64ab0cac1a2405d0d0e927"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "536ceb709a3f1c05b6409757bdfff8312569fe5e79dd306d652887b9d6c27e3f"
    sha256 cellar: :any_skip_relocation, sequoia: "66d1cd193ab51f5dd7f3dfeb2a0528750d552d8e0d7f5d3cf264f2d5380b020f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6b1d22ab53d2d66bef4358adf8120e89544ac23fb9f41a4bedb32ecc37751d22"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "76b2be7f3218e56a8c291d0c72ea9c52a709c58883da4c198e5daaceadef27b1"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "8680613223ca15016198d209ceda69d6fdbf25da63582aea7040731962477a9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb9f644d6b50e352b90dc584ed8ae29e06148f62d65ecc88f2bf551717761a4c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bbd79e8f2d2c3e385b5968024083ab97651682215c7701bc2ca5f47a33934c8"
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
