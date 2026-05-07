# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.8.0-rc.36.tar.gz"
  sha256 "e73158ff48d5e44b3c79b7bb8a5b9b962b81d1dcca7300de33b0fc4d9d91e650"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.36"
    sha256 cellar: :any_skip_relocation, arm64_linux: "936cdc5fab7b8359d39a3592b070117c041113328e82b7c4914bf63267d9a2a2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "17f956fd5fdb468f27b769a77107bcd7a81c8894264f7357cec6a12f069b9d00"
    sha256 cellar: :any_skip_relocation, sequoia: "cbe87b48721f2d2c2301c1f298fe335ddf642b58bcd0ff15626e6dfe69b64f1f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d41459db99b46dbe9be9c3c0181ed445227466fa4e7a787e1b1921f3072772d1"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
