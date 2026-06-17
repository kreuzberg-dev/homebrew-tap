# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.54"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.54"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4ba9a40d0f60608e7e5a0cb831c47e40ce0b414f82a51048c36b80d1a25267bd"
    sha256 cellar: :any, arm64_sequoia: "6f506a9cf4dadd9ce6151d9829d2d33e6e3ed2b856d2d5dca93a7cabc1813d50"
    sha256 cellar: :any, sequoia: "7de448511f0c501a0d5dccb49d2111799e9a121eb8372c745b4c116d452ef154"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cb61eba2c09c6c606ac450bb606e1e968f235c53f979304b8d05ab71f0d4d30b"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2d52859700415f261bd4a728fe9027f729ff307ae57a48287fe5cbb7b5910a52"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fae88a693d44f5307b0ac41161fc8d0b2b4d85e80a8ebfb9b9dcbc1d7c3a5f00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf7d15e0c0ae96bea65ab83c492ccffced7a929ad93776439fed3f4ed2d9f45f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8802d7ad659dd5379a82844df0e8c96f75c6b69672e7b8d07aa9b5bfb1cbd0e"
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
