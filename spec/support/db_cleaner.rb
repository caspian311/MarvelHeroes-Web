RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each, js: true) do
    @CLEANUP_STRATEGY_SET=true
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction unless @CLEANUP_STRATEGY_SET
    @CLEANUP_STRATEGY_SET = false

    DatabaseCleaner.start
  end

  config.after(:all, with_seeds: true) do
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:all) do
    DatabaseCleaner.clean_with :truncation
  end
end

