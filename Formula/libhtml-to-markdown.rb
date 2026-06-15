# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.9"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "35c8f0376cdf38f9b1d981b6820a28a0ac7573cdd3135e3b4d0168c051e22567"
    sha256 cellar: :any, arm64_sequoia: "bf1ce7e302254b065d86968e1e9cf8870cccac3b7bfee8672b52e9912b938bf3"
    sha256 cellar: :any, sequoia: "b0a4d66e95514f7ebbca361a071c0e48d3ea9fabbbc7616ff5f7bbea482f42fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8548e460cfd6964ae0e11b828b3f65f60c4b8366643b844d30e5671ad945a445"
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
