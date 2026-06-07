# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.19"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.19"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4c10fd3517555a87f30c774dfc0129f17337a30201a7571b071a7c2c98fe1177"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0ce360f4d96ae2713b21c44fc3ec7db9f03ac3f2179fbe8802bdbc94a5dfc6f3"
    sha256 cellar: :any_skip_relocation, sequoia: "257547a0f214f08795054e927734996a7e1086b0b35b10602b29f57a24816735"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b96a60b08ae23f7877fadb5ac78a0967f39b62bbdccfa6478ad87be41bfedec"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "6edc2a706b553ecdf3ee384eef59c2dc6dfd8ce82ef58e7186aee26d05cda918"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "17adcaee4ce165819143b8576db3f73140473846bc324b3769bc4152bb4b9a82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fda2ca4c01f3a159b36660d51c3d4eb3a30c29e3a437c8faeeaffa14a22db0d0"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9d0c024e6eb892385d0a288ddc3313bdea8453eaf0b08543071a5302050792f"
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
