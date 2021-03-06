module EnumStateMachine
  module YARD
    module Handlers
      # Handles and processes #event
      class Event < Base
        handles method_call(:event)
        
        def process
          if owner.is_a?(EnumStateMachine::Machine)
            handler = self
            statement = self.statement
            names = extract_node_names(statement.parameters(false))
            
            names.each do |name|
              owner.event(name) do
                # Parse the block
                handler.parse_block(statement.last.last, :owner => self)
              end
            end
          end
        end
      end
    end
  end
end
