# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "82966347927c59280c5d1f242f3b65831e90905762b63d0903019fd02ebba1e4"
    sha256 cellar: :any, arm64_sequoia: "4029ad681ad6bb0bff18045ecd06edff9fd35d1b19794094c270c69c895e44df"
    sha256 cellar: :any, sequoia: "a59a95167d6f941dcb9b3f5ceb9e48bdbfefd6a8594a37fc9f83cfca46e66a07"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "94e9673efd2af531e86ead274fb1b6147e2300bc7598e786ae0399be51161c6d"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8f0c73beda47cfa89b49d59f68a034d9854569df214199681e7d5a76820ce13e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4d21a293788db923b23bb9515b6b1df17a35fb0dbe7f141da06d40b34ec356d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d583dde95bd0306568f7679c57b91b7cb47f36cb418782b37b68ae7830e3c615"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aeccdde9815a0c6558c0dc1359d52b8ae2274ee169e397a3edac31d1b58b6510"
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
          printf("html-to-markdown %s\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lhtml_to_markdown_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
