with P_StructuralTypes;
use P_StructuralTypes;

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Sequential_IO;
with Ada.Strings.Unbounded;

package body P_StepHandler.ReverseIPHandler is
   
   function Make (Handler : in out ReverseIPHandler) return ReverseIPHandler is
   begin
      return Handler;
   end;
   
   overriding
   procedure Handle (Self : in out ReverseIPHandler) is
      TmpBlock : T_BinaryBlock;
   begin
      -- Looping through the 64-bits blocks of the BinaryText   
      for BlockIndex in Self.Get_BinaryContainer'Range loop
         TmpBlock := Process_Block(Self, Self.Ptr_BinaryContainer.all(BlockIndex));
         Replace_Block(Self.Get_BinaryContainer,BlockIndex,TmpBlock);                
      end loop;
      
      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;

   end;
   
   function Process_Block (Self : ReverseIPHandler ; 
                           Block : T_BinaryBlock) return T_BinaryBlock is
      -- PermIndex is the position of the next bit in the block
      PermIndex : Integer;
      -- TmpBlock is the binary block permuted
      TmpBlock : T_BinaryBlock;
   begin
      PermIndex := 40;   
      for BitIndex in TmpBlock'Range loop
         -- Permuting the the bit at BitIndex, replacing it by the one at
         TmpBlock(BitIndex) := Block(PermIndex);
         -- Updating the PermIndex for the next bit permutation
         if (PermIndex-32 > 0) then PermIndex := PermIndex-32;
         elsif BitIndex mod 8 = 0 then PermIndex := PermIndex+7;
         else PermIndex := PermIndex+40;
         end if;
      end loop;
      
      return TmpBlock;
   end;
   
   
end P_StepHandler.ReverseIPHandler;
