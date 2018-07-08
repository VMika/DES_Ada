package p_StepHandler.ReverseIPHandler is

   type ReverseIPHandler is new T_StepHandler with private;
   
   type Ptr_ReverseIPHandler is access all ReverseIPHandler;
   
   function Make (Handler : in out ReverseIPHandler) return ReverseIPHandler;
   
   procedure Handle (Self : in out ReverseIPHandler);
   
   function Process_Block (Self : ReverseIPHandler;
                           Block : T_BinaryBlock) return T_BinaryBlock;
   
PRIVATE
   
   type ReverseIPHandler is new P_StepHandler.T_StepHandler with null record;
     
end p_stephandler.ReverseIPHandler;
