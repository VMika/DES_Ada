with Ada.Text_IO; use Ada.Text_IO;
with P_StructuralTypes;
use P_StructuralTypes;

package body P_stephandler is
   
   function Get_NextHandler (Self : in out T_StepHandler) return Ptr_Handler is
   begin
      return Self.NextHandler;
   end;
   
   procedure Set_NextHandler (Self            : in out T_StepHandler;
                              Ptr_StepHandler : Ptr_Handler) is
   begin
      Self.NextHandler := Ptr_StepHandler;
   end;
   
   procedure Set_BinaryContainer (Self : in out T_StepHandler;
                             Ptr_BinaryContainer : BinaryContainer_Access) is
   begin
      Self.Ptr_BinaryContainer := Ptr_BinaryContainer;
   end;
   
   function Get_BinaryContainer (Self : in out T_StepHandler) 
                            return BinaryContainer_Access is
   begin
      return Self.Ptr_BinaryContainer;
   end;
   
   
end P_stephandler;
