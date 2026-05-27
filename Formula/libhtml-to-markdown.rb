# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "05c095d6071dc2fbb73a8ba7b79fc5f3ebb386514f30ae86ddf0f3194956ba29"
    sha256 cellar: :any, arm64_sequoia: "4491182704c2cee1039dfa9f95c0a6d5dfc0a8786e19709b0253c3909d489ee4"
    sha256 cellar: :any, sequoia: "ad17abb666520f632b02d3922b54cf4d564859365aba15570bbc7ef2520239ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23ac92a4cf7b848bf93677e6a32a26ab2ff9e055bcb563238689b6b0d43f8ecd"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7e52e29dc0e1e00476ca6381a4a4a5d6b9ff00bf0b9379cc36640f631e47cb7f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d6fa85037a33b7e4b557532f041b5c07d37b8bf5070544c5336ecbf7b238785d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c70e692dfb64129e0935eeb4ffc1e7d261cf45ad6739851948c16c4b312fbdbd"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "402522c2dfa3286f0a71c30ac28d94a84c850a138fe7518af37af9a84ca03c5a"
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
