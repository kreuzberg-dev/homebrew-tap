# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.11.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "15d6fa7b30f61fa12f33158706ffc1ed776053935612f5ff476881c017473117"
    sha256 cellar: :any, arm64_tahoe: "ba0be35498677ffb04df267ebec742982b828af22f2f260e8365d1a2b340ea71"
    sha256 cellar: :any, sequoia: "65a9591f9081fd12d29a4bb6dc678c2ca6f7489f64a345658e86d1746dee7216"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5bc8422ea5b8ae333ffbc422569a2c15befeec290c1a958c91e3faeb5630ea64"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2bec896182713661e1ec80694e4b7eb096b5328a6f5a3b1ab7c847d5f643eee6"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "df29d07077018f4e46118cbce6f11dac0e2ff9df01641ee03514a5aaf50a7460"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c92ddd91a816fae5aacce42bac199aa86d1f5b51404e10bfce6a0f99d88dfb8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e770e1633ef668284fa034c60c90cba1f2dc90833a883e49419b529cdcaa7b2"
    end
  end

  def install
    include.install Dir["include/*.h"]

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/tree-sitter-language-pack.pc"

    inreplace lib / "pkgconfig/tree-sitter-language-pack.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/tree-sitter-language-pack").install Dir["lib/cmake/tree-sitter-language-pack/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <ts_pack.h>
      #include <stdio.h>
      int main(void) {
          /* Smoke: verify a known symbol resolves at link time. */
          (void) ts_pack_available_languages;
          printf("ts_pack OK\\n");
          return 0;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lts_pack_core_ffi"
    assert_match "ts_pack OK", shell_output("./test")
  end
end
