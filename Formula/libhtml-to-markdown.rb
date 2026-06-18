# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.14"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2a1b6c2014fa1096236b4a63ecd11ba0e38cb778f73155a29e4a1f1310ad1e83"
    sha256 cellar: :any, arm64_sequoia: "e7ec27410ea140680ece9930a121e109f4942fa228d1a7a3b47d261e1a5abf3b"
    sha256 cellar: :any, sequoia: "a89bb5cf7068edd326e96771ead373a8eb02449e26c5ebebc66ec564fa15e01b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "437fd8a7c9cf3eb9a9e60a972b7fcc24d327ffb2962e237d3fb987c76a6364be"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ddca3de3c9ad757329736cfcfa5786c9ee2e5ac0eb19bab9ed8e960708e836ee"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1bca18fe4173610868da17ee0cc15be09d47ab47b42c9f984356b856e09c846c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b439d56e604e4f98356ec48a3d36aebcb3c3b29e1b3a0f44567329c3cea33f7c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2aa1c1744aee87a78d28aab84021a47bda21c95ee1b31a6dc79839e90bf5e82c"
    end
  end

  def install
    include.install "include/html_to_markdown.h"

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/html-to-markdown-rs.pc"

    inreplace lib / "pkgconfig/html-to-markdown-rs.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/html-to-markdown-rs").install Dir["lib/cmake/html-to-markdown-rs/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <html_to_markdown.h>
      #include <stdio.h>
      int main(void) {
          const char *v = html_to_markdown_version();
          printf("html-to-markdown %s\\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lhtml_to_markdown_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
