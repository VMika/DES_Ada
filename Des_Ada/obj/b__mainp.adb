pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__mainp.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__mainp.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E070 : Short_Integer; pragma Import (Ada, E070, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "ada__containers_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "interfaces__c_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps__constants_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__object_reader_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__dwarf_lines_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "system__traceback__symbolic_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "interfaces__c__strings_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "interfaces__cobol_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__task_info_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "ada__tags_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__streams_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__file_control_block_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__finalization_root_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__finalization_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__file_io_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "ada__streams__stream_io_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__storage_pools_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "system__finalization_masters_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__storage_pools__subpools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__strings__unbounded_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ada__real_time_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "ada__text_io_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "system__pool_global_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "system__sequential_io_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "system__tasking__initialization_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "system__tasking__protected_objects_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "system__tasking__protected_objects__entries_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "system__tasking__queuing_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "system__tasking__stages_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "p_structuraltypes_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "p_stephandler_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "p_stephandler__feistelhandler_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "p_stephandler__inputhandler_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "p_stephandler__iphandler_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "p_stephandler__keyhandler_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "p_stephandler__outputhandler_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "p_stephandler__reverseiphandler_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E226 := E226 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "p_stephandler__reverseiphandler__finalize_spec");
      begin
         F1;
      end;
      E224 := E224 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "p_stephandler__outputhandler__finalize_spec");
      begin
         F2;
      end;
      E222 := E222 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "p_stephandler__keyhandler__finalize_spec");
      begin
         F3;
      end;
      E220 := E220 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "p_stephandler__iphandler__finalize_spec");
      begin
         F4;
      end;
      E209 := E209 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "p_stephandler__inputhandler__finalize_spec");
      begin
         F5;
      end;
      E207 := E207 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "p_stephandler__feistelhandler__finalize_spec");
      begin
         F6;
      end;
      E175 := E175 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "p_stephandler__finalize_spec");
      begin
         F7;
      end;
      E246 := E246 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F8;
      end;
      E212 := E212 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__sequential_io__finalize_spec");
      begin
         F9;
      end;
      E203 := E203 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      E168 := E168 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "ada__text_io__finalize_spec");
      begin
         F11;
      end;
      E130 := E130 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "ada__strings__unbounded__finalize_spec");
      begin
         F12;
      end;
      E146 := E146 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__storage_pools__subpools__finalize_spec");
      begin
         F13;
      end;
      E148 := E148 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__finalization_masters__finalize_spec");
      begin
         F14;
      end;
      E216 := E216 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "ada__streams__stream_io__finalize_spec");
      begin
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "system__file_io__finalize_body");
      begin
         E172 := E172 - 1;
         F16;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, True, 
           False, False, True, True, True, True, False, False, 
           False, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, True, False, False, True, False, True, 
           False, False, True, False, False, False, True, False, 
           False, True, True, False, True, True, False, False, 
           True, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           True, False, False, False, False, False, True, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 0, 2, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E066 := E066 + 1;
      Ada.Strings'Elab_Spec;
      E050 := E050 + 1;
      Ada.Containers'Elab_Spec;
      E038 := E038 + 1;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E070 := E070 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E056 := E056 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E045 := E045 + 1;
      E076 := E076 + 1;
      E052 := E052 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E037 := E037 + 1;
      E078 := E078 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E108 := E108 + 1;
      Interfaces.Cobol'Elab_Spec;
      E201 := E201 + 1;
      System.Task_Info'Elab_Spec;
      E118 := E118 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E134 := E134 + 1;
      Ada.Streams'Elab_Spec;
      E153 := E153 + 1;
      System.File_Control_Block'Elab_Spec;
      E173 := E173 + 1;
      System.Finalization_Root'Elab_Spec;
      E155 := E155 + 1;
      Ada.Finalization'Elab_Spec;
      E151 := E151 + 1;
      System.File_Io'Elab_Body;
      E172 := E172 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E216 := E216 + 1;
      System.Storage_Pools'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E148 := E148 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E146 := E146 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E130 := E130 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E102 := E102 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E168 := E168 + 1;
      System.Pool_Global'Elab_Spec;
      E203 := E203 + 1;
      System.Sequential_Io'Elab_Spec;
      E212 := E212 + 1;
      System.Tasking.Initialization'Elab_Body;
      E234 := E234 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E242 := E242 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E246 := E246 + 1;
      System.Tasking.Queuing'Elab_Body;
      E250 := E250 + 1;
      System.Tasking.Stages'Elab_Body;
      E256 := E256 + 1;
      E177 := E177 + 1;
      P_Stephandler'Elab_Spec;
      P_Stephandler'Elab_Body;
      E175 := E175 + 1;
      P_Stephandler.Feistelhandler'Elab_Spec;
      P_Stephandler.Feistelhandler'Elab_Body;
      E207 := E207 + 1;
      P_Stephandler.Inputhandler'Elab_Spec;
      P_Stephandler.Inputhandler'Elab_Body;
      E209 := E209 + 1;
      P_Stephandler.Iphandler'Elab_Spec;
      P_Stephandler.Iphandler'Elab_Body;
      E220 := E220 + 1;
      P_Stephandler.Keyhandler'Elab_Spec;
      P_Stephandler.Keyhandler'Elab_Body;
      E222 := E222 + 1;
      P_Stephandler.Outputhandler'Elab_Spec;
      P_Stephandler.Outputhandler'Elab_Body;
      E224 := E224 + 1;
      P_Stephandler.Reverseiphandler'Elab_Spec;
      P_Stephandler.Reverseiphandler'Elab_Body;
      E226 := E226 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_mainp");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_structuraltypes.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-feistelhandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-inputhandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-iphandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-keyhandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-outputhandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\p_stephandler-reverseiphandler.o
   --   C:\Users\vadim\des-ada\Des-Ada\obj\mainp.o
   --   -LC:\Users\vadim\des-ada\Des-Ada\obj\
   --   -LC:\Users\vadim\des-ada\Des-Ada\obj\
   --   -LC:/gnat/2017/lib/gcc/i686-pc-mingw32/6.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
