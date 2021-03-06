class Juju < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"
  url "https://launchpad.net/juju/2.6/2.6.1/+download/juju-core_2.6.1.tar.gz"
  sha256 "68662d8ce1cbb04e55ac5ad55f25a1797b02f66b0637d6f2c6d9e58b76390b76"

  bottle do
    cellar :any_skip_relocation
    sha256 "865ac9d488f975a607c43b2727dc9015b7ba080aaf0b26efe24ff56be79e46af" => :mojave
    sha256 "bd339d49cba9966cf7cbec9832846965c2f9665517bb733a85ac15509bed4c48" => :high_sierra
    sha256 "d20d415df336a4e031849afe75c8c537008a75e579cd41a1136d1547e3a2f835" => :sierra
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "github.com/juju/juju/cmd/juju"
    system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
    bin.install "juju", "juju-metadata"
    bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
