# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.39.tar.gz"
  sha256 "2e78c92f54097c903a88faf4dfa2de7105a4509cfd068b038022266e1d55a708"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.39"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3e6fc3597e039309ea8df21772586d3c1fdf65a6c7f98790da1bfbc65df65cfa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d5b444a1a3e13659127130fb94948ea2f0710464107946cb24b5dda2a72bfc9"
    sha256 cellar: :any_skip_relocation, sequoia: "0de6f0cba87dba0f379231bcef8d134d80f15ac96b6a26873cf7727a1b5c9141"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cec21ec4e7318c9ebc32b41544659236daa3bbcc7b2fffac3dfd66f3b2ad08b4"
  end

  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
