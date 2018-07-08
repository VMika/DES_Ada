with P_StructuralTypes;
use P_StructuralTypes;

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Sequential_IO;
with Ada.Strings.Unbounded;

package body P_StepHandler.IPHandler is
   
   function Make (Handler : in out IPHandler) return IPHandler is
   begin
      return Handler;
   end;
   
   overriding
   procedure Handle (Self : in out IPHandler) is
      TmpBlock : T_BinaryBlock;
   begin
      -- Looping through the 64-bits blocks of the BinaryText
      
      for BlockIndex in Self.Ptr_BinaryContainer'Range loop 
           TmpBlock := Process_Block (Self,Self.Ptr_BinaryContainer.all(BlockIndex));
         Replace_Block(Self.Get_BinaryContainer, BlockIndex, TmpBlock);                
      end loop;
      
      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;
      
   end;
   
   function Process_Block (Self : IPHandler;
                           Block : T_BinaryBlock)
                           return T_BinaryBlock is
      -- PermIndex is the position of the next bit in the block
      PermIndex : Integer;
      -- TmpBlock is the binary block permuted
      TmpBlock : T_BinaryBlock;
   begin
      PermIndex := 58;      
         -- Permutation of first 32 bits
         for BitIndex in 1..32 loop      
            -- Appending result to the TmpBlock
            TmpBlock(BitIndex) := Block(PermIndex);
            -- Updating the PermIndex for the next bit permutation
            if (PermIndex-8 > 0) then PermIndex := PermIndex-8;
            else PermIndex := PermIndex + 58;
            end if;       
         end loop;
         
         PermIndex := 57;  
         -- Permutation of last 32 bits
         for BitIndex in 33..64 loop
            -- Appending result to the TmpBlock
            TmpBlock(BitIndex) := Block(PermIndex);
            -- Updating the PermIndex for the next bit permutation
            if (PermIndex-8 > 0) then PermIndex := PermIndex-8;
            else PermIndex := PermIndex + 58;
            end if;           
      end loop; 
      
      return TmpBlock;
   end;
   
   
end P_StepHandler.IPHandler;
