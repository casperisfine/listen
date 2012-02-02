require 'rbconfig'

module Listen
  class Adapter

    # Select the appropriate adapter implementation for the
    # current OS and initializes it.
    #
    # @return [Listen::Adapter] the chosen adapter
    #
    def self.select_and_initialize(listener)
      if Adapters::Darwin.usable?
        Adapters::Darwin.new(listener)
      else
        Adapters::Polling.new(listener)
      end
    end

    def initialize(listener)
      @listener = listener
    end

    # Start the adapter.
    #
    def start
    end

    # Stop the adapter.
    #
    def stop
    end

  end
end
