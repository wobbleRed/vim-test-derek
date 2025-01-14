source spec/support/helpers.vim

describe "ExUnit"

  describe "with mix.exs"
    before
      cd spec/fixtures/exunit
    end

    after
      cd -
    end

    it "runs nearest tests"
      view +1 normal_test.exs
      TestNearest

      Expect g:test#last_command == 'mix test normal_test.exs'
    end

    it "runs specific nearest test"
      view +6 normal_test.exs
      TestNearest

      Expect g:test#last_command == 'mix test normal_test.exs:6'
    end

    it "runs file tests"
      view +1 normal_test.exs
      TestFile

      Expect g:test#last_command == 'mix test normal_test.exs'
    end

    it "runs test suites"
      view normal_test.exs
      TestSuite

      Expect g:test#last_command == 'mix test'
    end
  end

  describe "without mix.exs"
    after
    end

    it "runs nearest as file tests"
      view +1 normal_test.exs
      TestNearest

      Expect g:test#last_command == 'elixir normal_test.exs'
    end

    it "runs file tests"
      view normal_test.exs
      TestFile

      Expect g:test#last_command == 'elixir normal_test.exs'
    end

    it "runs test suites"
      view normal_test.exs
      TestSuite

      Expect g:test#last_command == 'elixir *.exs'
    end
  end

end
