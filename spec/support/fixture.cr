module Fixture
  PATH = "spec/fixtures"

  def self.load(path)
    File.read(File.join(Fixture::PATH, path))
  end
end