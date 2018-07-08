with P_StructuralTypes;
use P_StructuralTypes;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package P_StepHandler is
   
   type T_StepHandler   is abstract tagged private;
   
   type Ptr_Handler is access all T_StepHandler'Class;
      
   procedure Handle (Self : in out T_StepHandler) is abstract;
   
   function Get_NextHandler (Self : in out T_StepHandler) return Ptr_Handler;
   
   procedure Set_NextHandler (Self            : in out T_StepHandler;
                              Ptr_StepHandler : Ptr_Handler);
   
   function Get_BinaryContainer (Self : in out T_StepHandler) 
                            return BinaryContainer_Access;
   
   procedure Set_BinaryContainer (Self : in out T_StepHandler;
                             Ptr_BinaryContainer : BinaryContainer_Access);

PRIVATE
        
   type T_StepHandler is abstract tagged
      record
         NextHandler      : Ptr_Handler;
         Ptr_BinaryContainer : BinaryContainer_Access;
      end record;

end P_StepHandler;
