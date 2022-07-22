require 'minitest/autorun'
require_relative './../src/sync_tasks'
require 'webmock'
include WebMock::API

WebMock.enable!

class SyncTasksTest < Minitest::Test
  def test_1
    tasks = ['Add Two Numbers']

    SyncTasks.call(tasks)

    assert_equal 1, 2
  end
end
