# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.41.tar.gz"
  sha256 "bac4f16ff058e1cda90f46fac6fc4b7f77c44eccb8c77e73222d53d4b26fcf3f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.41"
    sha256 cellar: :any_skip_relocation, arm64_linux: "70135a1d46ed72b7695aa36c3a2af0387fce6739ac4c3d9c816a16a8914550ca"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d6f8c755582865b3e07f9c893c93219e263450c0bd7af73cf5e360f8f3974f2"
    sha256 cellar: :any_skip_relocation, sequoia: "df6b8b38c7e2eab153eeda1ede0d8bdb278cfb89fd1e0480f95ab17224fc7f65"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "faf44f1b8df490e91fa9e971f26ebb2c33f9acaa1a97e10567dfd111bbb00df3"
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
