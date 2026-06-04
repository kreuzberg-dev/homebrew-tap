# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.59.tar.gz"
  sha256 "2e78636f95797c35d1b739a7863647cde74ca5aa9a70d0902c686582faf69f2f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.58"
    sha256 cellar: :any, arm64_linux: "e609b47d90d04a5702328319508338b2cd4c54b17b14b5ab6b32c2045ed1507a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b4d15d909c0862558e6001b6b2bbea4c3e153f9c2c44d7daa21a89e2b1f355c8"
    sha256 cellar: :any_skip_relocation, sequoia: "0751b8a4a01671bd7f33f6318bb3ddd6c00d1ad628b0db123702f6774acadcef"
    sha256 cellar: :any, x86_64_linux: "a6726b3c8c0878e912ddadef92b3fa8cdc2955f39c0e31a2c9ccde1b8d06df83"
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
