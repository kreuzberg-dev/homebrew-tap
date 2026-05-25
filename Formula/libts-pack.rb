# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e58d590d84fca12fa3b8e05a7efb9158dddafe8bdd67bf7e132f3f1620cd4e63"
    sha256 cellar: :any, arm64_sequoia: "0c517e360d509594f370bb612bc96a9a5ef7a9f2db86654e11e92c93817650bb"
    sha256 cellar: :any, sequoia: "9e42c73dff2a3a6717dd4ad05113feef682b834c5a3785565bcbb7d2de43c275"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dbd77b1369d38eab047c0e807600c9be40c51dd35fff3d12539e358446b51f46"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "068ac2c8aff8a8a82b9cb6ca4a5958390296d3ec36535f983ce94cf43522624f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c2245572bbd248d284376c0a9eaa748377cebf6edc67a33beed0d8ec436b4b92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b03bc7a780295307a7a2e373e32b6da8b3bccab3f6561f0ca5fc701703ab7c48"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98eec31d4536daa67a6a6c1b189f2751bd412dab53e272b587d2a51a0d9018e3"
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
          printf("ts_pack OK\n");
          return 0;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lts_pack_core_ffi"
    assert_match "ts_pack OK", shell_output("./test")
  end
end
