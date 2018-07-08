package p_StepHandler.IPHandler is

   type IPHandler is new T_StepHandler with private;
   
   type Ptr_IPHandler is access all IPHandler;
   
   function Make (Handler : in out IPHandler) return IPHandler;
   
   procedure Handle (Self : in out IPHandler);
   
   function Process_Block (Self : IPHandler ;
                           Block : T_BinaryBlock) return T_BinaryBlock;
   
PRIVATE
   
   type IPHandler is new P_StepHandler.T_StepHandler with null record;
     
end p_stephandler.IPHandler;
