# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.9"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "073d1307fceffff57168a15d2f6aa96b473c6c523c8cee6fa38259c8a1fe1625"
    sha256 cellar: :any, arm64_sequoia: "24a819655e037ce2ac6e7c06e65fd7f437981329ada09095de6495d32e53ee2e"
    sha256 cellar: :any, sequoia: "d7c49faddca16f52a55af6080aaae0ca98cfa87fe2a5c820a02e9b83e3a83817"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3c4654607c1c1d260b82f1cfb201fe980a7e4602623e851221576cacc9c60285"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c93a2fb314e3982c80ea7445cde99b99a64fdc5812ea0b67048ed280cee963af"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0a9a0bd5226eec81b1210f8bdedb38c26e6bd4610d6dba4ccb48af59246543d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01306ae12e3660d1da60c4f56154598211a49e331992e6d0369ecfed91e841c7"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08caee43f5ff9483a87ca8d0efc7ec08ffe0ab1bd0752753c8841fc387e6d5ad"
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
