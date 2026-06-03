# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.7"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a04399bdedd5ee600b37c4dbfa8d0f21c36afc3142ce377c1b291163cd15a025"
    sha256 cellar: :any, arm64_sequoia: "25fdd437c9407bd933e90f79d42691445427d3ef74211ee95989d89f6f2fa528"
    sha256 cellar: :any, sequoia: "4af906ad7a3212867836737b90fcaf86a0e9c46b85b0a5ff14069e55e7fb29d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a84bb4516cadb72570e613b5cf307306edf5b90b73b96842779aef98791e7e2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e00f11394bd73fe6c0defd7a41b38060aa35af542dbd3d58d850eac693bdb8c4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "84033c89b92fa2a143f5286d3cd590ee3c912e66cb1cf234eae98e92a0b26bf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90fc16bd82e705893739454f0b802a0651426c1516a5c977869dc0b1a63a0670"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a277eb3df1ca90bb1e12deb482cf366b0e3f108dc72210451c395da2618e3358"
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
