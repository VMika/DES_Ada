with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Interfaces.COBOL;
use Interfaces.COBOL;

package body P_StructuralTypes is
   
   package T_Bit_IO is new Ada.Text_IO.Modular_IO(T_Bit);
   
   function O_plus (b1 : in T_BinaryUnit ; b2 : in T_BinaryUnit) return T_BinaryUnit is
      Operand_Error : exception;
      res : T_BinaryUnit(1..b1'Length);
   begin     
      if (b1'Length /= b2'Length) then
         raise Operand_Error;
      else
         for i in 1..b1'Length loop
            res(i) := b1(b1'First + i - 1) + b2(b2'First + i - 1);
         end loop;
      end if;
      return res;
   end;
   
   function TextBlock_To_Binary (Block : String) return T_BinaryBlock is   
      BinaryTextBlock : T_BinaryBlock;
      IntValue : Integer;
      BitRank : Integer;  
   begin     
      for i in Block'Range loop
         BitRank := 0;
         IntValue := Character'Pos(Block(i));
         while BitRank /= 8 loop
            BinaryTextBlock(i * 8 - BitRank) := T_Bit(IntValue mod 2);
            IntValue := IntValue / 2;
            BitRank := BitRank + 1;
         end loop;
      end loop;      
      return BinaryTextBlock;
   end;
   
   function Byte_To_CharacterCode (Byte : in T_Byte) return Integer is
      CharCode : Integer;
   begin
      CharCode := 0;
      for i in Byte'Range loop
         CharCode := CharCode +
           Integer((Byte(Byte'First + i - 1)))*(2**(Byte'Last - i));
      end loop;
      return CharCode;
   end;
   
     
   function Integer_To_Binary (Number : Integer;
                               NbBits : Integer) return T_BinaryUnit is
      BitRank : Integer;
      Unit : T_BinaryUnit (1..NbBits);
      Tmp : Integer := Number;
   begin
      if (2 ** (NbBits +1)) < Number then
         raise Conversion_Error;
      else
         BitRank := 0;
         while Tmp /= 0 loop
            Unit(NbBits - BitRank) := T_Bit(Tmp mod 2);
            Tmp := Tmp / 2;
            BitRank := BitRank + 1;
         end loop;
         return Unit;
      end if;         
   end;
   
     
   
   
   procedure Replace_Block (Ptr_BinaryContainer : in BinaryContainer_Access;
                            Index          : in Integer;
                            BinaryBlock    : in T_BinaryBlock) is
   begin
      Ptr_BinaryContainer.all(Index) := BinaryBlock;
   end;
   
   procedure Put_BinaryUnit (Unit : T_BinaryUnit) is
   begin
      Put ("Print of Unit") ; New_Line ;
      for i in Unit'Range loop
         T_Bit_IO.Put (Unit(i)) ;
      end loop;
      New_Line;

   end;
   
   procedure Left_Shift (Unit : in out T_BinaryUnit ;
                        Iteration : in Positive) is  
      OverflowBit : T_Bit;
   begin      
      for Round in 1..Iteration loop        
         OverflowBit := Unit(1);
         for Index in 1..Unit'Last-1 loop
            Unit(Index) := Unit(Index+1);
         end loop;
         Unit(Unit'Last) := OverflowBit;   
      end loop;    
   end;   
   
   function Left (Block : T_BinaryUnit) return T_BinaryUnit is
   begin
      return Block (1..Block'Last/2);
   end;
   
   function Right (Block : T_BinaryUnit) return T_BinaryUnit is
   begin
      return Block ((Block'Last/2)+1..Block'Last);
   end;
   
end P_StructuralTypes;
