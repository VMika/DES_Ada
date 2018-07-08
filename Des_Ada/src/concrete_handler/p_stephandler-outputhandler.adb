with P_StructuralTypes; use P_StructuralTypes;
with Ada.Integer_Text_IO;
with Ada.Sequential_IO;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;


package body P_StepHandler.OutputHandler is
   
   -------------------------------------------------------------------------
   ------------------------- CONSTRUCTOR -----------------------------------
   -------------------------------------------------------------------------
   
   function Make (Self : in out OutputHandler) return OutputHandler is
      
   begin    
      Self.Ptr_BinaryContainer := null;
      Self.NextHandler := null;
      return Self;
   end;
   
   
   ---------------------------------------------------------------
   --- HANDLE PROCEDURE : OVERRIDEN FROM PARENT ABSTRACT CLASS ---
   ---------------------------------------------------------------
   
   overriding
   procedure Handle (Self : in out OutputHandler) is
      package Char_IO is new Ada.Sequential_IO (Character);
      use Char_IO;
      
      Output : File_Type;
      Byte : T_Byte;
      CharCode : Integer;
      
   begin
      
      -------------------------------------------------------------------------
      -- This handler has two tasks : 
      -- => Loop through the coded data in the binary container
      -- => Convert these blocks into character before inserting them into the
      --    output file
      -------------------------------------------------------------------------
      Create (Output, Out_File, To_String(Self.Output_Name));
      for i in Self.Ptr_BinaryContainer.all'Range loop
         for j in 1..8 loop 
           Byte := Self.Ptr_BinaryContainer.all(i)(8*(j-1)+1..8*j);
           CharCode := Byte_To_CharacterCode(Byte);           
           Write (Output,Character'Val(CharCode));
         end loop;
      end loop;
            
      Close (Output);
      
      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;
      
   end Handle; 
   
   procedure Set_PaddingBitNumber 
     (Self : in out OutputHandler ; Number : in Integer) is 
   begin
      Self.PaddingBitNumber := Number;
   end;
   
   procedure Set_Output_Name (Self : in out OutputHandler;
                             Name : Unbounded_String) is 
   begin
      Self.Output_Name := Name;
   end;
   
     
end P_StepHandler.OutputHandler;
