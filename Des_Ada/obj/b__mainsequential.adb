pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__mainsequential.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__mainsequential.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E068 : Short_Integer; pragma Import (Ada, E068, "system__os_lib_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__io_exceptions_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "ada__containers_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "interfaces__c_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings__maps_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps__constants_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__object_reader_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__dwarf_lines_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "system__traceback__symbolic_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "interfaces__cobol_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "ada__tags_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__streams_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__file_control_block_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__finalization_root_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "ada__finalization_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__file_io_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "ada__streams__stream_io_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__storage_pools_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "system__finalization_masters_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__storage_pools__subpools_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__strings__unbounded_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__calendar_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__text_io_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__pool_global_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__sequential_io_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "p_structuraltypes_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "p_stephandler_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "p_stephandler__feistelhandler_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "p_stephandler__inputhandler_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "p_stephandler__iphandler_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "p_stephandler__keyhandler_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "p_stephandler__outputhandler_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "p_stephandler__reverseiphandler_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "p_deshandler_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E103 := E103 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "p_deshandler__finalize_spec");
      begin
         F1;
      end;
      E204 := E204 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "p_stephandler__reverseiphandler__finalize_spec");
      begin
         F2;
      end;
      E202 := E202 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "p_stephandler__outputhandler__finalize_spec");
      begin
         F3;
      end;
      E200 := E200 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "p_stephandler__keyhandler__finalize_spec");
      begin
         F4;
      end;
      E198 := E198 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "p_stephandler__iphandler__finalize_spec");
      begin
         F5;
      end;
      E187 := E187 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "p_stephandler__inputhandler__finalize_spec");
      begin
         F6;
      end;
      E185 := E185 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "p_stephandler__feistelhandler__finalize_spec");
      begin
         F7;
      end;
      E179 := E179 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "p_stephandler__finalize_spec");
      begin
         F8;
      end;
      E190 := E190 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__sequential_io__finalize_spec");
      begin
         F9;
      end;
      E181 := E181 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      E114 := E114 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "ada__text_io__finalize_spec");
      begin
         F11;
      end;
      E142 := E142 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "ada__strings__unbounded__finalize_spec");
      begin
         F12;
      end;
      E150 := E150 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__storage_pools__subpools__finalize_spec");
      begin
         F13;
      end;
      E152 := E152 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__finalization_masters__finalize_spec");
      begin
         F14;
      end;
      E194 := E194 - 1;
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
         E120 := E120 - 1;
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
      E021 := E021 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E064 := E064 + 1;
      Ada.Strings'Elab_Spec;
      E048 := E048 + 1;
      Ada.Containers'Elab_Spec;
      E036 := E036 + 1;
      System.Exceptions'Elab_Spec;
      E023 := E023 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E068 := E068 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E054 := E054 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E043 := E043 + 1;
      E074 := E074 + 1;
      E050 := E050 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E035 := E035 + 1;
      E076 := E076 + 1;
      Interfaces.Cobol'Elab_Spec;
      E173 := E173 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E095 := E095 + 1;
      Ada.Streams'Elab_Spec;
      E116 := E116 + 1;
      System.File_Control_Block'Elab_Spec;
      E124 := E124 + 1;
      System.Finalization_Root'Elab_Spec;
      E123 := E123 + 1;
      Ada.Finalization'Elab_Spec;
      E121 := E121 + 1;
      System.File_Io'Elab_Body;
      E120 := E120 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E194 := E194 + 1;
      System.Storage_Pools'Elab_Spec;
      E156 := E156 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E152 := E152 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E150 := E150 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E142 := E142 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E105 := E105 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E114 := E114 + 1;
      System.Pool_Global'Elab_Spec;
      E181 := E181 + 1;
      System.Sequential_Io'Elab_Spec;
      E190 := E190 + 1;
      E167 := E167 + 1;
      P_Stephandler'Elab_Spec;
      P_Stephandler'Elab_Body;
      E179 := E179 + 1;
      P_Stephandler.Feistelhandler'Elab_Spec;
      P_Stephandler.Feistelhandler'Elab_Body;
      E185 := E185 + 1;
      P_Stephandler.Inputhandler'Elab_Spec;
      P_Stephandler.Inputhandler'Elab_Body;
      E187 := E187 + 1;
      P_Stephandler.Iphandler'Elab_Spec;
      P_Stephandler.Iphandler'Elab_Body;
      E198 := E198 + 1;
      P_Stephandler.Keyhandler'Elab_Spec;
      P_Stephandler.Keyhandler'Elab_Body;
      E200 := E200 + 1;
      P_Stephandler.Outputhandler'Elab_Spec;
      P_Stephandler.Outputhandler'Elab_Body;
      E202 := E202 + 1;
      P_Stephandler.Reverseiphandler'Elab_Spec;
      P_Stephandler.Reverseiphandler'Elab_Body;
      E204 := E204 + 1;
      P_Deshandler'Elab_Spec;
      P_Deshandler'Elab_Body;
      E103 := E103 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_mainsequential");

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
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_structuraltypes.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-feistelhandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-inputhandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-iphandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-keyhandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-outputhandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_stephandler-reverseiphandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\p_deshandler.o
   --   C:\Users\vadim\des-ada\Des_Ada\obj\mainSequential.o
   --   -LC:\Users\vadim\des-ada\Des_Ada\obj\
   --   -LC:\Users\vadim\des-ada\Des_Ada\obj\
   --   -LC:/gnat/2017/lib/gcc/i686-pc-mingw32/6.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
