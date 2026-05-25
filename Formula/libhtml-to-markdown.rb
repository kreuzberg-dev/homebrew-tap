# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8f61271b1eb0be2eee7d146b35b2b1f7ca5d09c6379476d255c5bd286f10ef2c"
    sha256 cellar: :any, arm64_sequoia: "f495d07d37656a4cc70f40f21e779933c0446a9bfe7e34f593cb3a578e511391"
    sha256 cellar: :any, sequoia: "a3b801e949eff960646d20d86052bc7dc4afa8494f14db77ce1fd3e1e86bd963"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "14aaf873932a8a9f7d70dccab76873b2e12c400cd225171661adeaba3ffe9bad"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ff9cdaf0126e0b50e5b906bac1df59e51ffecdda6ebb2ad55971870021e8ebb6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e827bc6ff62bfe9cd34d249853124c8d44d2c1c02b2f4e82d2729cdf57a7e5bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fcf7b16246580f3fab4426810925cdac0b148e33a0c47c85da869f76f597b22"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bad2854472ed6a2a55e5f3a46df7a565e819ec45b982f30dd38df90ebb977e6"
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
