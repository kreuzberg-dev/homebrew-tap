# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.33.tar.gz"
  sha256 "9795ccd8161d52ec6fbb9a0467350cdecc114d109511a3b1ad2927acb7ec96fe"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.32"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dbd47d5ec21172af10591153d0da40570b4f8fac7905536e7bec5e918e877d84"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "320eb311c292bc64553fb90dd57c30878472d9027f6966eb5db7019efce59b38"
    sha256 cellar: :any_skip_relocation, sequoia: "6915213d0e79392d51f3b0044271134ebf403087128477dc6ed91a77551206dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "878f75ce875ef167eaaccb7a19032cc9dbc5158a4625e4492f96f562528cfee0"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
