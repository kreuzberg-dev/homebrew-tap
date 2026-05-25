# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.6"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "4987e1a0f55e4145af9054f31f0f49ad105e9e39c806ee51d86b82f03c53d85c"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9707c82f0281834f0461a7214caffb27851238ed44887b9738920f68bfe184be"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44c0e660b408b95eeafc42da26963110a708bca43917939752aaa45d2985466f"
    sha256 cellar: :any_skip_relocation, sequoia: "d532fe9dcce5a755d77b157ee92480181ff8f4f978dc333708f8497ee1e3cb73"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2a8626d55f898349056277acf647e3a0b213a59b6ac41c8f3070a7d40d7620a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
