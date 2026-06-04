# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.60.tar.gz"
  sha256 "9dbd2a84bea4679180a996dceceedca2ba340186fa472436f62b97464a8aa326"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.60"
    sha256 cellar: :any, arm64_linux: "21732b94a9723d57dc0d2f8d89cbe438e36386646b44fa8c8d8a60fa50a1e46e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88f8b119df40c957f144ddbb7607c4ccf4556b3f15e229ef75e8b7a2c1d8864f"
    sha256 cellar: :any_skip_relocation, sequoia: "8d0c1a37bf436d97a3ce5ee758f835007d3f4679c2660408afc11b0ec6c5eac9"
    sha256 cellar: :any, x86_64_linux: "b43f1c3e0e97806889618ffc20d27f78d8c67c0a938293b8ea09017a7160d338"
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
