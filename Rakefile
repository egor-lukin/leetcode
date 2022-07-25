task :test do
end

namespace :tasks do
  task :sync do
    require_relative './src/generator'
    require_relative './src/sync_tasks'

    config_path = '/app/.leetcode'
    tasks = File.read(config_path).split("\n")
    return if tasks.empty?

    SyncTasks.call tasks
  end
end
