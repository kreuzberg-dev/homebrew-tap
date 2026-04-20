# typed: false
# frozen_string_literal: true

class KreuzbergFfi < Formula
  desc "C library for document intelligence (kreuzberg FFI bindings)"
  homepage "https://kreuzberg.dev"
  version "4.3.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v#{version}/c-ffi-macos-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v#{version}/c-ffi-linux-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end

    on_arm do
      url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v#{version}/c-ffi-linux-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    include.install "include/kreuzberg.h"

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib/"pkgconfig").install "lib/pkgconfig/kreuzberg.pc"

    # Patch prefix in pkg-config file
    inreplace lib/"pkgconfig/kreuzberg.pc", "prefix=/usr/local", "prefix=#{prefix}"

    (lib/"cmake/kreuzberg-ffi").install Dir["cmake/*"]
  end

  test do
    (testpath/"test.c").write <<~C
      #include <kreuzberg.h>
      #include <stdio.h>
      int main(void) {
          const char *v = kreuzberg_version();
          printf("kreuzberg %s\\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lkreuzberg_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
