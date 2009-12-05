
module Doorman
  module Helpers
    def allow(*args, &blk)
      _capture_within_rule_context(:allow, args, &blk)
    end
    
    def deny(*args, &blk)
      _capture_within_rule_context(:deny, args, &blk)
    end        
    
    def _capture_within_rule_context(type, args, &blk)
      _check_rule(Doorman::Rule.from_hash(type, args.first)) ? blk.call  : ""
    end
    private :_capture_within_rule_context
  end  
end
