# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.47"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.47"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a5b5fead2b334d4cc34aed22c483c831ede96216e780c06b05e26094694722cc"
    sha256 cellar: :any, arm64_sequoia: "da4eb2d4e978cab18e7d22b599803a37088b261afb479810297d75aaddf0fa6a"
    sha256 cellar: :any, sequoia: "c1e2779b4e912be54d1bb245b15e9bc0087f72f9bc25d72ecce93300e52111e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b914fa80cef6e2603af2071b643c81fad3c467e18b30b80d8e563ca7f9211b92"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "574fb8097278114eae96810c1c9e15ee52180143831de598a3c64222ee4e849e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8774a67cece5dea6805076ed653393b1f375fe49d57e18e759b2ccef012f339d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82ef670dcde3997d4fa153ecdde2b2edecec384eeb8d206217e6649ed817fcf8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e1c813113b48299172fb00a732322a5d973b4c563467bfa4a199bece103507a"
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
