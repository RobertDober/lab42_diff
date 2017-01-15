# frozen_string_literal: true
require_relative '../lib/lab42/diff'

PROJECT_ROOT = File.expand_path '../..', __FILE__
Dir[File.join(PROJECT_ROOT, 'spec/support/**/*.rb')].each { |f| require f }

RSpec.shared_examples "script yields result" do |lhs, rhs, expected|
  it{ expect( Lab42::Diff.script(lhs, rhs) ).to eq(expected) }
end


module ScriptYieldsResult
  def script(lhs, rhs, expected)
    include_examples "script yields result", lhs, rhs, expected
  end
end
RSpec.configure do |c|
  c.extend ScriptYieldsResult
  c.filter_run wip: true
  c.run_all_when_everything_filtered = true
end
